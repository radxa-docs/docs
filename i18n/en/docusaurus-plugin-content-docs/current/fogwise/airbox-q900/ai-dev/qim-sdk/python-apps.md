---
sidebar_position: 15
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Python GStreamer Apps

QIM SDK provides Python GStreamer binding examples, demonstrating how to build AI/ML and multimedia pipelines using Python.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation)

Python examples are installed via the `gstreamer1.0-qcom-python-examples` package. Related Python dependencies (`python3-gst-1.0`, `python3-numpy`, `python3-opencv`) are installed automatically.

## Available Examples

| Application                               | Description                              |
| ----------------------------------------- | ---------------------------------------- |
| Camera Encode                             | Capture from camera and encode to H.264  |
| OpenCV Camera Stream                      | Read camera stream via OpenCV            |
| OpenCV Video Convert                      | OpenCV video format conversion           |
| Concurrent Video Playback (Video Wall)    | Multi-stream simultaneous playback       |
| Multi-Camera Stream                       | Python-controlled multi-camera           |
| Object Detection & Display                | Run object detection and display results |
| RTSP Stream Decode & Detection            | Decode from RTSP and detect              |
| JPEG Image Decode                         | Decode JPEG images                       |
| Object Detection & Classification         | Cascaded detection + classification      |
| Convert & Encode Camera Stream            | Camera stream transcoding                |
| Camera Encode + Detection + Display       | End-to-end pipeline                      |
| Detection + Classification + Segmentation | Multi-task AI                            |
| Parallel Inference                        | Multi-model parallel                     |
| Daisy-Chain Detection & Pose              | Cascaded detection + pose                |

## Basic Structure

Python GStreamer apps use PyGObject bindings:

```python
import gi
gi.require_version('Gst', '1.0')
from gi.repository import Gst, GLib

Gst.init(None)

# Create pipeline
pipeline = Gst.parse_launch(
    "filesrc location=/etc/media/video.mp4 ! "
    "qtdemux ! h264parse ! v4l2h264dec ! waylandsink"
)

# Start
pipeline.set_state(Gst.State.PLAYING)

# Main loop
loop = GLib.MainLoop()
loop.run()
```

## Get Source Code

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/quic/sample-apps-for-qualcomm-linux
```

</NewCodeBlock>

## Reference

- [Build from Source](./build-from-source.md) — Compile custom C/C++ apps on-device
