# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jixu/Mycode/ThreadPool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jixu/Mycode/ThreadPool/build

# Include any dependencies generated for this target.
include src/CMakeFiles/ThreadPool.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/ThreadPool.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/ThreadPool.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/ThreadPool.dir/flags.make

src/CMakeFiles/ThreadPool.dir/Logger.cc.o: src/CMakeFiles/ThreadPool.dir/flags.make
src/CMakeFiles/ThreadPool.dir/Logger.cc.o: ../src/Logger.cc
src/CMakeFiles/ThreadPool.dir/Logger.cc.o: src/CMakeFiles/ThreadPool.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jixu/Mycode/ThreadPool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/ThreadPool.dir/Logger.cc.o"
	cd /home/jixu/Mycode/ThreadPool/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/ThreadPool.dir/Logger.cc.o -MF CMakeFiles/ThreadPool.dir/Logger.cc.o.d -o CMakeFiles/ThreadPool.dir/Logger.cc.o -c /home/jixu/Mycode/ThreadPool/src/Logger.cc

src/CMakeFiles/ThreadPool.dir/Logger.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ThreadPool.dir/Logger.cc.i"
	cd /home/jixu/Mycode/ThreadPool/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jixu/Mycode/ThreadPool/src/Logger.cc > CMakeFiles/ThreadPool.dir/Logger.cc.i

src/CMakeFiles/ThreadPool.dir/Logger.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ThreadPool.dir/Logger.cc.s"
	cd /home/jixu/Mycode/ThreadPool/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jixu/Mycode/ThreadPool/src/Logger.cc -o CMakeFiles/ThreadPool.dir/Logger.cc.s

src/CMakeFiles/ThreadPool.dir/ThreadPool.cpp.o: src/CMakeFiles/ThreadPool.dir/flags.make
src/CMakeFiles/ThreadPool.dir/ThreadPool.cpp.o: ../src/ThreadPool.cpp
src/CMakeFiles/ThreadPool.dir/ThreadPool.cpp.o: src/CMakeFiles/ThreadPool.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jixu/Mycode/ThreadPool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/ThreadPool.dir/ThreadPool.cpp.o"
	cd /home/jixu/Mycode/ThreadPool/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/ThreadPool.dir/ThreadPool.cpp.o -MF CMakeFiles/ThreadPool.dir/ThreadPool.cpp.o.d -o CMakeFiles/ThreadPool.dir/ThreadPool.cpp.o -c /home/jixu/Mycode/ThreadPool/src/ThreadPool.cpp

src/CMakeFiles/ThreadPool.dir/ThreadPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ThreadPool.dir/ThreadPool.cpp.i"
	cd /home/jixu/Mycode/ThreadPool/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jixu/Mycode/ThreadPool/src/ThreadPool.cpp > CMakeFiles/ThreadPool.dir/ThreadPool.cpp.i

src/CMakeFiles/ThreadPool.dir/ThreadPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ThreadPool.dir/ThreadPool.cpp.s"
	cd /home/jixu/Mycode/ThreadPool/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jixu/Mycode/ThreadPool/src/ThreadPool.cpp -o CMakeFiles/ThreadPool.dir/ThreadPool.cpp.s

src/CMakeFiles/ThreadPool.dir/Timestamp.cc.o: src/CMakeFiles/ThreadPool.dir/flags.make
src/CMakeFiles/ThreadPool.dir/Timestamp.cc.o: ../src/Timestamp.cc
src/CMakeFiles/ThreadPool.dir/Timestamp.cc.o: src/CMakeFiles/ThreadPool.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jixu/Mycode/ThreadPool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/ThreadPool.dir/Timestamp.cc.o"
	cd /home/jixu/Mycode/ThreadPool/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/ThreadPool.dir/Timestamp.cc.o -MF CMakeFiles/ThreadPool.dir/Timestamp.cc.o.d -o CMakeFiles/ThreadPool.dir/Timestamp.cc.o -c /home/jixu/Mycode/ThreadPool/src/Timestamp.cc

src/CMakeFiles/ThreadPool.dir/Timestamp.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ThreadPool.dir/Timestamp.cc.i"
	cd /home/jixu/Mycode/ThreadPool/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jixu/Mycode/ThreadPool/src/Timestamp.cc > CMakeFiles/ThreadPool.dir/Timestamp.cc.i

src/CMakeFiles/ThreadPool.dir/Timestamp.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ThreadPool.dir/Timestamp.cc.s"
	cd /home/jixu/Mycode/ThreadPool/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jixu/Mycode/ThreadPool/src/Timestamp.cc -o CMakeFiles/ThreadPool.dir/Timestamp.cc.s

# Object files for target ThreadPool
ThreadPool_OBJECTS = \
"CMakeFiles/ThreadPool.dir/Logger.cc.o" \
"CMakeFiles/ThreadPool.dir/ThreadPool.cpp.o" \
"CMakeFiles/ThreadPool.dir/Timestamp.cc.o"

# External object files for target ThreadPool
ThreadPool_EXTERNAL_OBJECTS =

../lib/libThreadPool.so: src/CMakeFiles/ThreadPool.dir/Logger.cc.o
../lib/libThreadPool.so: src/CMakeFiles/ThreadPool.dir/ThreadPool.cpp.o
../lib/libThreadPool.so: src/CMakeFiles/ThreadPool.dir/Timestamp.cc.o
../lib/libThreadPool.so: src/CMakeFiles/ThreadPool.dir/build.make
../lib/libThreadPool.so: src/CMakeFiles/ThreadPool.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jixu/Mycode/ThreadPool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library ../../lib/libThreadPool.so"
	cd /home/jixu/Mycode/ThreadPool/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ThreadPool.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/ThreadPool.dir/build: ../lib/libThreadPool.so
.PHONY : src/CMakeFiles/ThreadPool.dir/build

src/CMakeFiles/ThreadPool.dir/clean:
	cd /home/jixu/Mycode/ThreadPool/build/src && $(CMAKE_COMMAND) -P CMakeFiles/ThreadPool.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/ThreadPool.dir/clean

src/CMakeFiles/ThreadPool.dir/depend:
	cd /home/jixu/Mycode/ThreadPool/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jixu/Mycode/ThreadPool /home/jixu/Mycode/ThreadPool/src /home/jixu/Mycode/ThreadPool/build /home/jixu/Mycode/ThreadPool/build/src /home/jixu/Mycode/ThreadPool/build/src/CMakeFiles/ThreadPool.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/ThreadPool.dir/depend

