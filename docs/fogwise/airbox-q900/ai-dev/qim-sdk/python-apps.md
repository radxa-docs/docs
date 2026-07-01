---
sidebar_position: 17
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-30
---

# Python GStreamer 应用

前面的 [Demo](./README.md#可用示例应用)（`gst-ai-*`）是预编译的命令行工具，通过 JSON 配置文件控制 pipeline。如果你需要在 pipeline 中插入自定义处理逻辑（如 OpenCV 预处理、自定义后处理），可以使用 Python GStreamer 绑定直接构建 pipeline。

QIM SDK 的 Python 示例通过 `gstreamer1.0-qcom-python-examples` 包安装，脚本位于 `/usr/bin/`，与 `gst-ai-*` Demo 使用**同一套底层 GStreamer 插件**（`qtimltflite`、`qtimlvdetection`、`qtivcomposer` 等），区别是用 argparse 命令行参数而非 config JSON。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装)

Python 依赖（`python3-gst-1.0`、`python3-numpy`、`python3-opencv`）随包自动安装。

## 代表性示例

已安装 18 个可运行脚本，以下为几个代表性示例：

| 脚本                                      | 说明           | 运行示例                                                                                                                                                      |
| ----------------------------------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gst-ai-object-detection.py`              | 目标检测       | `python3 /usr/bin/gst-ai-object-detection.py -s /etc/media/video.mp4 -f 2 -ml yolov5 -m /etc/models/yolov5m-int8.tflite -l /etc/labels/yolov5.json --use_dsp` |
| `gst-parallel-inference.py`               | 多模型并行推理 | 同时运行检测+分类+分割                                                                                                                                        |
| `gst-daisychain-detection-pose.py`        | 级联检测+姿态  | `--file /etc/media/video.mp4 --tflite-yolo-model ... --tflite-pose-model ...`                                                                                 |
| `gst-concurrent-videoplay-composition.py` | 视频墙         | `--infile /etc/media/video.mp4 -c 4`（4 路并发播放）                                                                                                          |

每个脚本使用 `--help` 查看完整参数。

## 基本结构

Python GStreamer 应用使用 PyGObject 绑定，最小示例：

```python
import gi
gi.require_version('Gst', '1.0')
from gi.repository import Gst, GLib

Gst.init(None)

# 创建 pipeline
pipeline = Gst.parse_launch(
    "filesrc location=/etc/media/video.mp4 ! "
    "qtdemux ! h264parse ! v4l2h264dec ! waylandsink"
)

# 启动
pipeline.set_state(Gst.State.PLAYING)

# 主循环
loop = GLib.MainLoop()
loop.run()
```

## 获取源代码

所有 Python 示例的完整源码托管在 GitHub：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/quic/sample-apps-for-qualcomm-linux
```

</NewCodeBlock>

## 参考

- [Demo 应用](./README.md#可用示例应用) — 预编译 CLI 方式，通过 config JSON 控制
- [源码编译](./build-from-source.md) — C/C++ 方式，深度定制插件
