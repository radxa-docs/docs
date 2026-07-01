---
sidebar_position: 17
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-30
---

# Python GStreamer Apps

The [Demos](./README.md#available-sample-applications) (`gst-ai-*`) are precompiled CLI tools controlled via JSON config files. If you need to insert custom processing logic into the pipeline (e.g., OpenCV preprocessing, custom postprocessing), use the Python GStreamer bindings to build pipelines directly.

QIM SDK Python examples are installed via the `gstreamer1.0-qcom-python-examples` package. Scripts are located in `/usr/bin/` and use the **same underlying GStreamer plugins** (`qtimltflite`, `qtimlvdetection`, `qtivcomposer`, etc.) as the `gst-ai-*` demos, but use argparse command-line arguments instead of config JSON.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation)

Python dependencies (`python3-gst-1.0`, `python3-numpy`, `python3-opencv`) are installed automatically.

## Representative Examples

18 runnable scripts are installed. Here are a few representative ones:

| Script                                    | Description                    | Example                                                                                                                                                       |
| ----------------------------------------- | ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gst-ai-object-detection.py`              | Object detection               | `python3 /usr/bin/gst-ai-object-detection.py -s /etc/media/video.mp4 -f 2 -ml yolov5 -m /etc/models/yolov5m-int8.tflite -l /etc/labels/yolov5.json --use_dsp` |
| `gst-parallel-inference.py`               | Multi-model parallel inference | Run detection + classification + segmentation simultaneously                                                                                                  |
| `gst-daisychain-detection-pose.py`        | Cascaded detection + pose      | `--file /etc/media/video.mp4 --tflite-yolo-model ... --tflite-pose-model ...`                                                                                 |
| `gst-concurrent-videoplay-composition.py` | Video wall                     | `--infile /etc/media/video.mp4 -c 4` (4 concurrent streams)                                                                                                   |

Use `--help` on any script to see its full parameter list.

## Basic Structure

Python GStreamer apps use PyGObject bindings. Minimal example:

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

Full source code for all Python examples is on GitHub:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/quic/sample-apps-for-qualcomm-linux
```

</NewCodeBlock>

## Reference

- [Demos](./README.md#available-sample-applications) — Precompiled CLI, controlled via config JSON
- [Build from Source](./build-from-source.md) — C/C++ approach for deep plugin customization
