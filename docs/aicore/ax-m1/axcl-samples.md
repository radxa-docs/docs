---
sidebar_position: 11
---

# AXCL-Samples 编译示例

**AXCL-Samples** 是一个示例项目，可帮助开发者快速了解如何编译出可在瑞莎智核 AX-M1 上运行模型的可执行程序。

**AXCL** 是一个 API 库，提供运行资源管理，内存管理，模型加载和执行，媒体数据处理等 API 。

:::tip
AXCL-Samples提供**本地编译**和**交叉编译**两种编译方式，本文档演示**本地编译**。

您需要根据 [**环境安装**](./getting-started/env_install.md) 配置好 AXCL 驱动.
:::

## 下载示例应用仓库

<NewCodeBlock tip="Host" type="device">

```bash
git clone https://github.com/AXERA-TECH/axcl-samples.git
```

</NewCodeBlock>

## 安装编译工具

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt update
sudo apt install build-essential cmake libopencv-dev
```

</NewCodeBlock>

## 执行编译命令

<NewCodeBlock tip="Host" type="device">

```bash
mkdir build && cd build
cmake ..
make install -j4
```

</NewCodeBlock>

编译完成后在 `./install/bin` 下看到相关示例程序，即为编译成功

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

:::tip[点击跳转到模型 Demo 页面]
<br/>

##### 视觉模型

- **Depth-Anything-V2:** [ax_depth_anything](./vision-models/depth-anything-v2.md)
- **YOLOv11:** [ax_yolo11](./vision-models/yolov11.md) · [ax_yolo11_seg](./vision-models/yolov11-seg.md) · [ax_yolo11_pose](./vision-models/yolov11-pose.md)
- **YOLOv8:** [ax_yolov8](./vision-models/yolov8s.md) · [ax_yolov8_seg](./vision-models/yolov8-seg.md)

##### 多模态模型

- **YOLO-World-V2:** [YOLO-World-V2](./VLM/yolo-world-v2.md)

:::
