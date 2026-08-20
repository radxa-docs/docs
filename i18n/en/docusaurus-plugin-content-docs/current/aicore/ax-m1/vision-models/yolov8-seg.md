---
sidebar_position: 7
doc_kind: page
last_verified: 2026-08-19
---

# YOLOv8-Seg

This document explains how to run the YOLOv8-seg sample application on a host device equipped with the Radxa AICore AX-M1.

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
hf download AXERA-TECH/YOLOv8-Seg \
  AX650/yolov8s-seg_640x640_npu3.axmodel \
  ax_infer.py \
  bus.jpg \
  --local-dir ./YOLOv8-Seg
cd YOLOv8-Seg
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
python3 ax_infer.py --model-path AX650/yolov8s-seg_640x640_npu3.axmodel --test-img bus.jpg --providers AXCLRTExecutionProvider
```

</NewCodeBlock>

```text
[YOLOv8-Seg] [10:51:49.774] [DEBUG] Load model time = 635.89 ms
[YOLOv8-Seg] [10:51:49.801] [DEBUG] Pre-process time = 5.27 ms
[YOLOv8-Seg] [10:51:49.840] [DEBUG] Forward time = 38.11 ms
[YOLOv8-Seg] [10:51:49.846] [DEBUG] Post-process time = 5.90 ms
[YOLOv8-Seg] [10:51:49.847] [DEBUG] Proto shape: (32, 160, 160)
[YOLOv8-Seg] [10:51:49.883] [INFO] Draw Results (5 objects):
[YOLOv8-Seg] [10:51:49.883] [INFO] (51, 398, 243, 903) -> person: 0.89
[YOLOv8-Seg] [10:51:49.922] [INFO] (221, 407, 345, 860) -> person: 0.88
[YOLOv8-Seg] [10:51:49.931] [INFO] (669, 393, 809, 879) -> person: 0.88
[YOLOv8-Seg] [10:51:49.937] [INFO] (24, 228, 799, 751) -> bus: 0.86
[YOLOv8-Seg] [10:51:49.953] [INFO] (0, 545, 76, 874) -> person: 0.74
[YOLOv8-Seg] [10:51:49.969] [INFO] Saved to result_yolov8_seg.jpg
[INFO] Available providers:  ['AXCLRTExecutionProvider']
[INFO] Using provider: AXCLRTExecutionProvider
[INFO] SOC Name: AX650N
[INFO] VNPU type: VNPUType.DISABLED
[INFO] Compiler version: 6.0-dirty a498e20d-dirty
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-ax-m1/yolov8_seg_out.webp"/>
   yolov8-seg demo output
</div>
