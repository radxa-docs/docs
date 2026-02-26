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

```
git clone https://github.com/AXERA-TECH/axcl-samples.git
```

</NewCodeBlock>

## 安装编译工具

<NewCodeBlock tip="Host" type="device">

```
sudo apt update
sudo apt install build-essential cmake libopencv-dev
```

</NewCodeBlock>

## 执行编译命令

<NewCodeBlock tip="Host" type="device">

```
mkdir build && cd build
cmake ..
make install -j4
```

</NewCodeBlock>

编译完成后在 `./install/bin` 下看到相关示例程序，即为编译成功

```
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

:::tip[点击跳转到模型 Demo 页面]
<br/>

##### 视觉模型

- **Depth-Anything-V2:** [axcl_depth_anything](./vision-models/depth-anything-v2.md)
- **YOLOv11:** [axcl_yolo11](./vision-models/yolov11.md) · [axcl_yolo11_seg](./vision-models/yolov11-seg.md) · [axcl_yolo11_pose](./vision-models/yolov11-pose.md)
- **YOLOv8:** [axcl_yolov8](./vision-models/yolov8s.md) · [axcl_yolov8_seg](./vision-models/yolov8-seg.md)

##### 多模态模型

- **YOLO-World-V2:** [axcl_yolo_world_open_vocabulary](./VLM/yolo-world-v2.md)

:::
