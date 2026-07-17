---
sidebar_position: 20
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-15
---

# ResNet101 Image Classification

Run ResNet101 image classification with the `glasses.jpg` image supplied by Qualcomm. The sample resizes the input to `224 x 224`, runs inference on the DSP through the QNN HTP backend, and publishes the highest-scoring class as a text message.

This page covers local image input only. QRB, GMSL, and USB camera input were not verified.

## Pipeline

```text
glasses.jpg
  -> image_publisher -> /image_raw
  -> resize to 224 x 224
  -> /qrb_inference_input_tensor
  -> QNN ResNet101 inference
  -> /qrb_inference_output_tensor
  -> ImageNet label mapping
  -> /resnet101_output
```

## ROS 2 Topics

| Topic                          | Type                                      | Description                   |
| ------------------------------ | ----------------------------------------- | ----------------------------- |
| `/image_raw`                   | `sensor_msgs/msg/Image`                   | Input image                   |
| `/qrb_inference_input_tensor`  | `qrb_ros_tensor_list_msgs/msg/TensorList` | Preprocessed tensor           |
| `/qrb_inference_output_tensor` | `qrb_ros_tensor_list_msgs/msg/TensorList` | QNN inference output tensor   |
| `/resnet101_output`            | `std_msgs/msg/String`                     | ImageNet classification label |

> The Qualcomm user guide lists `/resnet101_results` in its topic table, but both the current Debian package and source publish `/resnet101_output`.

## Prerequisites

- [QIR SDK installed](qir-sdk.md)
- GitHub and Hugging Face access from the Q900
- At least 50 MB free under `/opt/model`

## Run the Debian Package

### Step 1: Install the Sample

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ros-jazzy-sample-resnet101
```

</NewCodeBlock>

### Step 2: Verify the Model and Repair the ImageNet Labels

First verify the model downloaded by the package. The post-installation script in `ros-jazzy-sample-resnet101` 1.0.1 uses a GitHub path that has since moved and may leave a zero-byte `/opt/model/imagenet_labels.txt`, so download the labels from their current path:

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

Expected output:

```text
/opt/model/ResNet101_w8a8.bin: OK
/opt/model/imagenet_labels.txt: OK
```

### Step 3: Launch the Sample

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
export ROS_DOMAIN_ID=123
ros2 launch sample_resnet101 launch_with_image_publisher.py
```

</NewCodeBlock>

The launch file publishes `/opt/ros/jazzy/share/sample_resnet101/glasses.jpg` at 10 Hz by default and uses `/opt/model/ResNet101_w8a8.bin`. You can also specify another local image:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ros2 launch sample_resnet101 launch_with_image_publisher.py \
  image_path:=<your-local-image-path>
```

</NewCodeBlock>

## Build from Source

### Step 1: Install Dependencies

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

### Step 2: Prepare the Model and Labels

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

Verify both files:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
echo "bfed3e96598ed276600a1e53c8a59decd287258881cd9849141a20a76e0da803  /opt/model/ResNet101_w8a8.bin" | \
  sha256sum --check
echo "e697a491aa735cc6c2aaf982f8e86e8fc7b0a1ea7750a2cc6a2bdfc1e109012f  /opt/model/imagenet_labels.txt" | \
  sha256sum --check
```

</NewCodeBlock>

### Step 3: Clone the Source

Use the workspace path from the official sample:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir -p ~/qrb_ros_ws/src && cd ~/qrb_ros_ws/src
git clone https://github.com/qualcomm-qrb-ros/qrb_ros_samples.git
```

</NewCodeBlock>

### Step 4: Build

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws/src/qrb_ros_samples/ai_vision/sample_resnet101
source /opt/ros/jazzy/setup.bash
colcon build
source install/setup.bash
```

</NewCodeBlock>

Expected output:

```text
Starting >>> sample_resnet101
Finished <<< sample_resnet101
Summary: 1 package finished
```

### Step 5: Run the Source Build

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~/qrb_ros_ws/src/qrb_ros_samples/ai_vision/sample_resnet101
source /opt/ros/jazzy/setup.bash
source install/setup.bash
export ROS_DOMAIN_ID=123
ros2 launch sample_resnet101 launch_with_image_publisher.py
```

</NewCodeBlock>

## Expected Output

The model initializes and repeatedly performs inference:

```text
Loaded 1000 class labels.
/usr/lib/libQnnHtp.so initialize successfully
Qnn device initialize successfully
Initialize Qnn graph from binary file successfully
Inference init successfully!
Inference execute successfully!
```

## Validation

Check the actual output topic from another terminal:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
export ROS_DOMAIN_ID=123
source /opt/ros/jazzy/setup.bash
ros2 topic info /resnet101_output -v
ros2 topic echo /resnet101_output --once
```

</NewCodeBlock>

The default `glasses.jpg` should produce:

```text
data: sunglass
---
```

The Debian package 1.0.1 may display extra line breaks after `sunglass`. This is a formatting difference caused by how that version reads the labels and does not affect the classification result. The current source removes the extra line break.

## Stop

Press `Ctrl + C` in the terminal running the sample.

When stopped during continuous inference, the QNN container may exit with `-11`, and the Python nodes may print `ExternalShutdownException`. These errors occur during shutdown and do not affect classifications published earlier; confirm that the related processes have exited.

## Limitations

- Only the local image supplied by Qualcomm was verified. Camera input was not tested.
- Cross-device topic inspection was not tested. Only local Q900 inference and result publication were validated.
- ResNet101 returns one of 1000 ImageNet labels; it does not return object locations or bounding boxes.
