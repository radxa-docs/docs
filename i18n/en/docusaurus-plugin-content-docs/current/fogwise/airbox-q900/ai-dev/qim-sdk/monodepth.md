---
sidebar_position: 5
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Monocular Depth Estimation

`gst-ai-monodepth` performs monocular depth estimation on each frame of a video stream, generating a depth map rendered as a heatmap overlay. Warm colors (red/orange) indicate closer distances; cool colors (blue) indicate farther distances.

Uses the MiDaS V2 model.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Model and Labels

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/midas_quantized.tflite
ls -l /etc/labels/monodepth.json
```

</NewCodeBlock>

### 2. View Configuration

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config_monodepth.json
```

</NewCodeBlock>

Key fields:

| Field          | Default                              | Description         |
| -------------- | ------------------------------------ | ------------------- |
| `file-path`    | `/etc/media/video.mp4`               | Input video path    |
| `ml-framework` | `tflite`                             | Inference framework |
| `model`        | `/etc/models/midas_quantized.tflite` | Model file          |
| `labels`       | `/etc/labels/monodepth.json`         | Color mapping file  |
| `runtime`      | `dsp`                                | Inference hardware  |

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-monodepth --config-file=/etc/configs/config_monodepth.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

Terminal output:

```text
Running app with model: /etc/models/midas_quantized.tflite and labels: /etc/labels/monodepth.json
Using DSP Delegate
VERBOSE: Replacing 140 out of 140 node(s) with delegate (TfLiteQnnDelegate) node, yielding 1 partitions for the whole graph.
Pipeline state changed from PAUSED to PLAYING
```

The display shows the test video overlaid with a depth heatmap. Warm colors indicate nearby objects; cool colors indicate distant background.

## Validation

- `Using DSP Delegate`: Inference running on NPU
- `Replacing 140 out of 140 node(s)`: All 140 operators delegated to DSP
- Pipeline reaches `PLAYING` state
- Display correctly shows depth heatmap

## How It Works

MiDaS (Monocular Depth Estimation) takes a single RGB image as input and outputs relative depth values for each pixel. The GStreamer pipeline:

```text
filesrc → qtdemux → h264parse → v4l2h264dec
                ↓                        ↓
           (tee split)         qtimlvconverter (preprocess)
                                        ↓
                              qtimltflite (DSP inference)
                                        ↓
                              post-process (depth → heatmap)
                                        ↓
                                  qtivcomposer
                                        ↓
                                   waylandsink
```
