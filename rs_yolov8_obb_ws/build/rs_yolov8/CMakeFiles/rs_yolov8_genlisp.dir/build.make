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

# Utility rule file for rs_yolov8_genlisp.

# Include any custom commands dependencies for this target.
include rs_yolov8/CMakeFiles/rs_yolov8_genlisp.dir/compiler_depend.make

# Include the progress variables for this target.
include rs_yolov8/CMakeFiles/rs_yolov8_genlisp.dir/progress.make

rs_yolov8_genlisp: rs_yolov8/CMakeFiles/rs_yolov8_genlisp.dir/build.make
.PHONY : rs_yolov8_genlisp

# Rule to build all files generated by this target.
rs_yolov8/CMakeFiles/rs_yolov8_genlisp.dir/build: rs_yolov8_genlisp
.PHONY : rs_yolov8/CMakeFiles/rs_yolov8_genlisp.dir/build

rs_yolov8/CMakeFiles/rs_yolov8_genlisp.dir/clean:
	cd /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/rs_yolov8 && $(CMAKE_COMMAND) -P CMakeFiles/rs_yolov8_genlisp.dir/cmake_clean.cmake
.PHONY : rs_yolov8/CMakeFiles/rs_yolov8_genlisp.dir/clean

rs_yolov8/CMakeFiles/rs_yolov8_genlisp.dir/depend:
	cd /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8 /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/rs_yolov8 /home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/build/rs_yolov8/CMakeFiles/rs_yolov8_genlisp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : rs_yolov8/CMakeFiles/rs_yolov8_genlisp.dir/depend

