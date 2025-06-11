# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rs_yolov8: 1 messages, 0 services")

set(MSG_I_FLAGS "-Irs_yolov8:/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rs_yolov8_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg" NAME_WE)
add_custom_target(_rs_yolov8_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rs_yolov8" "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rs_yolov8
  "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rs_yolov8
)

### Generating Services

### Generating Module File
_generate_module_cpp(rs_yolov8
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rs_yolov8
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rs_yolov8_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rs_yolov8_generate_messages rs_yolov8_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg" NAME_WE)
add_dependencies(rs_yolov8_generate_messages_cpp _rs_yolov8_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rs_yolov8_gencpp)
add_dependencies(rs_yolov8_gencpp rs_yolov8_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rs_yolov8_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(rs_yolov8
  "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rs_yolov8
)

### Generating Services

### Generating Module File
_generate_module_eus(rs_yolov8
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rs_yolov8
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rs_yolov8_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rs_yolov8_generate_messages rs_yolov8_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg" NAME_WE)
add_dependencies(rs_yolov8_generate_messages_eus _rs_yolov8_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rs_yolov8_geneus)
add_dependencies(rs_yolov8_geneus rs_yolov8_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rs_yolov8_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rs_yolov8
  "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rs_yolov8
)

### Generating Services

### Generating Module File
_generate_module_lisp(rs_yolov8
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rs_yolov8
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rs_yolov8_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rs_yolov8_generate_messages rs_yolov8_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg" NAME_WE)
add_dependencies(rs_yolov8_generate_messages_lisp _rs_yolov8_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rs_yolov8_genlisp)
add_dependencies(rs_yolov8_genlisp rs_yolov8_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rs_yolov8_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(rs_yolov8
  "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rs_yolov8
)

### Generating Services

### Generating Module File
_generate_module_nodejs(rs_yolov8
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rs_yolov8
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rs_yolov8_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rs_yolov8_generate_messages rs_yolov8_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg" NAME_WE)
add_dependencies(rs_yolov8_generate_messages_nodejs _rs_yolov8_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rs_yolov8_gennodejs)
add_dependencies(rs_yolov8_gennodejs rs_yolov8_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rs_yolov8_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rs_yolov8
  "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rs_yolov8
)

### Generating Services

### Generating Module File
_generate_module_py(rs_yolov8
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rs_yolov8
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rs_yolov8_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rs_yolov8_generate_messages rs_yolov8_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lenovo/Downloads/2Ddetection/rs_yolov8_obb_ws/src/rs_yolov8/msg/Info.msg" NAME_WE)
add_dependencies(rs_yolov8_generate_messages_py _rs_yolov8_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rs_yolov8_genpy)
add_dependencies(rs_yolov8_genpy rs_yolov8_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rs_yolov8_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rs_yolov8)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rs_yolov8
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rs_yolov8_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(rs_yolov8_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rs_yolov8)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rs_yolov8
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(rs_yolov8_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(rs_yolov8_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rs_yolov8)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rs_yolov8
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rs_yolov8_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(rs_yolov8_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rs_yolov8)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rs_yolov8
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(rs_yolov8_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(rs_yolov8_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rs_yolov8)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rs_yolov8\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rs_yolov8
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rs_yolov8_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(rs_yolov8_generate_messages_py geometry_msgs_generate_messages_py)
endif()
