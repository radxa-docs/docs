---
sidebar_position: 17
description: Complete workflow for YOLO11n-OBB model conversion (Host) and deployment (Device) on NIO12L
---

# YOLO11n-OBB

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

### Export ONNX

:::tip

If you haven't set up the yolo-export environment, create it and install dependencies:

`conda create -n yolo-export python`

`conda activate yolo-export`

`pip install ultralytics`

:::

<NewCodeBlock tip="Host PC" type="host">

```bash
cd yolo11n-obb
conda activate yolo-export
yolo export model=yolo11n-obb format=onnx opset=13 imgsz=1024
```

</NewCodeBlock>

### Cut ONNX

:::tip

If you haven't installed project dependencies, run this in the project root:

`pip install -r requirements.txt`

:::

<NewCodeBlock tip="Host PC" type="host">

```bash
conda activate np8
python cut_onnx.py
```

</NewCodeBlock>

### Prepare Calibration Data

<NewCodeBlock tip="Host PC" type="host">

```bash
cd ..
python prepare_calibration_data.py path=./datasets/dota128/images/train imgsz=1024
```

</NewCodeBlock>

### Convert Model

<NewCodeBlock tip="Host PC" type="host">

```bash
cd yolo11n-obb
python convert_mtk_fp32.py
python convert_mtk_int8.py
```

</NewCodeBlock>

After conversion, the following files are generated in `yolo11n-obb/`:

- `yolo11n-obb_mtk_fp32.tflite`
- `yolo11n-obb_mtk_int8.tflite`

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
scp yolo11n-obb_mtk_int8.tflite <user>@<device>:/path/to/nio12l-model-zoo/models/yolo11n-obb/int8/
scp yolo11n-obb_mtk_fp32.tflite <user>@<device>:/path/to/nio12l-model-zoo/models/yolo11n-obb/fp32/
```

</NewCodeBlock>

### Convert to DLA

<NewCodeBlock tip="Device" type="device">

```bash
cd models/yolo11n-obb/int8
ncc-tflite --arch=mdla2.0 -d yolo11n-obb_int8.dla yolo11n-obb_mtk_int8.tflite
cd ../fp32
ncc-tflite --arch=mdla2.0 -d yolo11n-obb_fp32.dla yolo11n-obb_mtk_fp32.tflite --relax-fp32
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

Default uses INT8 model with `assets/images/boats.jpg`:

<NewCodeBlock tip="Device" type="device">

```bash
./build/yolo11n-obb_demo
```

</NewCodeBlock>

Use FP32 model:

<NewCodeBlock tip="Device" type="device">

```bash
./build/yolo11n-obb_demo --fp32
```

</NewCodeBlock>

Specify images:

<NewCodeBlock tip="Device" type="device">

```bash
./build/yolo11n-obb_demo --image assets/images/boats.jpg
```

</NewCodeBlock>

Results are saved in `outputs/yolo11n-obb/` (`vis/` for visualization images, `detections/` for JSON).
