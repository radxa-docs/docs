---
sidebar_position: 8
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-25
---

# Face Detection

`gst-ai-face-detection` performs face detection on each frame of a video stream, marking face locations and facial landmarks (eyes, nose, mouth, etc.).

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Install ffmpeg and Transcode Video

The default video format has compatibility issues with Q900's GStreamer rendering pipeline. Transcode to baseline H.264:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y ffmpeg
sudo ffmpeg -y -i /etc/media/video.mp4 \
    -c:v libx264 \
    -profile:v baseline \
    -level 3.1 \
    -pix_fmt yuv420p \
    -vf scale=640:480 \
    -r 30 \
    -g 30 \
    -keyint_min 30 \
    -bf 0 \
    -an \
    -movflags +faststart \
    /etc/media/video_safe.mp4
```

</NewCodeBlock>

### 2. Create Config File

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 -c "
import json
with open('/etc/configs/config_face_detection.json') as f:
    c = json.load(f)
c['file-path'] = '/etc/media/video_safe.mp4'
json.dump(c, open('/tmp/cfg_face_detection.json', 'w'), indent=2)
"
```

</NewCodeBlock>

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-face-detection --config-file=/tmp/cfg_face_detection.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

```text
Running app with model: /etc/models/face_det_lite_quantized.tflite and labels: /etc/labels/face_detection.json
VERBOSE: Replacing 90 out of 90 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

The display shows the video with face bounding boxes and facial landmarks.

## Validation

- 90 ops all delegated to DSP
- Pipeline reaches `PLAYING` state
- Display correctly shows face bounding boxes and landmarks
