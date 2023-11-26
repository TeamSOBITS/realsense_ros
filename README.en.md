<a name="readme-top"></a>

[JA](README.md) | [EN](README.en.md)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]

# ROS Wrapper for Intel&reg; RealSense&trade; Devices

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#introduction">Introduction</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
    　<a href="#launch-and-usage">Launch and Usage</a>
      <ul>
        <li><a href="#operational-test">Operational Test</a></li>
        <li><a href="#visualization-on-rviz">Visualization on Rviz</a></li>
        <li><a href="#demo-tracking">Demo: Tracking</a></li>
        <li><a href="#demo-rtabMap">Demo: RtabMap</a></li>
      </ul>
    </li>
    <li><a href="#milestone">Milestone</a></li>
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- INTRODUCTION -->
## Introduction

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

Here you will write about the repository. Try to be explicit about the purpose and your aproach to the problem.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This section describes how to set up this repository.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Prerequisites

First, please prepare the following environment before proceeding to the next installation stage.

| System  | Version |
| ------------- | ------------- |
| Ubuntu | 20.04 (Focal Fossa) |
| ROS | Noetic Ninjemys |
| LibRealSense2 | v2.50.0 |
| D400 Firmware | v5.13.0.50 |
| L500 Firmware | v1.5.8.1 + |

> [!NOTE]
> If you need to install `Ubuntu` or `ROS`, please check our [SOBIT Manual](https://github.com/TeamSOBITS/sobits_manual#%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Installation

1. Go to the `src` folder of ROS.
   ```sh
   $ roscd
   # Or just use "cd ~/catkin_ws/" and change directory.
   $ cd src/
   ```
2. Clone this repository.
   ```sh
   $ git clone https://github.com/TeamSOBITS/realsense_ros
   ```
3. Navigate into the repository.
   ```sh
   $ cd realsense_ros/
   ```
4. Install the dependent packages.
   ```sh
   $ bash install.sh
   ```

> [!NOTE]
> Running [install.sh](install.sh) will automatically install the required [Intel&reg; RealSense&trade; SDK 2.0](https://github.com/IntelRealSense/librealsense).

5. Compile the package.
   ```sh
   $ roscd
   # Or just use "cd ~/catkin_ws/" and change directory.
   $ catkin_make
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LAUNCH AND USAGE EXAMPLES -->
## Launch and Usage

When using the camera alone, execute [rs_rgbd.launch](realsense2_camera/launch/rs_rgbd.launch) according to the following procedure.

1. Update the following parameters of [rs_rgbd.launch](realsense2_camera/launch/rs_rgbd.launch) if necessary.
   ```xml
    <!-- Add Prefix to tf frame. It typically contains a trailing '_' unless empty. -->
    <arg name="tf_prefix"         default="azure_" />
    <!-- Add cover to camera -->
    <arg name="add_cover"         default="true" />
    <!-- Visualize Rviz -->
    <arg name="open_rviz"         default="true"/>
    ...
   ```

> [!NOTE]
> Replace with `true` or `false` depending on the function you want to use.

2. Execute the launch file named [rs_rgbd.launch](realsense2_camera/launch/rs_rgbd.launch).
   ```sh
   $ roslaunch azure_kinect_ros_driver driver.launch
   ```

> [!NOTE]
> If you need to change the camera parameters, please refer to [Launch Parameters](https://github.com/IntelRealSense/realsense-ros/tree/ros1-legacy#launch-parameters). You can also reconfigure the parameters dynamically using [rqt_reconfigure](http://wiki.ros.org/rqt_reconfigure). please, check [Dynamic Reconfigure Params](https://github.com/IntelRealSense/realsense-ros/tree/ros1-legacy#set-camera-controls-using-dynamic-reconfigure-params) to do so.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Operational Test

To check if ROS Wrapper for Intel&reg; RealSense&trade; Devices has been successfully installed, run `realsense-viewer` of Intel&reg; RealSense&trade; SDK 2.0 installed through [install.sh](install.sh).

1. Start `realsense-viewer`.
    ```sh
    $ realsense-viewer
    ```

2. Specify the camera in the `Add Source`field.

> [!NOTE]
> In some cases, the `RealSense&trade` camera may not be recognized. In that case, try checking the USB connection.

3. If the connection is established, update the parameters of the camera if necessary.

4. Finally, switch the`RGB Camera` and `RGBD Camera` section to `on` to activate the camera.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Visualization on Rviz

As a preliminary step to running the actual device, RealSense&trade; can be visualized on Rviz to display the camera configuration.

```sh
$ roslaunch realsense_description view_d405_model.launch
```

> [!NOTE]
> This repository supports the following cameras: `d405`，`d415`，`d435`，`d435i`，`d455`，`l515`，`r410`，`r430`.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Demo: Tracking

You can run the Tracking demo program provided by default by Intel&reg; RealSense&trade; Devices.

1. Execute the launch file named [rs_rtabmap.launch](realsense2_camera/launch/opensource_tracking.launch).
    ```sh
    $ roslaunch realsense2_camera opensource_tracking.launch
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Demo: RtabMap

You can run the RtabMap demo program provided by default by ROS Wrapper for Intel&reg; RealSense&trade; Devices.

1. Execute the launch file named [rs_rtabmap.launch](realsense2_camera/launch/rs_rtabmap.launch).
    ```sh
    $ roslaunch realsense2_camera rs_rtabmap.launch
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MILESTONE -->
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

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Intel&reg; RealSense&trade;](https://www.intelrealsense.com/)
* [librealsense](https://github.com/IntelRealSense/librealsense)
* [realsense-ros](https://github.com/IntelRealSense/realsense-ros/tree/ros1-legacy)
* [Intel&reg; RealSense&trade; Official Documentation](https://dev.intelrealsense.com/docs)
* [ROS Noetic](http://wiki.ros.org/noetic)

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
