#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

# 1. Set up sources
sudo apt update
sudo apt install -y curl gnupg lsb-release

# 2. Add the ROS key
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
# 3. Add the ROS repository
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# 4. Update package index
sudo apt update

# 5. Install ROS Noetic Desktop-Full
sudo apt install -y ros-noetic-desktop-full

# 6. Source ROS setup
if [ -f /opt/ros/noetic/setup.bash ]; then
  source /opt/ros/noetic/setup.bash
else
  echo "ROS setup.bash not found. Installation may have failed."
  exit 1
fi

# 7. Install dependencies for building packages
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# 8. Initialize rosdep
sudo rosdep init || true
rosdep update
