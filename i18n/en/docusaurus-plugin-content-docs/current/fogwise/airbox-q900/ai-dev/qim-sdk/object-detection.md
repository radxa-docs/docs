---
sidebar_position: 2
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Object Detection

`gst-ai-object-detection` performs object detection on each frame of a video stream, drawing bounding boxes around detected objects with class labels and confidence scores.

Supports YOLOX, YOLOv8, and YOLO-NAS models.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Model and Labels

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/yolox_quantized.tflite
ls -l /etc/labels/yolox.json
```

</NewCodeBlock>

### 2. View Configuration

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config_detection.json
```

</NewCodeBlock>

Key fields:

| Field             | Default                              | Description                                          |
| ----------------- | ------------------------------------ | ---------------------------------------------------- |
| `file-path`       | `/etc/media/video.mp4`               | Input video path                                     |
| `ml-framework`    | `tflite`                             | Inference framework                                  |
| `yolo-model-type` | `yolox`                              | YOLO type: `yolov5` / `yolov8` / `yolox` / `yolonas` |
| `model`           | `/etc/models/yolox_quantized.tflite` | Model file                                           |
| `labels`          | `/etc/labels/yolox.json`             | Label file                                           |
| `threshold`       | `40`                                 | Confidence threshold (1-100)                         |
| `runtime`         | `dsp`                                | Inference hardware                                   |

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-object-detection --config-file=/etc/configs/config_detection.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

Terminal output:

```text
Running app with model: /etc/models/yolox_quantized.tflite and labels: /etc/labels/yolox.json
Using DSP Delegate
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

The display shows the test video with colored bounding boxes around detected objects, annotated with class names and confidence scores.

## Validation

- `Using DSP Delegate`: Inference running on NPU
- `Replacing 329 out of 329 node(s)`: All 329 operators delegated to DSP
- Pipeline reaches `PLAYING` state
- Display correctly shows bounding boxes and labels

## Adjusting Detection Sensitivity

If too few objects are detected (missed detections), lower the threshold:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# Change threshold to 20 in /etc/configs/config_detection.json
```

</NewCodeBlock>

If there are too many false positives, increase the threshold (e.g., 60).

## Switching YOLO Models

Modify the model type and path in the config file:

```json
{
  "yolo-model-type": "yolov8",
  "model": "/etc/models/yolov8_det_quantized.tflite",
  "labels": "/etc/labels/yolov8.json"
}
```

> YOLOv8 and YOLO-NAS models require separate export via Qualcomm AI Hub.

## Pipeline Flow

```text
filesrc → qtdemux → h264parse → v4l2h264dec → qtimlvconverter
                                                       ↓
                                          qtimltflite (DSP inference)
                                                       ↓
                                          qtimlvdetection (YOLO post-process)
                                                       ↓
                                                qtivcomposer
                                                       ↓
                                                 waylandsink
```
