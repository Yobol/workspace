#!/bin/bash

# http://wiki.ros.org/noetic/Installation/Ubuntu

sudo apt-get update
sudo apt-get install -y curl zsh

# setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# setup your keys
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# installation
sudo apt-get update

# Everything in Desktop plus 2D/3D simulators and 2D/3D perception
sudo apt install -y ros-noetic-desktop-full
# Everything in ROS-Base plus tools like rqt and rviz
# sudo apt install -y ros-noetic-desktop
# (Bare Bones) ROS packaging, build, and communication libraries. No GUI tools.
# sudo apt install -y ros-noetic-ros-base

# There are even more packages available in ROS. You can always install a specific package directly.
# To find available packages, see (ROS Index](https://index.ros.org/packages/page/1/time/#noetic) or use 'apt search ros-noetic'
# sudo apt install -y ros-noetic-<Package Name>

# You must source this script in every bash terminal you use ROS in.
# echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
# source ~/.bashrc
echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc
source ~/.zshrc

# To install this tool and other dependencies for building ROS packages, run:
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
# sudo apt update --fix-missing
# sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# Initialize rosdep
sudo rosdep init
rosdep update