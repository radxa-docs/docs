---
sidebar_position: 8
description: NIO12L 平台 EfficientNetB0 模型的 Host 端转换与 Device 端部署完整流程
---

# EfficientNetB0

开始之前，请先完成环境配置：

- [Host 模型转换工具](convert-tool-setup.md) — 安装 NeuroPilot Converter
- [Device 环境配置](env-setup.md) — 安装 Neuron SDK

## Host 端模型转换

:::tip 快速体验

如果只需在设备端快速运行模型，可以跳过 Host 端转换，直接使用[预编译 DLA 模型](#方式一下载预编译-dla推荐)。

:::

### 克隆项目

<NewCodeBlock tip="Host PC" type="host">

```bash
git clone https://github.com/Ronin-1124/nio12l-model-zoo.git
cd nio12l-model-zoo
```

</NewCodeBlock>

### 下载模型

:::tip

如果还没有安装项目依赖，请先在项目根目录运行：

`pip install -r requirements.txt`

:::

<NewCodeBlock tip="Host PC" type="host">

```bash
cd examples/efficientnet_b0_classification/convert_model
conda activate np8
python download_model.py
```

</NewCodeBlock>

### 准备校准数据

<NewCodeBlock tip="Host PC" type="host">

```bash
cd ../../..
python prepare_calibration_data.py path=./datasets/imagenet100 imgsz=224
```

</NewCodeBlock>

### 转换模型

<NewCodeBlock tip="Host PC" type="host">

```bash
cd examples/efficientnet_b0_classification/convert_model
python convert_mtk_fp32.py
python convert_mtk_int8.py
```

</NewCodeBlock>

转换完成后，在 `examples/efficientnet_b0_classification/model/` 目录下生成：

- `int8/efficientnet_b0_mtk_int8.tflite`
- `fp32/efficientnet_b0_mtk_fp32.tflite`

## Device 端部署

### 克隆项目

<NewCodeBlock tip="Device" type="device">

```bash
git clone https://github.com/Ronin-1124/nio12l-model-zoo.git
cd nio12l-model-zoo
```

</NewCodeBlock>

### 获取模型

#### 方式一：下载预编译 DLA（推荐）

<NewCodeBlock tip="Device" type="device">

```bash
wget -P examples/efficientnet_b0_classification/model/int8 https://github.com/Ronin-1124/nio12l-model-zoo/releases/download/v2026.05.11-dla/efficientnet_b0_int8.dla
wget -P examples/efficientnet_b0_classification/model/fp32 https://github.com/Ronin-1124/nio12l-model-zoo/releases/download/v2026.05.11-dla/efficientnet_b0_fp32.dla
```

</NewCodeBlock>

#### 方式二：从 Host 端转换

##### 传输模型

将 Host 端生成的 tflite 文件传输到设备端：

<NewCodeBlock tip="Host PC" type="host">

```bash
scp efficientnet_b0_mtk_int8.tflite <user>@<device>:/path/to/nio12l-model-zoo/examples/efficientnet_b0_classification/model/int8/
scp efficientnet_b0_mtk_fp32.tflite <user>@<device>:/path/to/nio12l-model-zoo/examples/efficientnet_b0_classification/model/fp32/
```

</NewCodeBlock>

##### 转换为 DLA

<NewCodeBlock tip="Device" type="device">

```bash
cd examples/efficientnet_b0_classification/model/int8
ncc-tflite --arch=mdla2.0 -d efficientnet_b0_int8.dla efficientnet_b0_mtk_int8.tflite
cd ../fp32
ncc-tflite --arch=mdla2.0 -d efficientnet_b0_fp32.dla efficientnet_b0_mtk_fp32.tflite --relax-fp32
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
./build/efficientnet_b0_classification_demo
```

</NewCodeBlock>

使用 FP32 模型：

<NewCodeBlock tip="Device" type="device">

```bash
./build/efficientnet_b0_classification_demo --fp32
```

</NewCodeBlock>

结果保存在 `outputs/efficientnet_b0_classification/classifications/`。
