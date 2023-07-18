aux_source_directory(. SRC_LIST)
add_library(ThreadPool SHARED ${SRC_LIST})
target_link_libraries(ThreadPool pthread)
