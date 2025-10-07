#!/bin/bash
source /opt/ros/noetic/setup.bash
source /ases29Oct24/devel/setup.bash # please enter here the path to ases  pkg setup.bash

echo "Finding and closing processes holding required ports"

kill $( sudo lsof -t -i :9090)
kill $( sudo lsof -t -i :3001)

echo "Starting Processes....."
roslaunch ases_mc_pkg1 nodes.launch &
pid_ROS_App=$!

sleep 5
roslaunch rosbridge_server rosbridge_websocket.launch &
pid_ROS_Bridge=$!
sleep 5

cd /UI/ # please enter here the path to UI folder

npm start &
pid_npm=$!

#sleep 5


#pids=($pid_npm, $pid_ROS_Bridge, $pid_ROS_App)
DISPLAY=:0 xrandr --output DP-2 --auto
firefox
#Function to terminate processes
sleep 2
echo "Firefox closed"

#kill -SIGINT $pid_npm
pkill -SIGINT nodemon
sleep 2
echo "NPM killed"



echo $PID
echo "Reference"

PID=$(lsof -t -i :9090)
kill $PID
sleep 5
echo "Ros Bridge Server killed"

kill $pid_ROS_App
sleep 5
echo "Node closed"

kill $( lsof -t -i :3001)
echo "Port 3001 released"	

sleep 10
