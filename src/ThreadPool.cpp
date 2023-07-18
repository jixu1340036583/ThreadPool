#include "ThreadPool.h"

namespace tp{
ThreadPool::ThreadPool(ThreadPoolConfig config) : config_(config), joiners(worker_threads_) {
    this->total_function_num_.store(0);
    this->waiting_thread_num_.store(0);

    this->thread_id_.store(0);
    this->is_shutdown_.store(false);
    this->is_shutdown_now_.store(false);

    if (IsValidConfig(config_)) {
        is_available_.store(true);
    } else {
        is_available_.store(false);
    }
}


bool ThreadPool::IsValidConfig(ThreadPoolConfig config) {
    if (config.core_threads < 1 || config.max_threads < config.core_threads || config.time_out.count() < 1) 
        return false;
    return true;
}

bool ThreadPool::Start(){
    if(!IsAvailable()) return false;
    int core_thread_num = config_.core_threads;
    LOG_DEBUG("Init thread num：%d.", core_thread_num);
    while(core_thread_num-- > 0){
        AddThread(GetNextThreadId(), ThreadFlag::kCore);
    }
    LOG_DEBUG("Init threadpool end.");
    return true;
}

void ThreadPool::AddThread(int id, ThreadFlag thread_flag) {
    LOG_DEBUG("Add Thread %d, flag: %d.", id, static_cast<int>(thread_flag));
    ThreadWrapperPtr thread_ptr = std::make_shared<ThreadWrapper>(); // 线程包装器的指针
    thread_ptr->id.store(id); // 设置线程id
    thread_ptr->flag.store(thread_flag); // 设置线程类型
    // 启动一个线程
    thread_ptr->ptr = std::make_shared<std::thread>(std::thread(&ThreadPool::work_thread, this, thread_ptr));
    // 线程加入线程队列
    worker_threads_.insert({id, std::move(thread_ptr)});
}

void ThreadPool::work_thread(ThreadWrapperPtr thread_ptr){
    while(1) {
        std::function<void()> task;
        {
            if (thread_ptr->state.load() == ThreadState::kStop) break; // 如果当前线程是停止状态，结束循环  
            LOG_DEBUG("thread id %d start waiting.", thread_ptr->id.load());
            thread_ptr->state.store(ThreadState::kWaiting); // 先将线程设置成等待状态
            ++this->waiting_thread_num_; // 等待的线程数量+1
            bool is_timeout = false;

            ThreadPoolLock lock(this->task_mutex_);

            if (thread_ptr->flag.load() == ThreadFlag::kCore) { // 如果是核心线程类型
                // 被唤醒时，如果线程池准备关闭，或者任务队列不空，才能往下执行；否则继续阻塞
                this->task_cv_.wait(lock, [this, thread_ptr] {
                    return (this->is_shutdown_ || this->is_shutdown_now_ || !this->tasks_.empty());
                });
            } 
            else{ // 如果是临时线程，如果不符合条件，阻塞time_out时间，到时间后被唤醒
                  // 唤醒后，如果有任意一个条件符合，都返回true, is_timeout返回false，没超时；
                is_timeout = !this->task_cv_.wait_for(lock, this->config_.time_out, [this, thread_ptr] {
                    return (this->is_shutdown_ || this->is_shutdown_now_ || !this->tasks_.empty() || 
                        thread_ptr->state.load() == ThreadState::kStop);
                });
                if (is_timeout) thread_ptr->state.store(ThreadState::kStop);
                
                // 如果临时线程状态为停止，则终止循环
                if (thread_ptr->state.load() == ThreadState::kStop) {
                    ThreadPool::ThreadPoolLock(wk_mutex_);
                    worker_threads_.erase(thread_ptr->id.load());
                    LOG_DEBUG("cache thread id %d state stop.", thread_ptr->id.load());
                    break;
                }
            }
            
            --this->waiting_thread_num_;
            LOG_DEBUG("thread id %d end waiting.", thread_ptr->id.load());

            // 如果不是立即关闭，且任务队列不为空，那么继续执行
            if (this->is_shutdown_ && this->tasks_.empty()) {
                LOG_DEBUG("thread id %d shutdown!", thread_ptr->id.load());
                break;
            }
            // 立即关闭线程池，不论任务队列是否为空
            if (this->is_shutdown_now_) {
                LOG_DEBUG("thread id %d shutdown now!", thread_ptr->id.load());
                break;
            }
            // 线程状态变为运行态
            thread_ptr->state.store(ThreadState::kRunning);
            // task从任务队列中提取一个任务
            task = std::move(this->tasks_.front()); tasks_.pop();
        }
        // 执行任务
        task();
    }
    LOG_DEBUG("thread id %d end running!", thread_ptr->id.load());
}    


void ThreadPool::Resize(int thread_num) {
    if (thread_num < config_.core_threads) return;
    int old_thread_num = worker_threads_.size();
    std::cout << "old num " << old_thread_num << " resize " << thread_num << std::endl;
    LOG_DEBUG("old num:%d, resize num:%d ", old_thread_num, thread_num);
    ThreadPool::ThreadPoolLock(wk_mutex_);
    if (thread_num > old_thread_num) {
        while (thread_num-- > old_thread_num) {
            AddThread(GetNextThreadId(), ThreadFlag::kCache);
        }
    } else {
        int diff = old_thread_num - thread_num;
        auto iter = worker_threads_.begin();
        while (iter != worker_threads_.end()) {
            if (diff == 0) break;
            auto thread_ptr = iter->second;
            if (thread_ptr->flag.load() == ThreadFlag::kCache &&
                thread_ptr->state.load() == ThreadState::kWaiting) {  // wait
                thread_ptr->state.store(ThreadState::kStop);          // stop;
                --diff;
            } 
            else ++iter;
        }
    }
    this->task_cv_.notify_all();
}
void ThreadPool::ShutDown(bool is_now) {
    if (is_available_.load()) {
        if (is_now) {
            this->is_shutdown_now_.store(true); // 就算任务队列中还有任务也会立即关闭
        } else {
            this->is_shutdown_.store(true);
        }
        this->task_cv_.notify_all();
    }
}

};