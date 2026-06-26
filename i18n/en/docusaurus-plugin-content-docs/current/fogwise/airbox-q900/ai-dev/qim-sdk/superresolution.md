---
sidebar_position: 6
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Video Super Resolution

`gst-ai-superresolution` uses an AI model to perform super-resolution reconstruction on low-resolution video, generating high-resolution output frames.

Uses the QuickSRNet Small model (~42 KB), suitable for real-time inference.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Model

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/quicksrnetsmall_quantized.tflite
```

</NewCodeBlock>

> Super resolution does not require a label file.

### 2. View Configuration

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config-superresolution.json
```

</NewCodeBlock>

Key fields:

| Field             | Default                | Description      |
| ----------------- | ---------------------- | ---------------- |
| `input-file-path` | `/etc/media/video.mp4` | Input video path |

> Note: The super resolution config uses `input-file-path` (not `file-path`).

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-superresolution --config-file=/etc/configs/config-superresolution.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

Terminal output:

```text
Running app with model: /etc/models/quicksrnetsmall_quantized.tflite
VERBOSE: Replacing 10 out of 13 node(s) with delegate (TfLiteQnnDelegate) node, yielding 3 partitions for the whole graph.
Pipeline state changed from PAUSED to PLAYING
```

The display shows the super-resolved video output with clearer details compared to the original input.

## Validation

- `Replacing 10 out of 13 node(s)`: 10 operators delegated to DSP, 3 fall back to CPU
- Pipeline reaches `PLAYING` state
- Display shows super-resolved video

> Some operators (Reshape, Transpose) are not supported on DSP and automatically fall back to CPU. This does not affect overall functionality.

## How It Works

QuickSRNet is an ultra-lightweight super-resolution network designed for mobile and embedded devices. Pipeline flow:

```text
filesrc → qtdemux → h264parse → v4l2h264dec
                                       ↓
                               qtimlvconverter
                                       ↓
                          qtimltflite (DSP + CPU)
                                       ↓
                                qtivcomposer
                                       ↓
                                 waylandsink
```
