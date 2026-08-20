---
sidebar_position: 6
doc_kind: page
last_verified: 2026-08-19
---

# YOLOv8

This document explains how to run the YOLOv8 sample application on a host device equipped with the Radxa AICore AX-M1.

:::tip
For instructions on building the executable, see [**AXCL-Samples build examples**](../axcl-samples.md). Python inference depends on [PyAXEngine](https://github.com/AXERA-TECH/pyaxengine).
:::

Precompiled model quantization format: **w8a16**.

## Create a virtual environment

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv && source .venv/bin/activate
```

</NewCodeBlock>

## Download the demo repository

Download only the triple-core model and inference script required by the AX-M1:

<NewCodeBlock tip="Host" type="device">

```bash
pip3 install -U "huggingface_hub"
hf download AXERA-TECH/YOLOv8 \
  AX650/yolov8s_640x640_npu3.axmodel \
  ax_infer.py \
  bus.jpg \
  --local-dir ./YOLOv8
cd YOLOv8
```

</NewCodeBlock>

## Example usage

### Install Python dependencies

<NewCodeBlock tip="Host" type="device">

```bash
pip3 install opencv-python-headless
pip3 install https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc3/axengine-0.1.3-py3-none-any.whl
```

</NewCodeBlock>

### Model inference

The Radxa AICore AX-M1 is an M.2 accelerator card, so you must specify `AXCLRTExecutionProvider`.

<NewCodeBlock tip="Host" type="device">

```bash
python3 ax_infer.py --model-path AX650/yolov8s_640x640_npu3.axmodel --test-img bus.jpg --providers AXCLRTExecutionProvider
```

</NewCodeBlock>

```text
[YOLOv8-Det] [10:51:29.884] [DEBUG] Load model time = 590.74 ms
[YOLOv8-Det] [10:51:29.916] [DEBUG] Pre-process time = 4.71 ms
[YOLOv8-Det] [10:51:29.939] [DEBUG] Forward time = 22.50 ms
[YOLOv8-Det] [10:51:29.943] [DEBUG] Post-process time = 3.68 ms
[YOLOv8-Det] [10:51:29.944] [INFO] Draw Results (5 objects):
[YOLOv8-Det] [10:51:29.944] [INFO] (14, 227, 807, 746) -> bus: 0.93
[YOLOv8-Det] [10:51:29.983] [INFO] (668, 393, 810, 881) -> person: 0.88
[YOLOv8-Det] [10:51:29.984] [INFO] (50, 399, 243, 903) -> person: 0.88
[YOLOv8-Det] [10:51:29.984] [INFO] (222, 408, 345, 860) -> person: 0.88
[YOLOv8-Det] [10:51:29.984] [INFO] (0, 550, 70, 867) -> person: 0.63
[YOLOv8-Det] [10:51:29.994] [INFO] Saved to result_yolov8_det.jpg
[INFO] Available providers:  ['AXCLRTExecutionProvider']
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 6.0-dirty a498e20d-dirty
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-ax-m1/yolov8_out.webp"/>
   yolov8 demo output
</div>
