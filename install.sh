#! /bin/bash
# Reference: https://github.com/IntelRealSense/realsense-ros#installation-instructions
# Reference: https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md#installing-the-packages

echo "╔══╣ Install: RealSense ROS Wrapper (STARTING) ╠══╗"


# Delete previous realseanse packages
dpkg -l | grep "realsense" | cut -d " " -f 3 | xargs -t sudo apt-get -y purge


# Add server key to apt-key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE

# Add server to list of repositories
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
sudo apt update

# Install the libraries
sudo apt-get install -y \
    librealsense2-dkms \
    librealsense2-utils \
    librealsense2-dev \
    librealsense2-dbg

# Install ROS dependencies
sudo apt install -y \
     ros-$ROS_DISTRO-ddynamic-reconfigure \
     ros-$ROS_DISTRO-imu-filter-madgwick


echo "╚══╣ Install: RealSense ROS Wrapper (FINISHED) ╠══╝"
