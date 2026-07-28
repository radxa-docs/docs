---
sidebar_position: 19
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-15
---

# HRNet 人体姿态估计

使用预装图片运行 HRNet 人体姿态估计。示例通过 QNN HTP 后端在 DSP 上执行推理，同时发布带有姿态骨架的结果图片和原图坐标系中的人体关键点。

本文仅介绍图片输入，未验证 QRB、GMSL 或 USB 摄像头输入。

## 管线

```text
input_image.jpg
  -> image_publisher -> /image_raw
  -> HRNet 图像预处理
  -> /qrb_inference_input_tensor
  -> QNN HRNetPose 推理
  -> /qrb_inference_output_tensor
  -> 热力图后处理和置信度过滤
  -> /pose_estimation_results + /pose_estimation_points
```

## 输出话题

| 话题                       | 类型                               | 说明                         |
| -------------------------- | ---------------------------------- | ---------------------------- |
| `/pose_estimation_results` | `sensor_msgs/msg/Image`            | 绘制关键点和骨架的结果图片   |
| `/pose_estimation_points`  | `geometry_msgs/msg/PolygonStamped` | 原图坐标系中的人体关键点坐标 |

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)
- Q900 可以访问 GitHub 和 Hugging Face
- `/opt/model` 至少有 60 MB 可用空间

## 安装依赖

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y \
  ros-jazzy-qrb-ros-camera \
  ros-jazzy-qrb-ros-nn-inference \
  ros-jazzy-qrb-ros-tensor-list-msgs \
  ros-dev-tools
```

</NewCodeBlock>

首次使用 rosdep 时进行初始化：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo rosdep init
rosdep update
```

</NewCodeBlock>

如果 `sudo rosdep init` 提示已存在 `/etc/ros/rosdep/sources.list.d/20-default.list`，说明 rosdep 已初始化，只需运行 `rosdep update`。

## 准备源码和模型

### 步骤 1：克隆源码

使用官方示例的工作区路径：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p ~/qrb_ros_sample_ws/src && cd ~/qrb_ros_sample_ws/src
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_samples.git
```

</NewCodeBlock>

### 步骤 2：下载模型

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo mkdir -p /opt/model
sudo wget \
  https://huggingface.co/qualcomm/HRNetPose/resolve/6011b6e69a84dad8f53fb555b11035a5e26c8755/HRNetPose.bin?download=true \
  -O /opt/model/HRNetPose.bin
```

</NewCodeBlock>

校验模型：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
echo "f593694f4e8afecd8be7bc5304ea9408c33b99f412b5eb2493123ea718cb2838  /opt/model/HRNetPose.bin" | \
  sha256sum --check
```

</NewCodeBlock>

预期输出：

```text
/opt/model/HRNetPose.bin: OK
```

## 源码构建

### 步骤 1：安装源码依赖

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_sample_ws/src/qrb_ros_samples/ai_vision/sample_hrnet_pose_estimation
rosdep install --from-paths . --ignore-src --rosdistro jazzy -y \
  --skip-keys "qrb_ros_tensor_list_msgs qrb_ros_nn_inference qrb_ros_camera"
```

</NewCodeBlock>

### 步骤 2：构建

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
colcon build --cmake-args -DBUILD_TESTING=OFF
source install/setup.bash
```

</NewCodeBlock>

预期输出：

```text
Starting >>> sample_hrnet_pose_estimation
Finished <<< sample_hrnet_pose_estimation
Summary: 1 package finished
```

## 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_sample_ws/src/qrb_ros_samples/ai_vision/sample_hrnet_pose_estimation
source /opt/ros/jazzy/setup.bash
source install/setup.bash
export ROS_DOMAIN_ID=123
ros2 launch sample_hrnet_pose_estimation launch_with_image_publisher.py \
  image_path:=/opt/ros/jazzy/share/sample_hrnet_pose_estimation/input_image.jpg
```

</NewCodeBlock>

launch 文件以 10 Hz 发布指定的图片。`model_path` 参数表示包含 `HRNetPose.bin` 的目录，默认值为 `/opt/model/`。

## 预期输出

模型完成初始化，并持续发布图片和关键点结果：

```text
Loading model from binary file: /opt/model/HRNetPose.bin
/usr/lib/libQnnHtp.so initialize successfully
Qnn device initialize successfully
Initialize Qnn graph from binary file successfully
Inference init successfully!
Inference execute successfully!
Publisher pose_estimation_results&pose_estimation_points message
```

实机捕获的 `/pose_estimation_results` 如下：

![HRNet 人体姿态估计结果](/img/fogwise/airbox-q900/airbox-q900-qir-sdk-hrnet-pose-estimation-result.webp)

## 关键点顺序

`/pose_estimation_points` 使用以下 1 起始编号：

| ID  | 身体部位 | ID  | 身体部位 |
| --- | -------- | --- | -------- |
| 1   | 鼻子     | 10  | 右手腕   |
| 2   | 右眼     | 11  | 左手腕   |
| 3   | 左眼     | 12  | 右髋     |
| 4   | 右耳     | 13  | 左髋     |
| 5   | 左耳     | 14  | 右膝     |
| 6   | 右肩     | 15  | 左膝     |
| 7   | 左肩     | 16  | 右脚踝   |
| 8   | 右肘     | 17  | 左脚踝   |
| 9   | 左肘     |     |          |

源码只发布置信度高于 `0.3` 的点。`PolygonStamped` 不包含置信度或显式关键点 ID，因此只有在 17 个点全部输出时，数组位置才与上表完整对应。

## 验证

在另一个终端中检查两个结果话题：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
export ROS_DOMAIN_ID=123
source /opt/ros/jazzy/setup.bash
ros2 topic info /pose_estimation_results -v
ros2 topic info /pose_estimation_points -v
ros2 topic echo /pose_estimation_points --once
```

</NewCodeBlock>

默认测试图片应输出 17 个 `polygon.points`，所有 `x` 坐标应在 `0` 到 `668` 范围内，所有 `y` 坐标应在 `0` 到 `892` 范围内。

## 停止

在运行示例的终端中按 `Ctrl + C`。

连续推理期间停止时，QNN 容器可能以 `-11` 退出，Python 节点也可能打印 `ExternalShutdownException`。这些错误发生在关闭阶段，不影响此前已发布的结果；确认相关进程退出后即可。

## 限制

- 本次仅验证预装图片输入，未验证 QRB、GMSL 或 USB 摄像头输入。
- 未验证跨设备 `rqt` 显示，仅验证 Q900 本地推理和结果话题发布。
- 点消息不包含置信度、名称或显式 ID；二次开发时需结合输出顺序和点数量解释坐标。
