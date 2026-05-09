---
sidebar_position: 10
description: NIO12L 平台 SSDMobileNetV2 模型的 Host 端转换与 Device 端部署完整流程
---

# SSDMobileNetV2

开始之前，请先完成环境配置：

- [Host 模型转换工具](convert-tool-setup.md) — 安装 NeuroPilot Converter
- [Device 环境配置](env-setup.md) — 安装 Neuron SDK

## Host 端模型转换

### 克隆项目

<NewCodeBlock tip="Host PC" type="host">

```bash
git clone https://github.com/Ronin-1124/nio12l-model-conversion.git
cd nio12l-model-conversion
```

</NewCodeBlock>

### 下载并导出模型

:::tip

如果还没有安装项目依赖，请先在项目根目录运行：

`pip install -r requirements.txt`

:::

<NewCodeBlock tip="Host PC" type="host">

```bash
conda activate np8
cd ssd_mobilenet_v2
python download_model.py
python export_onnx.py
```

</NewCodeBlock>

### 准备校准数据

<NewCodeBlock tip="Host PC" type="host">

```bash
cd ..
python prepare_calibration_data.py path=./datasets/coco128/images/train2017 imgsz=300
```

</NewCodeBlock>

### 转换模型

<NewCodeBlock tip="Host PC" type="host">

```bash
cd ssd_mobilenet_v2
python convert_mtk_fp32.py
python convert_mtk_int8.py
```

</NewCodeBlock>

转换完成后，在 `ssd_mobilenet_v2/` 目录下生成：

- `ssd_mobilenet_v2_mtk_fp32.tflite`
- `ssd_mobilenet_v2_mtk_int8.tflite`

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
scp ssd_mobilenet_v2_mtk_int8.tflite <user>@<device>:/path/to/nio12l-model-zoo/models/ssd_mobilenet_v2/int8/
scp ssd_mobilenet_v2_mtk_fp32.tflite <user>@<device>:/path/to/nio12l-model-zoo/models/ssd_mobilenet_v2/fp32/
```

</NewCodeBlock>

### 转换为 DLA

<NewCodeBlock tip="Device" type="device">

```bash
cd models/ssd_mobilenet_v2/int8
ncc-tflite --arch=mdla2.0 -d ssd_mobilenet_v2_int8.dla ssd_mobilenet_v2_mtk_int8.tflite
cd ../fp32
ncc-tflite --arch=mdla2.0 -d ssd_mobilenet_v2_fp32.dla ssd_mobilenet_v2_mtk_fp32.tflite --relax-fp32
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

默认使用 INT8 模型：

<NewCodeBlock tip="Device" type="device">

```bash
./build/ssd_mobilenet_v2_demo
```

</NewCodeBlock>

使用 FP32 模型并指定图片：

<NewCodeBlock tip="Device" type="device">

```bash
./build/ssd_mobilenet_v2_demo --fp32 --image assets/images/bus.jpg
```

</NewCodeBlock>

结果保存在 `outputs/ssd_mobilenet_v2/` 目录下（`vis/` 为可视化图片，`detections/` 为 JSON）。
