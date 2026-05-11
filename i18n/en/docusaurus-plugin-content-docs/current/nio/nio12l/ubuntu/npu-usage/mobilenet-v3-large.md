---
sidebar_position: 7
description: Complete workflow for MobileNetV3Large model conversion (Host) and deployment (Device) on NIO12L
---

# MobileNetV3Large

Before you begin, complete the environment setup:

- [Host Model Conversion Tool](convert-tool-setup.md) — install NeuroPilot Converter
- [Device Environment Setup](env-setup.md) — install Neuron SDK

## Host-Side Model Conversion

### Clone the Repository

<NewCodeBlock tip="Host PC" type="host">

```bash
git clone https://github.com/Ronin-1124/nio12l-model-zoo.git
cd nio12l-model-zoo
```

</NewCodeBlock>

### Download Model

:::tip

If you haven't installed project dependencies, run this in the project root:

`pip install -r requirements.txt`

:::

<NewCodeBlock tip="Host PC" type="host">

```bash
cd examples/mobilenet_v3_large/convert_model
conda activate np8
python download_model.py
```

</NewCodeBlock>

### Prepare Calibration Data

<NewCodeBlock tip="Host PC" type="host">

```bash
cd ../../..
python prepare_calibration_data.py path=./datasets/imagenet100 imgsz=224
```

</NewCodeBlock>

### Convert Model

<NewCodeBlock tip="Host PC" type="host">

```bash
cd examples/mobilenet_v3_large/convert_model
python convert_mtk_fp32.py
python convert_mtk_int8.py
```

</NewCodeBlock>

After conversion, the following files are generated in `examples/mobilenet_v3_large/model/`:

- `int8/mobilenet_v3_large_mtk_int8.tflite`
- `fp32/mobilenet_v3_large_mtk_fp32.tflite`

## Device-Side Deployment

### Clone the Repository

<NewCodeBlock tip="Device" type="device">

```bash
git clone https://github.com/Ronin-1124/nio12l-model-zoo.git
cd nio12l-model-zoo
```

</NewCodeBlock>

### Transfer Models

Transfer the host-generated tflite files to the device:

<NewCodeBlock tip="Host PC" type="host">

```bash
scp mobilenet_v3_large_mtk_int8.tflite <user>@<device>:/path/to/nio12l-model-zoo/examples/mobilenet_v3_large/model/int8/
scp mobilenet_v3_large_mtk_fp32.tflite <user>@<device>:/path/to/nio12l-model-zoo/examples/mobilenet_v3_large/model/fp32/
```

</NewCodeBlock>

### Convert to DLA

<NewCodeBlock tip="Device" type="device">

```bash
cd examples/mobilenet_v3_large/model/int8
ncc-tflite --arch=mdla2.0 -d mobilenet_v3_large_int8.dla mobilenet_v3_large_mtk_int8.tflite
cd ../fp32
ncc-tflite --arch=mdla2.0 -d mobilenet_v3_large_fp32.dla mobilenet_v3_large_mtk_fp32.tflite --relax-fp32
```

</NewCodeBlock>

### Build

<NewCodeBlock tip="Device" type="device">

```bash
cd /path/to/nio12l-model-zoo
cmake -S . -B build
cmake --build build -j
```

</NewCodeBlock>

### Run

Default uses INT8 model:

<NewCodeBlock tip="Device" type="device">

```bash
./build/mobilenet_v3_large_demo
```

</NewCodeBlock>

Use FP32 model:

<NewCodeBlock tip="Device" type="device">

```bash
./build/mobilenet_v3_large_demo --fp32
```

</NewCodeBlock>

Results are saved in `outputs/mobilenet_v3_large/classifications/`.
