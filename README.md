<a name="readme-top"></a>

[JA](README.md) | [EN](README.en.md)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]

# ROS 2 Wrapper for Intel&reg; RealSense&trade; Devices

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
    　<a href="#実行操作方法">実行・操作方法</a>
      <ul>
        <li><a href="#動作確認">動作確認</a></li>
        <li><a href="#カメラの起動">カメラの起動</a></li>
        <li><a href="#他のプログラムからname_spaceやcamera_nameを変更したいとき">他のプログラムからname_spaceやcamera_nameを変更したいとき</a></li>
      </ul>
    </li>
    <li><a href="#マイルストーン">マイルストーン</a></li>
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <li><a href="#参考文献">参考文献</a></li>
  </ol>
</details>


<!-- レポジトリの概要 -->
## 概要

Intel&reg; RealSense&trade;が作成した[ROS Wrapper for Intel&reg; RealSense&trade; Devices](https://github.com/IntelRealSense/realsense-ros)を基に，SOBITSで使いやすいように編集をしたものになります．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


<!-- セットアップ -->
## セットアップ

ここで，本レポジトリのセットアップ方法について説明します．

### 環境条件

まず，以下の環境を整えてから，次のインストール段階に進んでください．

| System  | Version |
| ------------- | ------------- |
| Ubuntu | 22.04 (Focal Fossa) |
| ROS 2 | Humble Hawksbill|
| LibRealSense2 | v2.56.4 |
| D400 Firmware | v5.15.0.2 |
| 対応カメラ | D435i,D405などのD400シリーズ |

> [!NOTE]
> `Ubuntu`や`ROS2`のインストール方法に関しては，[SOBITS Manual](https://github.com/TeamSOBITS/sobits_manual#%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)に参照してください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### インストール方法

1. ROS 2の`src`フォルダに移動します．
   ```sh
   $ cd colcon_ws/src/
   ```
2. 本レポジトリをcloneします．
   ```sh
   $ git clone https://github.com/TeamSOBITS/realsense_ros
   ```
3. レポジトリの中へ移動します．
   ```sh
   $ cd realsense_ros/
   ```
4. レポジトリのブランチを[humble-devel](https://github.com/TeamSOBITS/realsense_ros/tree/humble-devel)に切り替えます.
    ```
    $ git checkout humble-devel
    ```  
4. 依存パッケージをインストールします．
   ```sh
   $ bash install.sh
   ```

> [!NOTE]
> [install.sh](install.sh)を実行することによって，必要とされる[Intel&reg; RealSense&trade; SDK 2.0](https://github.com/IntelRealSense/librealsense)が自動的にインストールされます．

5. パッケージをコンパイルします．
   ```sh
   #colcon_wsへ移動
   $ colcon build
   ```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



<!-- 実行・操作方法 -->
## 実行・操作方法

カメラ単体で使用する場合は，[rs_launch.py](https://github.com/TeamSOBITS/realsense_ros/blob/humble-devel/realsense2_camera/launch/rs_launch.py)を次の手順で実行してください．


1. 必要に応じて[rs_launch.launch](https://github.com/TeamSOBITS/realsense_ros/blob/humble-devel/realsense2_camera/launch/rs_launch.py)のパラメータを更新してください．
   ```python
    camera_name = 'camera'
    robot_name = 'D435i'

    configurable_parameters = [{'name': 'camera_name',   'default': camera_name, 'description': 'camera unique name'},
                              {'name': 'camera_namespace',  'default': robot_name, 'description': 'namespace for camera'},
        ...
   ```

2. [rs_launch.py](https://github.com/TeamSOBITS/realsense_ros/blob/humble-devel/realsense2_camera/launch/rs_launch.py)というlaunchファイルを実行します．
   ```sh
   $ ros2 launch realsense2_camera rs_launch.py
   ```

> [!NOTE]
> カメラのパラメータを変更する場合は，[Parameters](https://github.com/IntelRealSense/realsense-ros?tab=readme-ov-file#parameters)を参照してください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### 動作確認

正常にインストールされたかどうかを確認するために，[install.sh](install.sh)でインストールされたIntel&reg; RealSense&trade; SDK 2.0の`realsense-viewer`を実行してみます．

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


### カメラの起動

1. [rs_launch.py](/realsense_ros/realsense2_camera/launch/rs_launch.py)というlaunchファイルを実行します．
    ```sh
    $ ros2 launch realsense2_camera rs_launch.py
    ```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### 他のプログラムからname_spaceやcamera_nameを変更したいとき
1.launchファイル内で以下のような例で設定し起動すれば変更が可能です．
```python
from launch import LaunchDescription
from launch_ros.actions import Node

from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
import os

def generate_launch_description():
    pkg_name = 'realsense2_camera'
    robot_name = 'D435i'
    camera_name = 'camera'
    launch_file_path = os.path.join(
        get_package_share_directory(pkg_name),
        'launch',
        'rs_launch.py'
    )

    included_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(launch_file_path),
        launch_arguments={
            'camera_namespace': robot_name,
            'camera_name': camera_name
        }.items()
    )

    return LaunchDescription([
        included_launch,
    ])
```

2.コマンドから変更したいとき．
```sh
$ ros2 launch realsense2_camera rs_launch.py camera_namespace:=sobit_mini camera_name:=head_camera_base
```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


<!-- マイルストーン -->
## マイルストーン

- [x] OSS
    - [x] ドキュメンテーションの充実
    - [x] install.shの更新

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
* [realsense-ros](https://github.com/IntelRealSense/realsense-ros/tree/ros2-master)
* [Intel&reg; RealSense&trade;のドキュメント](https://dev.intelrealsense.com/docs)
* [ROS Humble](https://docs.ros.org/en/humble/index.html)

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
[license-url]: LICENSE
