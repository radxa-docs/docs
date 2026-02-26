---
sidebar_position: 15
---

# AXCL-Samples Build Examples

**AXCL-Samples** is a sample project that helps developers quickly learn how to build executables that run models on the Radxa AICore AX-M1.

**AXCL** is an API library providing runtime resource management, memory management, model loading and execution, and media data processing APIs.

:::tip
AXCL-Samples supports both **native build** and **cross-compilation**. This document demonstrates the **native build**.

Make sure the AXCL driver is installed as described in [**Environment installation**](./getting-started/env_install.md).
:::

## Download the sample repository

<NewCodeBlock tip="Host" type="device">

```bash
git clone https://github.com/AXERA-TECH/axcl-samples.git
```

</NewCodeBlock>

## Install build tools

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt update
sudo apt install build-essential cmake libopencv-dev
```

</NewCodeBlock>

## Build commands

<NewCodeBlock tip="Host" type="device">

```bash
mkdir build && cd build
cmake ..
make install -j4
```

</NewCodeBlock>

After a successful build, you should see the sample executables under `./install/bin`.

```bash
radxa@rock-5b-plus:/Workspace/ax-sdk-demo/axcl-samples/build/install/bin$ tree ./
./
├── axcl_classification
├── axcl_depth_anything
├── axcl_yolo11
├── axcl_yolo11_pose
├── axcl_yolo11_seg
├── axcl_yolov10
├── axcl_yolov10_u
├── axcl_yolov5_face
├── axcl_yolov5s
├── axcl_yolov5s_seg
├── axcl_yolov7_face
├── axcl_yolov8
├── axcl_yolov8_pose
├── axcl_yolov8_seg
├── axcl_yolov9
├── axcl_yolov9_u
└── axcl_yolo_world_open_vocabulary
```

:::tip[Click to jump to model demo pages]
<br/>

##### Vision models

- **Depth-Anything-V2:** [axcl_depth_anything](./vision-models/depth-anything-v2.md)
- **YOLOv11:** [axcl_yolo11](./vision-models/yolov11.md) · [axcl_yolo11_seg](./vision-models/yolov11-seg.md) · [axcl_yolo11_pose](./vision-models/yolov11-pose.md)
- **YOLOv8:** [axcl_yolov8](./vision-models/yolov8s.md) · [axcl_yolov8_seg](./vision-models/yolov8-seg.md)

##### Multimodal models

- **YOLO-World-V2:** [axcl_yolo_world_open_vocabulary](./VLM/yolo-world-v2.md)

:::
