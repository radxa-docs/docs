---
sidebar_position: 3
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-09
---

# QIR SDK 开发指南

Qualcomm Intelligent Robotics SDK (QIR SDK) 是一套面向 Qualcomm 机器人平台的 ROS 2 开发组件，提供零拷贝传输、平台传感器驱动、机器人仿真环境和 AI 推理示例，帮助开发者在 Ubuntu 上快速构建机器人应用。

QIR SDK 以 `qirp-sdk`（服务器版）和 `qirp-sdk-desktop`（桌面版）两个元包发布，安装后自动拉取 ROS 2 Jazzy 及 70+ Qualcomm 机器人相关软件包。

## 与 QAIRT / QIM SDK 的关系

| 层级              | 内容                                         | 在 Q900 上的状态              |
| ----------------- | -------------------------------------------- | ----------------------------- |
| **QAIRT Runtime** | QNN / SNPE / LiteRT 运行时库                 | 通过 apt 安装（`qairt-libs`） |
| **QIM SDK**       | GStreamer ML 推理插件与命令行工具            | 通过 apt 安装                 |
| **QIR SDK**       | ROS 2 机器人开发框架、传感器驱动、仿真与示例 | 通过 apt 安装                 |

QIR SDK 依赖 QAIRT 和 QIM SDK，三者按上述层级堆叠。安装 QIR SDK 时会自动安装下层依赖。

## 前提条件

- Radxa AIRbox Q900
- Ubuntu 24.04，已连接网络

## 安装

### 步骤 1：配置 apt 软件源

添加 ROS 2 和 Qualcomm 官方 PPA：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# 添加 ROS 2 软件源
sudo apt update && sudo apt install -y software-properties-common
sudo add-apt-repository -y universe
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
    http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | \
    sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# 添加 Qualcomm PPA
sudo add-apt-repository -y ppa:ubuntu-qcom-iot/qcom-ppa
sudo add-apt-repository -y ppa:ubuntu-qcom-iot/qirp

sudo apt update
```

</NewCodeBlock>

### 步骤 2：安装 QIR SDK

- **Radxa OS**：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y qirp-sdk-desktop
```

</NewCodeBlock>

<details>
<summary>服务器版（无图形环境）</summary>

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y qirp-sdk
```

</NewCodeBlock>

</details>

安装过程约 5-10 分钟，会自动安装 ROS 2 Jazzy 基础系统和所有 Qualcomm 机器人软件包。

### 步骤 3：修复并运行安装后设置脚本

官方 QIR SDK 安装包中的设置脚本默认将用户目录硬编码为 `/home/ubuntu`，而 Radxa 官方镜像默认用户为 `radxa`。需先修改再运行：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo sed -i 's|DIR=/home/ubuntu|DIR=/home/radxa|' /usr/share/qirp-setup.sh
bash /usr/share/qirp-setup.sh
```

</NewCodeBlock>

该脚本执行以下操作：

- 安装 Python 依赖（`typing_extensions`、`pytesseract`）
- 自动检测 USB 摄像头设备路径
- 配置 ROS 2 环境变量

