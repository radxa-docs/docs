---
sidebar_position: 20
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-15
---

# ResNet101 图像分类

使用 Qualcomm 随示例提供的 `glasses.jpg` 运行 ResNet101 图像分类。示例将输入图片缩放为 `224 x 224`，通过 QNN HTP 后端在 DSP 上执行推理，再将最高分类别发布为文本消息。

本文仅介绍本地图片输入，未验证 QRB、GMSL 或 USB 摄像头输入。

## 管线

```text
glasses.jpg
  -> image_publisher -> /image_raw
  -> 缩放为 224 x 224
  -> /qrb_inference_input_tensor
  -> QNN ResNet101 推理
  -> /qrb_inference_output_tensor
  -> ImageNet 标签映射
  -> /resnet101_output
```

## ROS 2 话题

| 话题                           | 类型                                      | 说明              |
| ------------------------------ | ----------------------------------------- | ----------------- |
| `/image_raw`                   | `sensor_msgs/msg/Image`                   | 输入图片          |
| `/qrb_inference_input_tensor`  | `qrb_ros_tensor_list_msgs/msg/TensorList` | 预处理后的张量    |
| `/qrb_inference_output_tensor` | `qrb_ros_tensor_list_msgs/msg/TensorList` | QNN 推理输出张量  |
| `/resnet101_output`            | `std_msgs/msg/String`                     | ImageNet 分类标签 |

> Qualcomm 用户指南的话题表将输出写为 `/resnet101_results`，但当前 Debian 软件包和源码实际发布的话题均为 `/resnet101_output`。

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)
- Q900 可以访问 GitHub 和 Hugging Face
- `/opt/model` 至少有 50 MB 可用空间

## 使用 Debian 软件包运行

### 步骤 1：安装示例

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ros-jazzy-sample-resnet101
```

</NewCodeBlock>

### 步骤 2：校验模型并修复 ImageNet 标签文件

安装后先校验自动下载的模型。当前 `ros-jazzy-sample-resnet101` 1.0.1 的安装后脚本使用了已经迁移的 GitHub 路径，可能会留下 0 字节的 `/opt/model/imagenet_labels.txt`，因此还需从新路径重新下载标签：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
echo "bfed3e96598ed276600a1e53c8a59decd287258881cd9849141a20a76e0da803  /opt/model/ResNet101_w8a8.bin" | \
  sha256sum --check
sudo wget \
  https://raw.githubusercontent.com/quic/ai-hub-models/refs/heads/main/src/qai_hub_models/labels/imagenet_labels.txt \
  -O /opt/model/imagenet_labels.txt
echo "e697a491aa735cc6c2aaf982f8e86e8fc7b0a1ea7750a2cc6a2bdfc1e109012f  /opt/model/imagenet_labels.txt" | \
  sha256sum --check
```

</NewCodeBlock>

预期输出：

```text
/opt/model/ResNet101_w8a8.bin: OK
/opt/model/imagenet_labels.txt: OK
```

### 步骤 3：启动示例

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
export ROS_DOMAIN_ID=123
ros2 launch sample_resnet101 launch_with_image_publisher.py
```

</NewCodeBlock>

launch 文件默认以 10 Hz 发布 `/opt/ros/jazzy/share/sample_resnet101/glasses.jpg`，并使用 `/opt/model/ResNet101_w8a8.bin`。也可以指定其他本地图片：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 launch sample_resnet101 launch_with_image_publisher.py \
  image_path:=<your-local-image-path>
```

</NewCodeBlock>

## 从源码构建

### 步骤 1：安装依赖

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y \
  ros-dev-tools \
  ros-jazzy-rclpy \
  ros-jazzy-sensor-msgs \
  ros-jazzy-std-msgs \
  ros-jazzy-cv-bridge \
  ros-jazzy-ament-index-python \
  ros-jazzy-qrb-ros-tensor-list-msgs \
  ros-jazzy-image-publisher \
  ros-jazzy-qrb-ros-nn-inference \
  ros-jazzy-qrb-ros-camera \
  python3-opencv \
  python3-numpy
```

</NewCodeBlock>

### 步骤 2：准备模型和标签

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo mkdir -p /opt/model
sudo wget \
  https://huggingface.co/qualcomm/ResNet101/resolve/121564046ebb2353d4a0aa67bf89c11e0c8e80d9/ResNet101_w8a8.bin?download=true \
  -O /opt/model/ResNet101_w8a8.bin
sudo wget \
  https://raw.githubusercontent.com/quic/ai-hub-models/refs/heads/main/src/qai_hub_models/labels/imagenet_labels.txt \
  -O /opt/model/imagenet_labels.txt
```

</NewCodeBlock>

校验两个文件：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
echo "bfed3e96598ed276600a1e53c8a59decd287258881cd9849141a20a76e0da803  /opt/model/ResNet101_w8a8.bin" | \
  sha256sum --check
echo "e697a491aa735cc6c2aaf982f8e86e8fc7b0a1ea7750a2cc6a2bdfc1e109012f  /opt/model/imagenet_labels.txt" | \
  sha256sum --check
```

</NewCodeBlock>

### 步骤 3：克隆源码

使用官方示例的工作区路径：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p ~/qrb_ros_ws/src && cd ~/qrb_ros_ws/src
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_samples.git
```

</NewCodeBlock>

### 步骤 4：构建

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws/src/qrb_ros_samples/ai_vision/sample_resnet101
source /opt/ros/jazzy/setup.bash
colcon build
source install/setup.bash
```

</NewCodeBlock>

预期输出：

```text
Starting >>> sample_resnet101
Finished <<< sample_resnet101
Summary: 1 package finished
```

### 步骤 5：运行源码版本

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws/src/qrb_ros_samples/ai_vision/sample_resnet101
source /opt/ros/jazzy/setup.bash
source install/setup.bash
export ROS_DOMAIN_ID=123
ros2 launch sample_resnet101 launch_with_image_publisher.py
```

</NewCodeBlock>

## 预期输出

模型完成初始化并持续执行推理：

```text
Loaded 1000 class labels.
/usr/lib/libQnnHtp.so initialize successfully
Qnn device initialize successfully
Initialize Qnn graph from binary file successfully
Inference init successfully!
Inference execute successfully!
```

## 验证

在另一个终端中检查实际输出话题：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
export ROS_DOMAIN_ID=123
source /opt/ros/jazzy/setup.bash
ros2 topic info /resnet101_output -v
ros2 topic echo /resnet101_output --once
```

</NewCodeBlock>

默认 `glasses.jpg` 的分类结果应为：

```text
data: sunglass
---
```

Debian 软件包 1.0.1 的输出可能在 `sunglass` 后显示额外换行，这是标签读取方式造成的格式差异，不影响分类结果；当前源码版本会移除该换行。

## 停止

在运行示例的终端中按 `Ctrl + C`。

连续推理期间停止时，QNN 容器可能以 `-11` 退出，Python 节点也可能打印 `ExternalShutdownException`。这些错误发生在关闭阶段，不影响此前已发布的分类结果；确认相关进程退出后即可。

## 限制

- 本次仅验证 Qualcomm 随示例提供的本地图片，未验证摄像头输入。
- 未验证跨设备查看话题，仅验证 Q900 本地推理和结果发布。
- ResNet101 仅能输出 ImageNet 1000 类标签，不会返回目标位置或检测框。
