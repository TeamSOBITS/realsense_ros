#! /bin/bash
# Reference: https://github.com/IntelRealSense/realsense-ros#installation-instructions
# Reference: https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md#installing-the-packages

echo "╔══╣ Install: RealSense ROS 2 Wrapper (STARTING) ╠══╗"

# Install librealsense2 debian package from Intel servers
sudo apt install ros-$ROS_DISTRO-librealsense2*

# Install Intel® RealSense™ ROS2 wrapper dependencies
sudo apt-get update
sudo apt install -y \
   ros-$ROS_DISTRO-eigenpy \
   ros-$ROS_DISTRO-cv-bridge \
   ros-$ROS_DISTRO-image-transport \
   ros-$ROS_DISTRO-sensor-msgs \
   ros-$ROS_DISTRO-std-msgs \
   ros-$ROS_DISTRO-nav-msgs \
   ros-$ROS_DISTRO-tf2 \
   ros-$ROS_DISTRO-tf2-ros \
   ros-$ROS_DISTRO-diagnostic-updater \
   ros-$ROS_DISTRO-tf2-ros-py \
   ros-$ROS_DISTRO-sensor-msgs-py \
   ros-$ROS_DISTRO-ros2topic \
   ros-$ROS_DISTRO-geometry-msgs \
   ros-$ROS_DISTRO-rclcpp-components \
   ros-$ROS_DISTRO-launch-ros \
   ros-$ROS_DISTRO-xacro


echo "╚══╣ Install: RealSense ROS 2 Wrapper (FINISHED) ╠══╝"