### 步骤 4：验证安装

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 pkg list | grep -E 'qrb|sample|simulation' | sort
```

</NewCodeBlock>

预期输出至少包含以下软件包：

```text
qrb_amr_manager
qrb_inference_manager
qrb_ros_imu
qrb_ros_camera
rplidar_ros
sample_depth_estimation
sample_face_detection
sample_hand_detection
sample_object_detection
simulation_sample_amr_simple_motion
simulation_sample_pick_and_place
...
```

## 软件包分类

QIR SDK 提供的 ROS 2 软件包按功能分为以下类别：

### 平台示例

| 软件包                             | 说明                 |
| ---------------------------------- | -------------------- |
| `ros-jazzy-ocr-service`            | OCR 文字识别服务     |
| `ros-jazzy-rplidar-ros`            | RPLIDAR 激光雷达驱动 |
| `ros-jazzy-orbbec-camera`          | Orbbec 深度相机驱动  |
| `ros-jazzy-qrb-ros-imu`            | IMU 惯性测量单元     |
| `ros-jazzy-qrb-ros-battery`        | 电池状态监测         |
| `ros-jazzy-qrb-ros-camera`         | 摄像头采集与发布     |
| `ros-jazzy-qrb-ros-video`          | 视频编解码           |
| `ros-jazzy-qrb-ros-system-monitor` | 系统资源监控         |
| `ros-jazzy-ros2-benchmark`         | ROS 2 性能基准测试   |

### 机器人示例

| 软件包                                          | 说明                 |
| ----------------------------------------------- | -------------------- |
| `ros-jazzy-simulation-sample-amr-simple-motion` | AMR 简单运动仿真     |
| `ros-jazzy-simulation-sample-pick-and-place`    | 机械臂抓取与放置仿真 |
| `ros-jazzy-simulation-remote-assistant`         | 远程辅助仿真         |
| `ros-jazzy-qrb-amr-manager`                     | AMR 管理器           |
| `ros-jazzy-qrb-follow-path-manager`             | 路径跟随管理器       |
| `ros-jazzy-follow-me`                           | 人员跟随             |
| `ros-jazzy-qcom-cartographer-ros`               | Cartographer SLAM    |

### AI 示例

| 软件包                                   | 说明                | 推理后端 |
| ---------------------------------------- | ------------------- | -------- |
| `ros-jazzy-sample-hand-detection`        | 手部检测            | DSP      |
| `ros-jazzy-sample-face-detection`        | 人脸检测            | DSP      |
| `ros-jazzy-sample-object-detection`      | 目标检测            | DSP      |
| `ros-jazzy-sample-hrnet-pose-estimation` | HRNet 人体姿态估计  | DSP      |
| `ros-jazzy-sample-object-segmentation`   | 图像语义分割        | DSP      |
| `ros-jazzy-sample-depth-estimation`      | 单目深度估计        | DSP      |
| `ros-jazzy-sample-resnet101`             | ResNet-101 图像分类 | DSP      |
| `ros-jazzy-sample-apriltag`              | AprilTag 标签检测   | DSP      |

### 基础设施

| 软件包                                          | 说明                        |
| ----------------------------------------------- | --------------------------- |
| `ros-jazzy-dmabuf-transport`                    | DMA-BUF 零拷贝 ROS 消息传输 |
| `ros-jazzy-qrb-ros-transport-image-type`        | 图像类型零拷贝传输          |
| `ros-jazzy-qrb-ros-transport-imu-type`          | IMU 类型零拷贝传输          |
| `ros-jazzy-qrb-ros-transport-point-cloud2-type` | 点云类型零拷贝传输          |
| `ros-jazzy-qrb-inference-manager`               | AI 推理管理器               |
| `ros-jazzy-qrb-ros-nn-inference`                | 神经网络推理节点            |
| `ros-jazzy-qrb-ros-yolo-process`                | YOLO 目标检测处理           |
| `ros-jazzy-qrb-ros-audio-service`               | 音频服务                    |

> 完整软件包列表参见 Qualcomm 官方文档 _Qualcomm Intelligent Robotics SDK for Ubuntu User Guide_ (80-90441-2)。

## 已验证示例

以下示例已在 Q900 上逐项验证通过：

### 平台示例

- [基础 OCR](qir-sdk-ocr.md) — 光学字符识别服务
- [系统资源监控](qir-sdk-system-monitor.md) — CPU、内存、温度等多维度监控
- [接口通信验证](qir-sdk-interfaces.md) — ROS 2 自定义消息接口验证
- [消息零拷贝传输](qir-sdk-transport.md) — DMA-BUF 零拷贝传输验证
- [模型推理](qir-sdk-nn-inference.md) — DSP 模型推理（YOLOv8）
- [颜色空间转换](qir-sdk-colorspace-convert.md) — NV12 与 RGB888 互转
- [视频编解码](qir-sdk-video.md) — VPU 硬件 H.264/H.265 编解码
- [性能基准测试](qir-sdk-benchmark.md) — ROS 组件性能评估

### 机器人示例

- [AMR 简单运动控制](qir-sdk-amr-simple-motion.md) — 交互式键盘控制仿真
- [机械臂抓取与放置](qir-sdk-pick-and-place.md) — RML-63 MoveIt2 仿真
- [仿真远程助理](qir-sdk-remote-assistant.md) — office 场景 AMR 导航与检测
- [2D LiDAR SLAM](qir-sdk-slam.md) — Cartographer 建图与重定位
- [Follow Me 人员跟随](qir-sdk-follow-me.md) — FastestDet 人员检测与深度跟踪

### AI 示例

- [手部检测](qir-sdk-hand-detection.md) — 静态图片手掌检测与 21 点关键点识别
- [单目深度估计](qir-sdk-depth-estimation.md) — Depth Anything V2 静态图片相对深度估计
- [HRNet 人体姿态估计](qir-sdk-hrnet-pose-estimation.md) — 静态图片 17 点人体关键点检测
- [ResNet101 图像分类](qir-sdk-resnet101.md) — 静态图片 ImageNet 1000 类分类
- [YOLOv8 目标检测](qir-sdk-object-detection.md) — 静态图片目标类别和检测框识别
- [YOLOv8 目标分割](qir-sdk-object-segmentation.md) — 静态图片目标类别、检测框和实例掩码

> 更多需要外接硬件的示例（RPLIDAR、Orbbec 相机、USB 摄像头等）请参考 Qualcomm 官方用户指南第 3 章。

## 排障

### 运行 `ros2` 命令提示 `command not found`

未 source ROS 2 环境：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
```

</NewCodeBlock>

可将此行加入 `~/.bashrc` 以自动生效：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
```

</NewCodeBlock>

### 示例启动后无画面输出

检查 Weston 是否运行：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ps aux | grep weston
```

</NewCodeBlock>

如果 Weston 未运行，请确保安装了桌面版镜像并已登录桌面。

### DSP 推理失败

确认 FastRPC 设备节点存在：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls /dev/fastrpc-cdsp*
```

</NewCodeBlock>

如果没有输出，请参考 [板端启用 NPU](../../../ai-dev/fastrpc-setup.md)。

### USB 摄像头未识别

检查摄像头设备：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
v4l2-ctl --list-devices
```

</NewCodeBlock>

## 参考

- [ROS 2 开发](ros2-install.md) — 独立搭建 ROS 2 环境
- [QIM SDK 开发指南](../../../ai-dev/qim-sdk/README.md) — GStreamer ML 推理应用
- [Qualcomm 官方用户指南](https://docs.qualcomm.com/doc/80-90441-2) — QIR SDK 完整参考
