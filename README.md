# ROS Wrapper for Intel&reg; RealSense&trade; Devices

## 参考DOCファイル（公式サイト）
https://github.com/IntelRealSense/realsense-ros

## セットアップ手順（公式サイト）
https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md

## 動作環境
- Ubuntu 20.04
- ROS Noetic

## インストール

```
cd ~/catkin_ws/src/
git clone https://github.com/TeamSOBITS/realsense_ros
cd realsense_ros
bash install.sh
```

## install.shの中身

``` bash
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
```

## realsense-viewer＆ROSパッケージの起動
``` bash
#realsense-viewer
realsense-viewer
```

``` bash
#ROSパッケージ
roslaunch realsense2_camera rs_rgbd.launch
```

## Tips
RealSenseシリーズは事前に設定値をプリセットとして保存できる機能を知りたい方は,[こちらへ](https://qiita.com/porizou1/items/2d8d23e35f42206ddaa0)

Intel RealSense Lidar Camera L515 Rangeに関する[公式サイト](https://www.intelrealsense.com/optimizing-the-lidar-camera-l515-range/)

