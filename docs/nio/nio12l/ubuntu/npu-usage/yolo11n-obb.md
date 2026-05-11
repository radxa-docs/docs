---
sidebar_position: 17
description: NIO12L 平台 YOLO11n-OBB 模型的 Host 端转换与 Device 端部署完整流程
---

# YOLO11n-OBB

开始之前，请先完成环境配置：

- [Host 模型转换工具](convert-tool-setup.md) — 安装 NeuroPilot Converter
- [Device 环境配置](env-setup.md) — 安装 Neuron SDK

## Host 端模型转换

### 克隆项目

<NewCodeBlock tip="Host PC" type="host">

```bash
git clone https://github.com/Ronin-1124/nio12l-model-zoo.git
cd nio12l-model-zoo
```

</NewCodeBlock>

### 导出 ONNX

:::tip

如果还没有 yolo-export 环境，请先创建并安装依赖：

`conda create -n yolo-export python`

`conda activate yolo-export`

`pip install ultralytics`

:::

<NewCodeBlock tip="Host PC" type="host">

```bash
cd examples/yolo11n-obb/convert_model
conda activate yolo-export
yolo export model=yolo11n-obb format=onnx opset=13 imgsz=1024
```

</NewCodeBlock>

### 裁剪 ONNX

:::tip

如果还没有安装项目依赖，请先在项目根目录运行：

`pip install -r requirements.txt`

:::

<NewCodeBlock tip="Host PC" type="host">

```bash
conda activate np8
python cut_onnx.py
```

</NewCodeBlock>

### 准备校准数据

<NewCodeBlock tip="Host PC" type="host">

```bash
cd ../../..
python prepare_calibration_data.py path=./datasets/dota128/images/train imgsz=1024
```

</NewCodeBlock>

### 转换模型

<NewCodeBlock tip="Host PC" type="host">

```bash
cd examples/yolo11n-obb/convert_model
python convert_mtk_fp32.py
python convert_mtk_int8.py
```

</NewCodeBlock>

转换完成后，在 `examples/yolo11n-obb/model/` 目录下生成：

- `int8/yolo11n-obb_mtk_int8.tflite`
- `fp32/yolo11n-obb_mtk_fp32.tflite`

## Device 端部署

### 克隆项目

<NewCodeBlock tip="Device" type="device">

```bash
git clone https://github.com/Ronin-1124/nio12l-model-zoo.git
cd nio12l-model-zoo
```

</NewCodeBlock>

### 传输模型

将 Host 端生成的 tflite 文件传输到设备端：

<NewCodeBlock tip="Host PC" type="host">

```bash
scp yolo11n-obb_mtk_int8.tflite <user>@<device>:/path/to/nio12l-model-zoo/examples/yolo11n-obb/model/int8/
scp yolo11n-obb_mtk_fp32.tflite <user>@<device>:/path/to/nio12l-model-zoo/examples/yolo11n-obb/model/fp32/
```

</NewCodeBlock>

### 转换为 DLA

<NewCodeBlock tip="Device" type="device">

```bash
cd examples/yolo11n-obb/model/int8
ncc-tflite --arch=mdla2.0 -d yolo11n-obb_int8.dla yolo11n-obb_mtk_int8.tflite
cd ../fp32
ncc-tflite --arch=mdla2.0 -d yolo11n-obb_fp32.dla yolo11n-obb_mtk_fp32.tflite --relax-fp32
```

</NewCodeBlock>

### 编译

<NewCodeBlock tip="Device" type="device">

```bash
cd /path/to/nio12l-model-zoo
cmake -S . -B build
cmake --build build -j
```

</NewCodeBlock>

### 运行

默认使用 INT8 模型，输入 `assets/images/boats.jpg`：

<NewCodeBlock tip="Device" type="device">

```bash
./build/yolo11n-obb_demo
```

</NewCodeBlock>

使用 FP32 模型：

<NewCodeBlock tip="Device" type="device">

```bash
./build/yolo11n-obb_demo --fp32
```

</NewCodeBlock>

指定图片：

<NewCodeBlock tip="Device" type="device">

```bash
./build/yolo11n-obb_demo --image assets/images/boats.jpg
```

</NewCodeBlock>

结果保存在 `outputs/yolo11n-obb/` 目录下（`vis/` 为可视化图片，`detections/` 为 JSON）。
