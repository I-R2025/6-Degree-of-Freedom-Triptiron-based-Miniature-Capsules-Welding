# Install script for directory: /media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/media/izza/Data/OP/latest/latest/control/control_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ases_mc_pkg1/msg" TYPE FILE FILES
    "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/status.msg"
    "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/msg/state.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ases_mc_pkg1/srv" TYPE FILE FILES
    "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/axis_motion.srv"
    "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/trajectory.srv"
    "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/parking.srv"
    "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/homing_axis_srv.srv"
    "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/laser_control.srv"
    "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/welding.srv"
    "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/automatic_job.srv"
    "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/srv/grip_release.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ases_mc_pkg1/cmake" TYPE FILE FILES "/media/izza/Data/OP/latest/latest/control/control_ws/build/ases_mc_pkg1/catkin_generated/installspace/ases_mc_pkg1-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/media/izza/Data/OP/latest/latest/control/control_ws/devel/include/ases_mc_pkg1")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/media/izza/Data/OP/latest/latest/control/control_ws/devel/share/roseus/ros/ases_mc_pkg1")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/media/izza/Data/OP/latest/latest/control/control_ws/devel/share/common-lisp/ros/ases_mc_pkg1")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/media/izza/Data/OP/latest/latest/control/control_ws/devel/share/gennodejs/ros/ases_mc_pkg1")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/media/izza/Data/OP/latest/latest/control/control_ws/devel/lib/python3/dist-packages/ases_mc_pkg1")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/media/izza/Data/OP/latest/latest/control/control_ws/devel/lib/python3/dist-packages/ases_mc_pkg1")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/izza/Data/OP/latest/latest/control/control_ws/build/ases_mc_pkg1/catkin_generated/installspace/ases_mc_pkg1.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ases_mc_pkg1/cmake" TYPE FILE FILES "/media/izza/Data/OP/latest/latest/control/control_ws/build/ases_mc_pkg1/catkin_generated/installspace/ases_mc_pkg1-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ases_mc_pkg1/cmake" TYPE FILE FILES
    "/media/izza/Data/OP/latest/latest/control/control_ws/build/ases_mc_pkg1/catkin_generated/installspace/ases_mc_pkg1Config.cmake"
    "/media/izza/Data/OP/latest/latest/control/control_ws/build/ases_mc_pkg1/catkin_generated/installspace/ases_mc_pkg1Config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ases_mc_pkg1" TYPE FILE FILES "/media/izza/Data/OP/latest/latest/control/control_ws/src/ases_mc_pkg1/package.xml")
endif()

