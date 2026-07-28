---
sidebar_position: 8
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# Model Inference

Demonstrates how to run TensorFlow Lite model inference on the DSP using the QRB ROS NN Inference node, including image preprocessing, inference, and result visualization.

## Prerequisites

- [QIR SDK installed](qir-sdk.md)
- A converted YOLOv8 single-batch model, see [Model Export](../../../ai-dev/qim-sdk/model-export.md)

## Method 1: Out-of-the-Box

Use the APT-installed inference node, building only the pre/post-processing test nodes from source.

### Step 1: Install the Inference Node

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ros-jazzy-qrb-ros-nn-inference
```

</NewCodeBlock>

### Step 2: Clone Repository and Prepare Test Data

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p ~/ros-ws/src && cd ~/ros-ws/src
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_nn_inference
```

</NewCodeBlock>

Download the test image:

```bash
wget -P ~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_pre_process/image/ \
  https://ultralytics.com/images/bus.jpg
```

Convert the test image to model input format:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 ~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_post_process/scripts/yolov8_input_pre_process.py
```

</NewCodeBlock>

### Step 3: Configure Model and Image Paths

Edit `~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_post_process/launch/nn_node_test.launch.py` and update:

- `image_path`: absolute path to `bus.raw`
- `model_path`: absolute path to the YOLOv8 model

### Step 4: Build Pre/Post-Processing Nodes

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

### Step 5: Run Inference

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/ros-ws
source /opt/ros/jazzy/setup.bash
source install/local_setup.bash
ros2 launch qrb_ros_post_process nn_node_test.launch.py
```

</NewCodeBlock>

The log should show `libqrb_ros_inference_node.so` loaded from `/opt/ros/jazzy/lib/`, with `Inference execute Successfully!` printed after successful inference.

Press `Ctrl + C` to stop after at least one inference completes.

### Step 6: Visualize Results

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 ~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_post_process/scripts/qrb_ros_yolo_detection_visualizer.py \
  --original_image ~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_pre_process/image/bus.jpg
```

</NewCodeBlock>

Results at `~/ros-ws/src/qrb_ros_nn_inference/test/qrb_ros_post_process/inference_result/detection_result.jpg`.

![YOLOv8 detection result](/img/fogwise/airbox-q900/airbox-q900-qir-sdk-nn-inference-yolov8-detection.webp)

## Method 2: Build from Source

Build the complete inference pipeline from source: inference manager, NN inference node, Tensor message interfaces, and pre/post-processing.

### Step 1: Install Dependencies

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y software-properties-common colcon \
  libtensorflow-lite-c-qcom1 libtensorflow-lite-qcom-dev \
  libqnn-dev libqnn1
```

</NewCodeBlock>

### Step 2: Clone Repositories

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p ~/qrb_ros_ws/src && cd ~/qrb_ros_ws/src
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_nn_inference
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_interfaces
```

</NewCodeBlock>

### Step 3: Fix QNN Header Path

The following verification is based on QAIRT 2.46. In this version, QNN headers are installed under `/usr/include/QNN`, which the repository's CMake does not include. Add the following to `~/qrb_ros_ws/src/qrb_ros_nn_inference/qrb_inference_manager/CMakeLists.txt`:

```cmake
include_directories(
  include
  /usr/include/QNN
)
```

### Step 4: Build

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws
source /opt/ros/jazzy/setup.bash
colcon build --packages-up-to qrb_ros_nn_inference \
  --allow-overriding qrb_ros_tensor_list_msgs qrb_inference_manager qrb_ros_nn_inference \
  --cmake-args -DBUILD_TESTING=OFF
```

</NewCodeBlock>

### Step 5: Verify Overlay

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source ~/qrb_ros_ws/install/setup.bash
ros2 pkg prefix qrb_ros_nn_inference
```

</NewCodeBlock>

Should output `~/qrb_ros_ws/install/qrb_ros_nn_inference`, confirming the source-built version is used.

### Step 6: Run Inference

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
source ~/qrb_ros_ws/install/setup.bash
ros2 launch qrb_ros_post_process nn_node_test.launch.py
```

</NewCodeBlock>

The log should show `libqrb_ros_inference_node.so` loaded from `~/qrb_ros_ws/install/`.

After stopping with `Ctrl + C`, the visualization step is identical to Method 1.

## Verified Results

Both methods produce byte-identical inference outputs (SHA-256 match). For the `bus.jpg` test image at confidence 0.5, NMS retains 4 detections: 1 bus and 3 persons.
