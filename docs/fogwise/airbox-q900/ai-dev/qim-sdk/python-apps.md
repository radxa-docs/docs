---
sidebar_position: 15
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Python GStreamer 应用

QIM SDK 提供 Python GStreamer 绑定示例，展示如何使用 Python 构建 AI/ML 和多媒体 pipeline。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装)

Python 示例已通过 `gstreamer1.0-qcom-python-examples` 包安装。相关 Python 依赖（`python3-gst-1.0`、`python3-numpy`、`python3-opencv`）自动安装。

## 可用示例

| 应用                     | 说明                         |
| ------------------------ | ---------------------------- |
| 摄像头编码               | 从摄像头采集并编码为 H.264   |
| OpenCV 摄像头流          | 使用 OpenCV 读取摄像头流     |
| OpenCV 视频转换          | OpenCV 视频格式转换          |
| 并发视频播放（视频墙）   | 多路视频同时播放             |
| 多摄像头流               | Python 控制多路摄像头        |
| 目标检测与显示           | 运行目标检测并在显示器上渲染 |
| RTSP 流解码和目标检测    | 从 RTSP 流解码并检测         |
| JPEG 图像解码            | 解码 JPEG 图像               |
| 目标检测和分类           | 级联检测+分类                |
| 转换和编码摄像头流       | 摄像头流转码                 |
| 摄像头编码+目标检测+显示 | 端到端 pipeline              |
| 目标检测+分类+分割       | 多任务 AI                    |
| 并行推理                 | 多模型并行                   |
| 菊花链检测和姿态检测     | 级联检测+姿态                |

## 基本结构

Python GStreamer 应用使用 PyGObject 绑定：

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

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/quic/sample-apps-for-qualcomm-linux
```

</NewCodeBlock>

## 参考

- [源码编译](./build-from-source.md) — 在设备上编译自定义 C/C++ 应用
