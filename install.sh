#! /bin/bash
# Reference: https://github.com/realsenseai/realsense-ros
# Reference: https://github.com/realsenseai/librealsense/blob/master/doc/installation.md


echo "╔══╣ Install: RealSense ROS 2 Wrapper (STARTING) ╠══╗"

# Keep track of the current directory
DIR=`pwd`

# Compile and install librealsense2 from source
if [ ! -d ~/librealsense ]; then
   cd ~/
   git clone https://github.com/realsenseai/librealsense.git
   cd librealsense/
   git checkout v2.57.6
   ./scripts/setup_udev_rules.sh
   mkdir build && cd build
   cmake ..
   make -j$((`nproc`-1))
   sudo make install
else
   echo "librealsense already exists, skipping installation"
fi

# Install dependencies
sudo apt update
sudo apt install -y \
   ros-$ROS_DISTRO-rclcpp \
   ros-$ROS_DISTRO-rclcpp-components \
   ros-$ROS_DISTRO-rclcpp-lifecycle \
   ros-$ROS_DISTRO-ros2topic \
   ros-$ROS_DISTRO-launch-ros \
   ros-$ROS_DISTRO-eigenpy \
   ros-$ROS_DISTRO-cv-bridge \
   ros-$ROS_DISTRO-image-transport \
   ros-$ROS_DISTRO-tf2 \
   ros-$ROS_DISTRO-tf2-ros \
   ros-$ROS_DISTRO-tf2-ros-py \
   ros-$ROS_DISTRO-sensor-msgs \
   ros-$ROS_DISTRO-sensor-msgs-py \
   ros-$ROS_DISTRO-geometry-msgs \
   ros-$ROS_DISTRO-builtin-interfaces \
   ros-$ROS_DISTRO-std-msgs \
   ros-$ROS_DISTRO-nav-msgs \
   ros-$ROS_DISTRO-diagnostic-updater \
   ros-$ROS_DISTRO-xacro

# Go back to previous directory
cd ${DIR}


echo "╚══╣ Install: RealSense ROS 2 Wrapper (FINISHED) ╠══╝"
