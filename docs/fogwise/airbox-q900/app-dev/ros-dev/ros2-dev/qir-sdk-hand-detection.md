---
sidebar_position: 17
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-15
---

# 手部检测

使用预装图片运行 MediaPipe 手部检测管线。示例通过 QNN HTP 后端在 DSP 上依次执行手掌检测和手部关键点推理，并将带有检测框和 21 点手部骨架的图片发布到 `/handlandmark_result`。

本文仅介绍图片输入，未验证摄像头输入。

## 管线

```text
input_image.jpg
  -> image_publisher -> /image_raw
  -> 手掌预处理 -> /palm_detector_input_tensor
  -> QNN 手掌检测 -> /palm_detector_output_tensor
  -> 关键点预处理 -> /landmark_detector_input_tensor
  -> QNN 关键点检测 -> /landmark_detector_output_tensor
  -> 结果绘制 -> /handlandmark_result
```

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)
- Q900 可以访问 GitHub，以下载安装包缺失的手掌锚点文件

## 准备运行环境

### 步骤 1：创建输出目录

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo install -d -m 0777 \
  /opt/ros/jazzy/share/sample_hand_detection/output_MediaPipeHandDetector \
  /opt/ros/jazzy/share/sample_hand_detection/output_MediaPipeHandLandmarkDetector
```

</NewCodeBlock>

### 步骤 2：安装手掌锚点文件

`ros-jazzy-sample-hand-detection 1.1.0.1` 未包含后处理节点所需的 `anchors_palm.npy`。从该节点源码注明的 MediaPipePyTorch 上游下载文件：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo curl -fL \
  https://raw.githubusercontent.com/zmurez/MediaPipePyTorch/master/anchors_palm.npy \
  -o /opt/model/anchors_palm.npy
```

</NewCodeBlock>

校验文件完整性：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
echo "24fa4a27ad6bee24ba3185a42fe3a47115540b0b27fa5956a291f03756183b41  /opt/model/anchors_palm.npy" | \
  sha256sum --check
```

</NewCodeBlock>

预期输出：

```text
/opt/model/anchors_palm.npy: OK
```

## 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
export ROS_DOMAIN_ID=123
source /opt/ros/jazzy/setup.bash
ros2 launch sample_hand_detection launch_with_image_publisher.py
```

</NewCodeBlock>

launch 文件默认以 10 Hz 发布以下预装图片：

```text
/opt/ros/jazzy/share/sample_hand_detection/input_image.jpg
```

## 预期输出

两个模型完成初始化并持续执行推理：

```text
Loading model from binary file: /opt/model/MediaPipeHandDetector.bin
/usr/lib/libQnnHtp.so initialize successfully
Qnn device initialize successfully
Initialize Qnn graph from binary file successfully
Inference init successfully!
Inference execute successfully!

Loading model from binary file: /opt/model/MediaPipeHandLandmarkDetector.bin
/usr/lib/libQnnHtp.so initialize successfully
Qnn device initialize successfully
Initialize Qnn graph from binary file successfully
Inference init successfully!
Inference execute successfully!
```

实机捕获的 `/handlandmark_result` 如下：

![手部检测与关键点结果](/img/fogwise/airbox-q900/airbox-q900-qir-sdk-hand-detection-result.webp)

## 验证

在另一个终端中确认结果话题存在：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
export ROS_DOMAIN_ID=123
source /opt/ros/jazzy/setup.bash
ros2 topic info /handlandmark_result -v
```

</NewCodeBlock>

预期结果包含：

```text
Type: sensor_msgs/msg/Image
Publisher count: 1
Node name: qrb_ros_hand_detector
```

结果图片应为 `512 x 512` 的 `bgr8` 图片，并包含手掌检测框、旋转感兴趣区域和 21 点手部骨架。

需要图形化查看时，在与 Q900 使用相同 `ROS_DOMAIN_ID` 的 ROS 2 Jazzy 桌面环境中启动 `rqt`，依次选择 **Plugins > Visualization > Image View**，再选择 `/handlandmark_result`。

## 停止

在运行示例的终端中按 `Ctrl + C`。

## 限制

- 本次仅验证预装图片输入，未验证 Orbbec 或 QRB 摄像头输入。
- 当前安装包和 Qualcomm `qrb_ros_samples` 的 `jazzy-rel` 源码均未携带 `anchors_palm.npy`，运行前必须单独安装该文件。
- 未验证跨设备 `rqt` 显示，仅验证 Q900 本地推理和结果话题发布。
