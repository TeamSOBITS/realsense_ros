<a name="readme-top"></a>

[JA](README.md) | [EN](README.en.md)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]

# ROS Wrapper for Intel&reg; RealSense&trade; Devices

<!-- 目次 -->
<details>
  <summary>目次</summary>
  <ol>
    <li>
      <a href="#概要">概要</a>
    </li>
    <li>
      <a href="#環境構築">環境構築</a>
      <ul>
        <li><a href="#環境条件">環境条件</a></li>
        <li><a href="#インストール方法">インストール方法</a></li>
      </ul>
    </li>
    <li>
    　<a href="#実行・操作方法">実行・操作方法</a>
      <ul>
        <li><a href="#動作確認">動作確認</a></li>
        <li><a href="#Rviz上の可視化">Rviz上の可視化</a></li>
        <li><a href="#デモ：Tracking">デモ：Tracking</a></li>
        <li><a href="#デモ：RtabMap">デモ：RtabMap</a></li>
      </ul>
    </li>
    <li>
    <li><a href="#マイルストーン">マイルストーン</a></li>
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <li><a href="#参考文献">参考文献</a></li>
  </ol>
</details>


<!-- レポジトリの概要 -->
## 概要

Intel&reg; RealSense&trade;が作成した[ROS Wrapper for Intel&reg; RealSense&trade; Devices](https://github.com/IntelRealSense/realsense-ros)を基に，`D405`カメラにも対応させたレポジトリです．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


<!-- セットアップ -->
## セットアップ

ここで，本レポジトリのセットアップ方法について説明します．

### 環境条件

まず，以下の環境を整えてから，次のインストール段階に進んでください．

| System  | Version |
| ------------- | ------------- |
| Ubuntu | 20.04 (Focal Fossa) |
| ROS | Noetic Ninjemys |
| LibRealSense2 | v2.50.0 |
| D400 Firmware | v5.13.0.50 |
| L500 Firmware | v1.5.8.1 + |

> [!NOTE]
> `Ubuntu`や`ROS`のインストール方法に関しては，[SOBIT Manual](https://github.com/TeamSOBITS/sobits_manual#%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)に参照してください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### インストール方法

1. ROSの`src`フォルダに移動します．
   ```sh
   $ roscd
   # もしくは，"cd ~/catkin_ws/"へ移動．
   $ cd src/
   ```
2. 本レポジトリをcloneします．
   ```sh
   $ git clone https://github.com/TeamSOBITS/realsense_ros
   ```
3. レポジトリの中へ移動します．
   ```sh
   $ cd realsense_ros/
   ```
4. 依存パッケージをインストールします．
   ```sh
   $ bash install.sh
   ```

> [!NOTE]
> [install.sh](install.sh)を実行することによって，必要とされる[Intel&reg; RealSense&trade; SDK 2.0](https://github.com/IntelRealSense/librealsense)が自動的にインストールされます．

5. パッケージをコンパイルします．
   ```sh
   $ roscd
   # もしくは，"cd ~/catkin_ws/"へ移動．
   $ catkin_make
   ```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



<!-- 実行・操作方法 -->
## 実行・操作方法

カメラ単体で使用する場合は，[rs_rgbd.launch](realsense2_camera/launch/rs_rgbd.launch)を次の手順で実行してください．


1. 必要に応じて[rs_rgbd.launch](realsense2_camera/launch/rs_rgbd.launch)のパラメータを更新してください．
   ```xml
    <!-- (MUST) Add Prefix to tf frame. No need to add '_' in the end. -->
    <arg name="camera"              default="camera"/>
    <!-- Visualize Rviz -->
    <arg name="open_rviz"         default="true"/>
    ...
   ```
> [!NOTE]
> 使用したい機能に応じて，`true`か`false`かに書き換えてください．

2. [rs_rgbd.launch](realsense2_camera/launch/rs_rgbd.launch)というlaunchファイルを実行します．
   ```sh
   $ roslaunch realsense2_camera rs_rgbd.launch
   ```

> [!NOTE]
> カメラのパラメータを変更する場合は，[Launch Parameters](https://github.com/IntelRealSense/realsense-ros/tree/ros1-legacy#launch-parameters)を参照してください．もしくは，[Dynamic Reconfigure Params](https://github.com/IntelRealSense/realsense-ros/tree/ros1-legacy#set-camera-controls-using-dynamic-reconfigure-params)に説明されているように，[rqt_reconfigure](http://wiki.ros.org/rqt_reconfigure)を使用し，パラメータを動的に更新できます．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### 動作確認

ROS Wrapper for Intel&reg; RealSense&trade; Devicesが正常にインストールされたかどうかを確認するために，[install.sh](install.sh)でインストールされたIntel&reg; RealSense&trade; SDK 2.0の`realsense-viewer`を実行してみます．

1. `realsense-viewer`を起動します．
    ```sh
    $ realsense-viewer
    ```

2. `Add Source`という項目の中に，カメラを指定します．

> [!NOTE]
> `RealSense&tradeカメラ`が認識されない場合があります．その時は，USBの接続を確認してみてください．

3. カメラと接続ができた場合，必要に応じてカメラのパラメータを更新してください．

4. 最後に，`RGB Camera`と`RGBD Camera`のスイッチボタンを`on`にして，カメラを起動します．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### Rviz上の可視化
実機を動かす前段階として，Rviz上でRealSense&trade;カメラを可視化し，カメラの構成を表示することができます．

```sh
$ roslaunch realsense_description view_d405_model.launch
```

> [!NOTE]
> 本レポジトリが対応しているカメラは`d405`，`d415`，`d435`，`d435i`，`d455`，`l515`，`r410`，`r430`となります．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### デモ：Tracking

ROS Wrapper for Intel&reg; RealSense&trade; Devicesが用意しているデフォルトのTrackingのデモプログラムを実行できます．

1. [rs_rtabmap.launch](realsense2_camera/launch/opensource_tracking.launch)というlaunchファイルを実行します．
    ```sh
    $ roslaunch realsense2_camera opensource_tracking.launch
    ```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### デモ：RtabMap

ROS Wrapper for Intel&reg; RealSense&trade; Devicesが用意しているデフォルトのRtabMapのデモプログラムを実行できます．

1. [rs_rtabmap.launch](realsense2_camera/launch/rs_rtabmap.launch)というlaunchファイルを実行します．
    ```sh
    $ roslaunch realsense2_camera rs_rtabmap.launch
    ```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


<!-- マイルストーン -->
## マイルストーン

- [ ] OSS
    - [ ] ドキュメンテーションの充実
    - [-] install.shの更新

現時点のバッグや新規機能の依頼を確認するために[Issueページ][license-url] をご覧ください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


<!-- CONTRIBUTING -->
<!-- ## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">上に戻る</a>)</p> -->



<!-- LICENSE -->
<!-- ## License

Distributed under the MIT License. See `LICENSE.txt` for more NOTErmation.

<p align="right">(<a href="#readme-top">上に戻る</a>)</p> -->



<!-- 参考文献 -->
## 参考文献

* [Intel&reg; RealSense&trade;](https://www.intelrealsense.com/)
* [librealsense](https://github.com/IntelRealSense/librealsense)
* [realsense-ros](https://github.com/IntelRealSense/realsense-ros/tree/ros1-legacy)
* [Intel&reg; RealSense&trade;のドキュメント](https://dev.intelrealsense.com/docs)
* [ROS Noetic](http://wiki.ros.org/noetic)

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/TeamSOBITS/realsense_ros.svg?style=for-the-badge
[contributors-url]: https://github.com/TeamSOBITS/realsense_ros/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/TeamSOBITS/realsense_ros.svg?style=for-the-badge
[forks-url]: https://github.com/TeamSOBITS/realsense_ros/network/members
[stars-shield]: https://img.shields.io/github/stars/TeamSOBITS/realsense_ros.svg?style=for-the-badge
[stars-url]: https://github.com/TeamSOBITS/realsense_ros/stargazers
[issues-shield]: https://img.shields.io/github/issues/TeamSOBITS/realsense_ros.svg?style=for-the-badge
[issues-url]: https://github.com/TeamSOBITS/realsense_ros/issues
[license-shield]: https://img.shields.io/github/license/TeamSOBITS/realsense_ros.svg?style=for-the-badge
[license-url]: https://github.com/TeamSOBITS/realsense_ros/blob/master/LICENSE