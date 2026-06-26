---
sidebar_position: 12
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-25
---

# 多流推理

`gst-ai-multistream-inference` 同时处理多路视频流，每路独立执行目标检测，适合安防监控、多路分析等场景。

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

关键参数说明：

| 参数                   | 作用                                    |
| ---------------------- | --------------------------------------- |
| `-profile:v baseline`  | 禁用 B 帧，避免 qtdemux dmabuf 协商冲突 |
| `-bf 0`                | 关闭 B 帧                               |
| `-keyint_min 30 -g 30` | 关键帧间隔 1 秒，便于 seek              |
| `-movflags +faststart` | moov 原子前置，加快解码器初始化         |
| `-an`                  | 去除音频，减小文件体积                  |

### 2. 创建配置文件

配置中所有流指向同一个转码后的视频：

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

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-multistream-inference --config-file=/tmp/cfg_multistream.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
HTP Core Count = 2
Run app with model: /etc/models/yolox_quantized.tflite and labels: /etc/labels/yolox.json and use case: Detection
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
...
Pipeline state changed from PAUSED to PLAYING
```

显示器上同时显示多路检测画面。

## 验证

- 每路视频 329 个算子全部委派到 DSP
- Pipeline 进入 `PLAYING` 状态
