#include <iostream>
#include "ThreadPool.h"
using std::cout;
using std::endl;

int test(int a, int b){
    return a + b;
}
void test1(){
    tp::ThreadPool pool(tp::ThreadPoolConfig{4, 5, 6, std::chrono::seconds(4)});
    pool.Start();
    std::this_thread::sleep_for(std::chrono::seconds(2));

    for (int i = 0; i < 10; ++i) {
        std::shared_ptr<std::future<int>> res = pool.Run(test, i, i);
        LOG_INFO("the ith res = %d.", res->get());
    }
    return;
}
void test2(){
    tp::ThreadPool pool(tp::ThreadPoolConfig{4, 5, 6, std::chrono::seconds(4)});
    pool.Start();
    std::this_thread::sleep_for(std::chrono::seconds(2));

    for (int i = 0; i < 10; ++i) {
        pool.Run([](){while(1);});
    }
    return;
}

int main() {
    test1();
}