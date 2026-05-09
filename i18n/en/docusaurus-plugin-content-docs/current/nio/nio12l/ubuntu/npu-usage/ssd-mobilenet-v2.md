---
sidebar_position: 10
description: Complete workflow for SSDMobileNetV2 model conversion (Host) and deployment (Device) on NIO12L
---

# SSDMobileNetV2

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

### Download and Export Model

:::tip

If you haven't installed project dependencies, run this in the project root:

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

### Prepare Calibration Data

<NewCodeBlock tip="Host PC" type="host">

```bash
cd ..
python prepare_calibration_data.py path=./datasets/coco128/images/train2017 imgsz=300
```

</NewCodeBlock>

### Convert Model

<NewCodeBlock tip="Host PC" type="host">

```bash
cd ssd_mobilenet_v2
python convert_mtk_fp32.py
python convert_mtk_int8.py
```

</NewCodeBlock>

After conversion, the following files are generated in `ssd_mobilenet_v2/`:

- `ssd_mobilenet_v2_mtk_fp32.tflite`
- `ssd_mobilenet_v2_mtk_int8.tflite`

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
scp ssd_mobilenet_v2_mtk_int8.tflite <user>@<device>:/path/to/nio12l-model-zoo/models/ssd_mobilenet_v2/int8/
scp ssd_mobilenet_v2_mtk_fp32.tflite <user>@<device>:/path/to/nio12l-model-zoo/models/ssd_mobilenet_v2/fp32/
```

</NewCodeBlock>

### Convert to DLA

<NewCodeBlock tip="Device" type="device">

```bash
cd models/ssd_mobilenet_v2/int8
ncc-tflite --arch=mdla2.0 -d ssd_mobilenet_v2_int8.dla ssd_mobilenet_v2_mtk_int8.tflite
cd ../fp32
ncc-tflite --arch=mdla2.0 -d ssd_mobilenet_v2_fp32.dla ssd_mobilenet_v2_mtk_fp32.tflite --relax-fp32
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
./build/ssd_mobilenet_v2_demo
```

</NewCodeBlock>

Use FP32 model and specify an image:

<NewCodeBlock tip="Device" type="device">

```bash
./build/ssd_mobilenet_v2_demo --fp32 --image assets/images/bus.jpg
```

</NewCodeBlock>

Results are saved in `outputs/ssd_mobilenet_v2/` (`vis/` for visualization images, `detections/` for JSON).
