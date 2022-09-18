#! /bin/bash
# Reference: https://github.com/IntelRealSense/realsense-ros#installation-instructions
# Reference: https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md#installing-the-packages

echo "╔══╣ Install: RealSense ROS Wrapper (STARTING) ╠══╗"

# 以前のパッケージを削除する
dpkg -l | grep "realsense" | cut -d " " -f 3 | xargs sudo dpkg --purge


#サーバーの公開鍵の登録
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE

#リポジトリの登録
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
sudo apt update

#librealsenseのインストール
sudo apt-get install -y \
    librealsense2-dkms \
    librealsense2-utils \
    librealsense2-dev \
    librealsense2-dbg

#ddynamic_reconfigureをアップデート
sudo apt install -y \
     ros-$ROS_DISTRO-ddynamic-reconfigure

#必要なROSパッケージのインストール
# sudo apt-get install -y \
#     ros-$ROS_DISTRO-realsense2-camera


echo "╚══╣ Install: RealSense ROS Wrapper (FINISHED) ╠══╝"
echo "ホスト側の端末でudevにデバイス情報を記述してください"
