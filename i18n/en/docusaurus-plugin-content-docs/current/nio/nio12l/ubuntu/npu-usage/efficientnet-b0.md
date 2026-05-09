---
sidebar_position: 8
description: Complete workflow for EfficientNetB0 model conversion (Host) and deployment (Device) on NIO12L
---

# EfficientNetB0

Before you begin, complete the environment setup:

- [Host Model Conversion Tool](convert-tool-setup.md) — install NeuroPilot Converter
- [Device Environment Setup](env-setup.md) — install Neuron SDK

## Host-Side Model Conversion

### Clone the Repository

<NewCodeBlock tip="Host PC" type="host">

```bash
git clone https://github.com/Ronin-1124/nio12l-model-conversion.git
cd nio12l-model-conversion
```

</NewCodeBlock>

### Download Model

:::tip

If you haven't installed project dependencies, run this in the project root:

`pip install -r requirements.txt`

:::

<NewCodeBlock tip="Host PC" type="host">

```bash
conda activate np8
cd efficientnet_b0_classification
python download_model.py
```

</NewCodeBlock>

### Prepare Calibration Data

<NewCodeBlock tip="Host PC" type="host">

```bash
cd ..
python prepare_calibration_data.py path=./datasets/imagenet100 imgsz=224
```

</NewCodeBlock>

### Convert Model

<NewCodeBlock tip="Host PC" type="host">

```bash
cd efficientnet_b0_classification
python convert_mtk_fp32.py
python convert_mtk_int8.py
```

</NewCodeBlock>

After conversion, the following files are generated in `efficientnet_b0_classification/`:

- `efficientnet_b0_mtk_fp32.tflite`
- `efficientnet_b0_mtk_int8.tflite`

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
scp efficientnet_b0_mtk_int8.tflite <user>@<device>:/path/to/nio12l-model-zoo/models/efficientnet_b0_classification/int8/
scp efficientnet_b0_mtk_fp32.tflite <user>@<device>:/path/to/nio12l-model-zoo/models/efficientnet_b0_classification/fp32/
```

</NewCodeBlock>

### Convert to DLA

<NewCodeBlock tip="Device" type="device">

```bash
cd models/efficientnet_b0_classification/int8
ncc-tflite --arch=mdla2.0 -d efficientnet_b0_int8.dla efficientnet_b0_mtk_int8.tflite
cd ../fp32
ncc-tflite --arch=mdla2.0 -d efficientnet_b0_fp32.dla efficientnet_b0_mtk_fp32.tflite --relax-fp32
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
./build/efficientnet_b0_classification_demo
```

</NewCodeBlock>

Use FP32 model:

<NewCodeBlock tip="Device" type="device">

```bash
./build/efficientnet_b0_classification_demo --fp32
```

</NewCodeBlock>

Results are saved in `outputs/efficientnet_b0_classification/classifications/`.
