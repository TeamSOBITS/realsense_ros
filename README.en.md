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
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#Introduction">Introduction</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">prerequisites</a></li>
        <li><a href="#installation">installation</a></li>
      </ul>
    </li>
    <li>
    　<a href="##launch-and-usage">Launch and Usage</a>
      <ul>
        <li><a href="#Operation check">Operation check</a></li>
        <li><a href="#Launching the camera">Launching the camera</a></li>
        <li><a href="#When you want to change name_space or camera_name from another program">When you want to change name_space or camera_name from another program</a></li>
      </ul>
    </li>
    <li><a href="#Milestone">Milestone</a></li>
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>


<!-- レポジトリのIntroduction -->
## Introduction

It is based on the [ROS Wrapper for Intel&reg; RealSense&trade; Devices](https://github.com/IntelRealSense/realsense-ros) created by Intel&reg; RealSense&trade;, and has been edited to be easier to use with SOBITS.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Getting Started -->
## Getting Started

This section describes how to set up this repository.

### prerequisites

First, please prepare the following environment before proceeding to the next installation stage.

| System  | Version |
| ------------- | ------------- |
| Ubuntu | 22.04 (Focal Fossa) |
| ROS 2 | Humble Hawksbill|
| LibRealSense2 | v2.56.4 |
| D400 Firmware | v5.15.0.2 |
| Compatible cameras | D400 series such as D435i and D405 |

> [!NOTE]
> If you need to install `Ubuntu` or `ROS`, please check our [SOBITS Manual](https://github.com/TeamSOBITS/sobits_manual#%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### installation

1. Go to the `src` folder of ROS 2.
   ```sh
   $ cd colcon_ws/src/
   ```
2. Clone this repository.
   ```sh
   $ git clone https://github.com/TeamSOBITS/realsense_ros
   ```
3. Navigate into the repository.
   ```sh
   $ cd realsense_ros/
   ```
4. Switch the repository branch to [humble-devel](https://github.com/TeamSOBITS/realsense_ros/tree/humble-devel).
    ```
    $ git checkout humble-devel
    ```  
4. Install the dependent packages.
   ```sh
   $ bash install.sh
   ```

> [!NOTE]
> Running [install.sh](install.sh) will automatically install the required [Intel&reg; RealSense&trade; SDK 2.0](https://github.com/IntelRealSense/librealsense).


5. Compile the package.
   ```sh
   #Go to colcon_ws
   $ colcon build
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- Launch and Usage -->
## Launch and Usage

If you are using the camera alone, run [rs_launch.py](https://github.com/TeamSOBITS/realsense_ros/blob/humble-devel/realsense2_camera/launch/rs_launch.py) as follows:


1. Please update the parameters in [rs_launch.launch](https://github.com/TeamSOBITS/realsense_ros/blob/humble-devel/realsense2_camera/launch/rs_launch.py) as needed.
   ```python
    camera_name = 'camera'
    robot_name = 'D435i'

    configurable_parameters = [{'name': 'camera_name',   'default': camera_name, 'description': 'camera unique name'},
                              {'name': 'camera_namespace',  'default': robot_name, 'description': 'namespace for camera'},
        ...
   ```

2. Run the launch file called [rs_launch.py](https://github.com/TeamSOBITS/realsense_ros/blob/humble-devel/realsense2_camera/launch/rs_launch.py).
   ```sh
   $ ros2 launch realsense2_camera rs_launch.py
   ```

> [!NOTE]
> To change the camera parameters, see [Parameters](https://github.com/IntelRealSense/realsense-ros?tab=readme-ov-file#parameters).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Operation check

To check if the installation was successful, try running the Intel&reg; RealSense&trade; SDK 2.0 `realsense-viewer` installed by [install.sh](install.sh).

1. Start `realsense-viewer`.
    ```sh
    $ realsense-viewer
    ```

2. Specify the camera in the `Add Source` item.

> [!NOTE]
> The RealSense™ camera may not be recognized. If this happens, please check the USB connection.

3. Once you have connected to the camera, update the camera parameters as necessary.

4. Finally, turn on the RGB Camera and RGBD Camera switch buttons to start the camera.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Launching the camera

1. Run the launch file called [rs_launch.py](/realsense_ros/realsense2_camera/launch/rs_launch.py).
    ```sh
    $ ros2 launch realsense2_camera rs_launch.py
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### When you want to change name_space or camera_name from another program
1.You can change this by setting it in the "launch" file as shown in the example below and launching it.
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

2.To change it from the command
```sh
$ ros2 launch realsense2_camera rs_launch.py camera_namespace:=sobit_mini camera_name:=head_camera_base
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Milestone -->
## Milestone

- [x] OSS
    - [x] Enhanced Documentation
    - [x] Update [install.sh](install.sh)

See the [open issues][license-url] for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


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

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->


<!-- LICENSE -->
<!-- ## License

Distributed under the MIT License. See `LICENSE.txt` for more NOTErmation.

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->


<!-- Acknowledgments -->
## Acknowledgments

* [Intel&reg; RealSense&trade;](https://www.intelrealsense.com/)
* [librealsense](https://github.com/IntelRealSense/librealsense)
* [realsense-ros](https://github.com/IntelRealSense/realsense-ros/tree/ros2-master)
* [Intel&reg; RealSense&trade; Official Documentation](https://dev.intelrealsense.com/docs)
* [ROS Humble](https://docs.ros.org/en/humble/index.html)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



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
