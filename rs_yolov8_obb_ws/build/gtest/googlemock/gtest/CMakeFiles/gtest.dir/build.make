# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build

# Include any dependencies generated for this target.
include gtest/googlemock/gtest/CMakeFiles/gtest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include gtest/googlemock/gtest/CMakeFiles/gtest.dir/compiler_depend.make

# Include the progress variables for this target.
include gtest/googlemock/gtest/CMakeFiles/gtest.dir/progress.make

# Include the compile flags for this target's objects.
include gtest/googlemock/gtest/CMakeFiles/gtest.dir/flags.make

gtest/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o: gtest/googlemock/gtest/CMakeFiles/gtest.dir/flags.make
gtest/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o: /usr/src/googletest/googletest/src/gtest-all.cc
gtest/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o: gtest/googlemock/gtest/CMakeFiles/gtest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object gtest/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o"
	cd /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/gtest/googlemock/gtest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT gtest/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o -MF CMakeFiles/gtest.dir/src/gtest-all.cc.o.d -o CMakeFiles/gtest.dir/src/gtest-all.cc.o -c /usr/src/googletest/googletest/src/gtest-all.cc

gtest/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gtest.dir/src/gtest-all.cc.i"
	cd /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/gtest/googlemock/gtest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/googletest/googletest/src/gtest-all.cc > CMakeFiles/gtest.dir/src/gtest-all.cc.i

gtest/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gtest.dir/src/gtest-all.cc.s"
	cd /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/gtest/googlemock/gtest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/googletest/googletest/src/gtest-all.cc -o CMakeFiles/gtest.dir/src/gtest-all.cc.s

# Object files for target gtest
gtest_OBJECTS = \
"CMakeFiles/gtest.dir/src/gtest-all.cc.o"

# External object files for target gtest
gtest_EXTERNAL_OBJECTS =

gtest/googlemock/gtest/libgtest.so: gtest/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
gtest/googlemock/gtest/libgtest.so: gtest/googlemock/gtest/CMakeFiles/gtest.dir/build.make
gtest/googlemock/gtest/libgtest.so: gtest/googlemock/gtest/CMakeFiles/gtest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libgtest.so"
	cd /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/gtest/googlemock/gtest && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gtest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
gtest/googlemock/gtest/CMakeFiles/gtest.dir/build: gtest/googlemock/gtest/libgtest.so
.PHONY : gtest/googlemock/gtest/CMakeFiles/gtest.dir/build

gtest/googlemock/gtest/CMakeFiles/gtest.dir/clean:
	cd /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/gtest/googlemock/gtest && $(CMAKE_COMMAND) -P CMakeFiles/gtest.dir/cmake_clean.cmake
.PHONY : gtest/googlemock/gtest/CMakeFiles/gtest.dir/clean

gtest/googlemock/gtest/CMakeFiles/gtest.dir/depend:
	cd /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src /usr/src/googletest/googletest /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/gtest/googlemock/gtest /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/gtest/googlemock/gtest/CMakeFiles/gtest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : gtest/googlemock/gtest/CMakeFiles/gtest.dir/depend

