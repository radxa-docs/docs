---
sidebar_position: 9
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Daisy-Chain Detection & Classification

`gst-ai-daisychain-detection-classification` performs cascaded inference: first [Object Detection](./object-detection.md) locates objects, then [Image Classification](./classification.md) identifies each detected object for finer-grained recognition.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Models

```bash
ls -l /etc/models/yolox_quantized.tflite /etc/models/inception_v3_quantized.tflite
```

### 2. View Configuration

```bash
cat /etc/configs/config_daisychain_detection_classification.json
```

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-daisychain-detection-classification --config-file=/etc/configs/config_daisychain_detection_classification.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

```text
Using DSP delegate with TFLITE for Classification
Using DSP delegate with TFLITE for Detection
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
VERBOSE: Replacing 142 out of 142 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

The display shows the test video with bounding boxes from detection and fine-grained classification labels for each detected object.

## Validation

- Detection (YOLOX, 329 ops) and classification (InceptionV3, 142 ops) running simultaneously on DSP
- Pipeline reaches `PLAYING` state
- Display shows both bounding boxes and classification labels
