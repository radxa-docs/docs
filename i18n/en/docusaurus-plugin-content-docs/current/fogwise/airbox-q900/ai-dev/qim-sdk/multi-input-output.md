---
sidebar_position: 14
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-29
---

# Multi-Input Multi-Output Inference

`gst-ai-multi-input-output-object-detection` runs object detection on multiple input sources simultaneously, with independent inference per stream. It supports combinations of file, RTSP, and camera inputs, with output to display, file, or RTSP stream.

Maximum 6 concurrent input streams.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)
- YOLOv5 TFLite model (not included in the default download; convert via Qualcomm AI Hub)

## Steps

### 1. Prepare Input Videos

The default configuration uses 6 file inputs. Copy the test video:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
for i in $(seq 1 6); do
    sudo cp /etc/media/video.mp4 /etc/media/video${i}.mp4
done
```

</NewCodeBlock>

### 2. Prepare YOLOv5 Model

The default configuration references `/etc/models/yolov5.tflite`, which is not included in the download script. Export from YOLOv5 source.

On the host machine:

<NewCodeBlock tip="host$" type="device">

```bash
git clone https://github.com/ultralytics/yolov5.git
cd yolov5
python -m pip install -r requirements.txt tensorflow-cpu
python export.py --weights yolov5m.pt --img 320 --include tflite --int8 --data data/coco128.yaml
```

</NewCodeBlock>

> **`--img 320` is required**: this demo's input resolution is 320×320. Using the default 640 will cause inference failure due to size mismatch.

Push the model to the device and create the label file:

<NewCodeBlock tip="host$" type="device">

```bash
scp yolov5m-int8.tflite radxa@<device-ip>:/etc/models/yolov5.tflite
```

</NewCodeBlock>

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo cp /etc/labels/yolonas.labels /etc/labels/yolov5.labels
```

</NewCodeBlock>

> **Note**: This demo does NOT support the YOLOX model (`yolox_quantized.tflite`). The YOLOX model included in the download script works with other demos (e.g., `gst-ai-object-detection`), but this specific demo requires YOLOv5.

### 3. Modify Configuration

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 -c "
import json
with open('/etc/configs/config-multi-input-output-object-detection.json') as f:
    c = json.load(f)
c['model'] = '/etc/models/yolov5.tflite'
c['labels'] = '/etc/labels/yolov5.labels'
json.dump(c, open('/tmp/cfg_multi_in_out.json', 'w'), indent=2)
print('config written')
"
```

</NewCodeBlock>

### 4. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-multi-input-output-object-detection --config-file=/tmp/cfg_multi_in_out.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

```text
TARGET Can support file source, RTSP source and camera source
Run app with model: ... and labels: ...
IN Options: camera: 0 (id: 0), file: 6, rtsp: 0
OUT Options: display: 1, file: (null), rtsp: 0
VERBOSE: Replacing 334 out of 334 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from NULL to READY:
Pipeline state changed from READY to PAUSED:
Pipeline state changed from PAUSED to PLAYING:
```

The display shows 6 concurrent detection streams, each with independent bounding boxes.

## Validation

- 334 ops all delegated to DSP
- Pipeline reaches `PLAYING` state
- Display shows 6 concurrent detection streams with independent bounding boxes

## Configuration Reference

| Field              | Description                          | Default                          |
| ------------------ | ------------------------------------ | -------------------------------- |
| `input-file-path`  | File input paths (JSON array, max 6) | `["/etc/media/video1.mp4", ...]` |
| `input-rtsp-path`  | RTSP input URLs (JSON array, max 6)  | empty                            |
| `num-camera`       | Number of camera streams (0–2)       | `0`                              |
| `camera-id`        | Camera device ID                     | `0`                              |
| `model`            | Object detection model path          | `/etc/models/yolov5.tflite`      |
| `labels`           | Label file path                      | `/etc/labels/yolov5.json`        |
| `output-display`   | Enable display output                | `true`                           |
| `output-file-path` | Output file path (optional)          | empty                            |
| `output-rtsp-path` | RTSP output URL (optional)           | empty                            |

## Pipeline Flow

```text
filesrc × 6 → qtdemux → h264parse → v4l2h264dec → qtimlvconverter
                                                          ↓
                                             qtimltflite (DSP inference)
                                                          ↓
                                             qtimlvdetection (YOLO postprocess)
                                                          ↓
                                                   qtivcomposer
                                                          ↓
                                                    waylandsink
```
