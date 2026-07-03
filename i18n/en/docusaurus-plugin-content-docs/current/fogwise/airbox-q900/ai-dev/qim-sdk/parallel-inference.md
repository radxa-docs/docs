---
sidebar_position: 11
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Parallel AI Fusion

`gst-ai-parallel-inference` runs **multiple AI models simultaneously** on a single video stream, with all models inferring in parallel on the NPU and results fused into a single display.

The default configuration runs 4 models concurrently: object detection (YOLOX), classification (InceptionV3), pose detection (HRNet), and segmentation (DeepLabV3+), all executing in parallel on DSP.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Models

```bash
ls -l /etc/models/{yolox_quantized,inception_v3_quantized,hrnet_pose_quantized,deeplabv3_plus_mobilenet_quantized}.tflite
```

### 2. View Configuration

```bash
cat /etc/configs/config-parallel-inference.json
```

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-parallel-inference --config-file=/etc/configs/config-parallel-inference.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

```text
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
VERBOSE: Replacing 142 out of 142 node(s) with delegate (TfLiteQnnDelegate) node
VERBOSE: Replacing 518 out of 518 node(s) with delegate (TfLiteQnnDelegate) node
VERBOSE: Replacing 136 out of 136 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

The display simultaneously shows bounding boxes, classification labels, human skeletons, and segmentation masks — all four AI results overlaid on the same frame.

## Validation

- 4 models (329 + 142 + 518 + 136 = 1,125 operators) running in parallel on DSP
- Pipeline reaches `PLAYING` state
- Display shows all four inference results simultaneously

This demonstrates that the Q900 HTP V73 NPU supports concurrent multi-model processing.
