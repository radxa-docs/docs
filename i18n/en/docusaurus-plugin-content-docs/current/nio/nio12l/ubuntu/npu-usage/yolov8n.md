---
sidebar_position: 11
description: Complete workflow for YOLOv8n model conversion (Host) and deployment (Device) on NIO12L
---

# YOLOv8n

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

### Export ONNX

:::tip

If you haven't set up the yolo-export environment, create it and install dependencies:

`conda create -n yolo-export python`

`conda activate yolo-export`

`pip install ultralytics`

:::

<NewCodeBlock tip="Host PC" type="host">

```bash
cd examples/yolov8n/convert_model
conda activate yolo-export
yolo export model=yolov8n format=onnx opset=13 imgsz=640
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
cd ../../..
python prepare_calibration_data.py path=./datasets/coco128/images/train2017 imgsz=640
```

</NewCodeBlock>

### Convert Model

<NewCodeBlock tip="Host PC" type="host">

```bash
cd examples/yolov8n/convert_model
python convert_mtk_fp32.py
python convert_mtk_int8.py
```

</NewCodeBlock>

After conversion, the following files are generated in `examples/yolov8n/model/`:

- `int8/yolov8n_mtk_int8.tflite`
- `fp32/yolov8n_mtk_fp32.tflite`

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
scp yolov8n_mtk_int8.tflite <user>@<device>:/path/to/nio12l-model-zoo/examples/yolov8n/model/int8/
scp yolov8n_mtk_fp32.tflite <user>@<device>:/path/to/nio12l-model-zoo/examples/yolov8n/model/fp32/
```

</NewCodeBlock>

### Convert to DLA

<NewCodeBlock tip="Device" type="device">

```bash
cd examples/yolov8n/model/int8
ncc-tflite --arch=mdla2.0 -d yolov8n_int8.dla yolov8n_mtk_int8.tflite
cd ../fp32
ncc-tflite --arch=mdla2.0 -d yolov8n_fp32.dla yolov8n_mtk_fp32.tflite --relax-fp32
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
./build/yolov8n_demo
```

</NewCodeBlock>

Use FP32 model:

<NewCodeBlock tip="Device" type="device">

```bash
./build/yolov8n_demo --fp32
```

</NewCodeBlock>

Specify images:

<NewCodeBlock tip="Device" type="device">

```bash
./build/yolov8n_demo --image assets/images/bus.jpg --image assets/images/zidane.jpg
```

</NewCodeBlock>

Results are saved in `outputs/yolov8n/` (`vis/` for visualization images, `detections/` for JSON).
