#! /bin/bash
# Reference: https://github.com/IntelRealSense/realsense-ros#installation-instructions
# Reference: https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md#installing-the-packages

echo "╔══╣ Install: RealSense ROS 2 Wrapper (STARTING) ╠══╗"

# Install librealsense2 debian package from Intel servers
sudo mkdir -p /etc/apt/keyrings
curl -sSf https://librealsense.intel.com/Debian/librealsense.pgp | sudo tee /etc/apt/keyrings/librealsense.pgp > /dev/null

sudo apt-get update
sudo apt install -y \
   apt-transport-https

echo "deb [signed-by=/etc/apt/keyrings/librealsense.pgp] https://librealsense.intel.com/Debian/apt-repo `lsb_release -cs` main" | \
sudo tee /etc/apt/sources.list.d/librealsense.list
sudo apt-get update

sudo apt-get install -y librealsense2-dkms
sudo apt-get install -y librealsense2-utils

sudo apt-get install -y librealsense2-dev
sudo apt-get install -y librealsense2-dbg

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