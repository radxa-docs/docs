---
sidebar_position: 11
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

```text
axera@raspberrypi:~/temp/axcl-samples/build $ tree install
install
└── bin
    ├── ax_classification
    ├── ax_depth_anything
    ├── ax_yolo11
    ├── ax_yolo11_pose
    ├── ax_yolo11_seg
    ├── ax_yolov10
    ├── ax_yolov10_u
    ├── ax_yolov5_face
    ├── ax_yolov5s
    ├── ax_yolov5s_seg
    ├── ax_yolov8
    ├── ax_yolov8_pose
    ├── ax_yolov8_seg
    ├── ax_yolov9
    └── ax_yolov9_u
```

:::tip[Click to jump to model demo pages]
<br/>

##### Vision models

- **Depth-Anything-V2:** [ax_depth_anything](./vision-models/depth-anything-v2.md)
- **YOLOv11:** [ax_yolo11](./vision-models/yolov11.md) · [ax_yolo11_seg](./vision-models/yolov11-seg.md) · [ax_yolo11_pose](./vision-models/yolov11-pose.md)
- **YOLOv8:** [ax_yolov8](./vision-models/yolov8s.md) · [ax_yolov8_seg](./vision-models/yolov8-seg.md)

##### Multimodal models

- **YOLO-World-V2:** [YOLO-World-V2](./VLM/yolo-world-v2.md)

:::
