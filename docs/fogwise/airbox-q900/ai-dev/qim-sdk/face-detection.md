---
sidebar_position: 8
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-25
---

# 人脸检测

`gst-ai-face-detection` 对视频流逐帧执行人脸检测，标记人脸位置和关键点（眼睛、鼻子、嘴等）。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 安装 ffmpeg 并转码视频

默认视频格式与 Q900 的 GStreamer 渲染管线存在兼容性问题，需转码为 baseline H.264：

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

### 2. 创建配置文件

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

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-face-detection --config-file=/tmp/cfg_face_detection.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Running app with model: /etc/models/face_det_lite_quantized.tflite and labels: /etc/labels/face_detection.json
VERBOSE: Replacing 90 out of 90 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

显示器上播放视频，检测到的人脸周围显示边界框和关键点。

## 验证

- 90 个算子全部委派到 DSP
- Pipeline 进入 `PLAYING` 状态
- 显示器正确显示人脸边界框和关键点
