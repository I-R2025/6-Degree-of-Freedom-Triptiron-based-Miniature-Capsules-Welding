# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ases_mc_pkg1: 2 messages, 8 services")

set(MSG_I_FLAGS "-Iases_mc_pkg1:/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ases_mc_pkg1_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg" NAME_WE)
add_custom_target(_ases_mc_pkg1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ases_mc_pkg1" "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg" ""
)

get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg" NAME_WE)
add_custom_target(_ases_mc_pkg1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ases_mc_pkg1" "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg" ""
)

get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv" NAME_WE)
add_custom_target(_ases_mc_pkg1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ases_mc_pkg1" "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv" ""
)

get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv" NAME_WE)
add_custom_target(_ases_mc_pkg1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ases_mc_pkg1" "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv" ""
)

get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv" NAME_WE)
add_custom_target(_ases_mc_pkg1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ases_mc_pkg1" "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv" ""
)

get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv" NAME_WE)
add_custom_target(_ases_mc_pkg1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ases_mc_pkg1" "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv" ""
)

get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv" NAME_WE)
add_custom_target(_ases_mc_pkg1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ases_mc_pkg1" "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv" ""
)

get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv" NAME_WE)
add_custom_target(_ases_mc_pkg1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ases_mc_pkg1" "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv" ""
)

get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv" NAME_WE)
add_custom_target(_ases_mc_pkg1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ases_mc_pkg1" "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv" ""
)

get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv" NAME_WE)
add_custom_target(_ases_mc_pkg1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ases_mc_pkg1" "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_msg_cpp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
)

### Generating Services
_generate_srv_cpp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_cpp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_cpp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_cpp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_cpp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_cpp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_cpp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_cpp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
)

### Generating Module File
_generate_module_cpp(ases_mc_pkg1
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ases_mc_pkg1_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ases_mc_pkg1_generate_messages ases_mc_pkg1_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_cpp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_cpp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_cpp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_cpp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_cpp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_cpp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_cpp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_cpp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_cpp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_cpp _ases_mc_pkg1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ases_mc_pkg1_gencpp)
add_dependencies(ases_mc_pkg1_gencpp ases_mc_pkg1_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ases_mc_pkg1_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
)
_generate_msg_eus(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
)

### Generating Services
_generate_srv_eus(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_eus(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_eus(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_eus(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_eus(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_eus(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_eus(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_eus(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
)

### Generating Module File
_generate_module_eus(ases_mc_pkg1
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ases_mc_pkg1_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ases_mc_pkg1_generate_messages ases_mc_pkg1_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_eus _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_eus _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_eus _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_eus _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_eus _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_eus _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_eus _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_eus _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_eus _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_eus _ases_mc_pkg1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ases_mc_pkg1_geneus)
add_dependencies(ases_mc_pkg1_geneus ases_mc_pkg1_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ases_mc_pkg1_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_msg_lisp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
)

### Generating Services
_generate_srv_lisp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_lisp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_lisp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_lisp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_lisp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_lisp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_lisp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_lisp(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
)

### Generating Module File
_generate_module_lisp(ases_mc_pkg1
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ases_mc_pkg1_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ases_mc_pkg1_generate_messages ases_mc_pkg1_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_lisp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_lisp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_lisp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_lisp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_lisp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_lisp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_lisp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_lisp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_lisp _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_lisp _ases_mc_pkg1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ases_mc_pkg1_genlisp)
add_dependencies(ases_mc_pkg1_genlisp ases_mc_pkg1_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ases_mc_pkg1_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
)
_generate_msg_nodejs(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
)

### Generating Services
_generate_srv_nodejs(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_nodejs(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_nodejs(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_nodejs(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_nodejs(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_nodejs(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_nodejs(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_nodejs(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
)

### Generating Module File
_generate_module_nodejs(ases_mc_pkg1
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ases_mc_pkg1_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ases_mc_pkg1_generate_messages ases_mc_pkg1_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_nodejs _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_nodejs _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_nodejs _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_nodejs _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_nodejs _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_nodejs _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_nodejs _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_nodejs _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_nodejs _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_nodejs _ases_mc_pkg1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ases_mc_pkg1_gennodejs)
add_dependencies(ases_mc_pkg1_gennodejs ases_mc_pkg1_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ases_mc_pkg1_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
)
_generate_msg_py(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
)

### Generating Services
_generate_srv_py(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_py(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_py(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_py(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_py(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_py(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_py(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
)
_generate_srv_py(ases_mc_pkg1
  "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
)

### Generating Module File
_generate_module_py(ases_mc_pkg1
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ases_mc_pkg1_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ases_mc_pkg1_generate_messages ases_mc_pkg1_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_py _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_py _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_py _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_py _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_py _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_py _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_py _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_py _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_py _ases_mc_pkg1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv" NAME_WE)
add_dependencies(ases_mc_pkg1_generate_messages_py _ases_mc_pkg1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ases_mc_pkg1_genpy)
add_dependencies(ases_mc_pkg1_genpy ases_mc_pkg1_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ases_mc_pkg1_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ases_mc_pkg1
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ases_mc_pkg1_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ases_mc_pkg1
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ases_mc_pkg1_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ases_mc_pkg1
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ases_mc_pkg1_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ases_mc_pkg1
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ases_mc_pkg1_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ases_mc_pkg1
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ases_mc_pkg1_generate_messages_py std_msgs_generate_messages_py)
endif()
