---
sidebar_position: 8
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# 模型推理

演示如何通过 QRB ROS NN Inference 节点在 DSP 上运行 TensorFlow Lite 模型推理，包含图像预处理、推理和结果可视化。

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)
- 已转换 YOLOv8 单 batch 模型，参考 [模型导出](../../../ai-dev/qim-sdk/model-export.md)

## 方式一：开箱即用

使用 APT 安装的推理节点，仅从源码构建前后处理测试节点。

### 步骤 1：安装推理节点

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ros-jazzy-qrb-ros-nn-inference
```

</NewCodeBlock>

### 步骤 2：克隆仓库并准备测试数据

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p ~/ros-ws/src && cd ~/ros-ws/src
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_nn_inference
```

</NewCodeBlock>

下载测试图像：

```bash
wget -P ~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_pre_process/image/ \
  https://ultralytics.com/images/bus.jpg
```

将测试图像转换为模型输入格式：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 ~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_post_process/scripts/yolov8_input_pre_process.py
```

</NewCodeBlock>

### 步骤 3：配置模型和图像路径

编辑 `~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_post_process/launch/nn_node_test.launch.py`，修改以下参数：

- `image_path`：指向 `bus.raw` 的绝对路径
- `model_path`：指向 YOLOv8 模型的绝对路径

### 步骤 4：构建前后处理节点

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/ros-ws
source /opt/ros/jazzy/setup.bash
rm -f ./src/qrb_ros_nn_inference/test/qrb_ros_post_process/COLCON_IGNORE
rm -f ./src/qrb_ros_nn_inference/test/qrb_ros_pre_process/COLCON_IGNORE
colcon build --packages-select qrb_ros_pre_process qrb_ros_post_process \
  --cmake-args -DBUILD_TESTING=OFF
```

</NewCodeBlock>

### 步骤 5：运行推理

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/ros-ws
source /opt/ros/jazzy/setup.bash
source install/local_setup.bash
ros2 launch qrb_ros_post_process nn_node_test.launch.py
```

</NewCodeBlock>

预期日志中看到 `libqrb_ros_inference_node.so` 从 `/opt/ros/jazzy/lib/` 加载，推理成功后打印 `Inference execute Successfully!`。

至少完成一次推理后按 `Ctrl + C` 停止。

### 步骤 6：可视化结果

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 ~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_post_process/scripts/qrb_ros_yolo_detection_visualizer.py \
  --original_image ~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_pre_process/image/bus.jpg
```

</NewCodeBlock>

检测结果位于 `~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_post_process/inference_result/detection_result.jpg`。

![YOLOv8 detection result](/img/fogwise/airbox-q900/airbox-q900-qir-sdk-nn-inference-yolov8-detection.webp)

## 方式二：源码构建

从源码构建完整的推理链路，包含推理管理器、NN 推理节点、Tensor 消息接口和前后处理。

### 步骤 1：安装依赖

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y software-properties-common colcon \
  libtensorflow-lite-c-qcom1 libtensorflow-lite-qcom-dev \
  libqnn-dev libqnn1
```

</NewCodeBlock>

### 步骤 2：克隆仓库

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p ~/qrb_ros_ws/src && cd ~/qrb_ros_ws/src
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_nn_inference
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_interfaces
```

</NewCodeBlock>

### 步骤 3：修复 QNN 头文件路径

以下验证基于 QAIRT 2.46。该版本将 QNN 头文件安装在 `/usr/include/QNN`，而仓库 CMake 未包含该路径，需在 `~/qrb_ros_ws/src/qrb_ros_nn_inference/qrb_inference_manager/CMakeLists.txt` 中添加：

```cmake
include_directories(
  include
  /usr/include/QNN
)
```

### 步骤 4：构建

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws
source /opt/ros/jazzy/setup.bash
colcon build --packages-up-to qrb_ros_nn_inference \
  --allow-overriding qrb_ros_tensor_list_msgs qrb_inference_manager qrb_ros_nn_inference \
  --cmake-args -DBUILD_TESTING=OFF
```

</NewCodeBlock>

### 步骤 5：验证 overlay 生效

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source ~/qrb_ros_ws/install/setup.bash
ros2 pkg prefix qrb_ros_nn_inference
```

</NewCodeBlock>

应输出 `~/qrb_ros_ws/install/qrb_ros_nn_inference`，确认用的是源码版本而非 APT 版。

### 步骤 6：运行推理

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source ~/qrb_ros_ws/install/setup.bash
ros2 launch qrb_ros_post_process nn_node_test.launch.py
```

</NewCodeBlock>

预期日志中看到 `libqrb_ros_inference_node.so` 从 `~/qrb_ros_ws/install/` 加载。

按 `Ctrl + C` 停止后，可视化步骤与方式一相同。

## 验证结果

两种方式对同一输入产生字节级完全一致的推理输出（SHA-256 相同）。对于 `bus.jpg` 测试图像，置信度 0.5 下 NMS 保留 4 个检测框：1 辆 bus、3 个 person。
