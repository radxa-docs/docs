---
sidebar_position: 1
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Image Classification

`gst-ai-classification` performs image classification on each frame of a video stream, identifying the main subject and overlaying classification labels with confidence scores.

Unlike [Object Detection](./object-detection.md), classification answers "what is this" (whole-image category), while detection answers "where is what" (bounding box per object).

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Model and Labels

The `download_artifacts.sh` script has already downloaded the required files:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/inception_v3_quantized.tflite
ls -l /etc/labels/classification.json
```

</NewCodeBlock>

### 2. View Configuration

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config_classification.json
```

</NewCodeBlock>

The default configuration uses InceptionV3 quantized model, LiteRT framework, and DSP inference. Key fields:

| Field          | Default                                     | Description                                    |
| -------------- | ------------------------------------------- | ---------------------------------------------- |
| `file-path`    | `/etc/media/video.mp4`                      | Input video path                               |
| `ml-framework` | `tflite`                                    | Inference framework: `tflite` / `snpe` / `qnn` |
| `model`        | `/etc/models/inception_v3_quantized.tflite` | Model file                                     |
| `labels`       | `/etc/labels/classification.json`           | Label file                                     |
| `threshold`    | `40`                                        | Confidence threshold (1-100)                   |
| `runtime`      | `dsp`                                       | Inference hardware: `cpu` / `gpu` / `dsp`      |
| `output-type`  | `waylandsink`                               | Output method                                  |

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-classification --config-file=/etc/configs/config_classification.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

Terminal output:

```text
Running app with model: /etc/models/inception_v3_quantized.tflite and labels: /etc/labels/classification.json
Using DSP Delegate
VERBOSE: Replacing 142 out of 142 node(s) with delegate (TfLiteQnnDelegate) node, yielding 1 partitions for the whole graph.
Pipeline state changed from PAUSED to PLAYING
```

The display shows the test video with classification labels (e.g., "goldfish") and confidence scores overlaid.

## Validation

- `Using DSP Delegate`: Inference running on NPU
- `Replacing 142 out of 142 node(s)`: All 142 operators delegated to DSP, no CPU fallback
- Pipeline reaches `PLAYING` state
- Display correctly shows classification labels

## Switching Input Source

Modify the input source fields in the config file:

```json
// Switch video file
"file-path": "/etc/media/video1.mp4"

// Or use RTSP stream
"rtsp-ip-port": "rtsp://192.168.1.100:8554/live.mkv"
```

## Switching Inference Hardware

Modify the `runtime` field:

```json
"runtime": "cpu"   // CPU inference
"runtime": "gpu"   // GPU inference
"runtime": "dsp"   // NPU inference (default, recommended)
```

## Pipeline Flow

```text
filesrc → qtdemux → h264parse → v4l2h264dec → qtimlvconverter
                                                       ↓
                                              (tensor preprocessing)
                                                       ↓
                                          qtimltflite (DSP inference)
                                                       ↓
                                          qtimlvclassification
                                          (threshold/label mapping)
                                                       ↓
                                                qtivcomposer
                                                       ↓
                                                 waylandsink
```
