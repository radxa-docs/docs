---
sidebar_position: 12
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-25
---

# Multistream Inference

`gst-ai-multistream-inference` processes multiple video streams simultaneously, with independent object detection per stream. Suitable for surveillance and multi-channel analytics.

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

Key parameters:

| Parameter              | Purpose                                                         |
| ---------------------- | --------------------------------------------------------------- |
| `-profile:v baseline`  | Disable B-frames, avoiding qtdemux dmabuf negotiation conflicts |
| `-bf 0`                | Turn off B-frames                                               |
| `-keyint_min 30 -g 30` | 1-second keyframe interval for reliable seeking                 |
| `-movflags +faststart` | Moves moov atom to front, speeding up decoder init              |
| `-an`                  | Remove audio to reduce file size                                |

### 2. Create Config File

All streams reference the same transcoded video:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 -c "
import json
with open('/etc/configs/config-multistream-inference.json') as f:
    c = json.load(f)
c['input-file-path'] = ['/etc/media/video_safe.mp4'] * 16
json.dump(c, open('/tmp/cfg_multistream.json', 'w'), indent=2)
print('config written')
"
```

</NewCodeBlock>

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-multistream-inference --config-file=/tmp/cfg_multistream.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

```text
HTP Core Count = 2
Run app with model: /etc/models/yolox_quantized.tflite and labels: /etc/labels/yolox.json and use case: Detection
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
...
Pipeline state changed from PAUSED to PLAYING
```

The display shows multiple detection streams simultaneously.

## Validation

- 329 ops per stream, all delegated to DSP
- Pipeline reaches `PLAYING` state
- Q900 supports a maximum of **16 concurrent streams** with this configuration
