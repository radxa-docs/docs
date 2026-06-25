---
sidebar_position: 10
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Daisy-Chain Detection & Pose Estimation

`gst-ai-daisychain-detection-pose` performs cascaded inference: first [Object Detection](./object-detection.md) locates human bodies, then [Pose Detection](./pose-detection.md) draws skeleton connections for each detected person.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Models

```bash
ls -l /etc/models/yolox_quantized.tflite /etc/models/hrnet_pose_quantized.tflite
```

### 2. View Configuration

```bash
cat /etc/configs/config-daisychain-detection-pose.json
```

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-daisychain-detection-pose --config-file=/etc/configs/config-daisychain-detection-pose.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

```text
Using DSP delegate with TFLITE for Pose
Using DSP delegate with TFLITE for Detection
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
VERBOSE: Replacing 518 out of 518 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

The display shows the test video with bounding boxes and skeleton overlays for detected people.

## Validation

- Detection (YOLOX, 329 ops) and pose (HRNet, 518 ops) running simultaneously on DSP
- Pipeline reaches `PLAYING` state
- Display shows both bounding boxes and human skeletons
