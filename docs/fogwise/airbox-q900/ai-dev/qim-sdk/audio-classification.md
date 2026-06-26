---
sidebar_position: 7
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 音频分类

`gst-ai-audio-classification` 对音频流执行音频事件分类，识别声音类型（如人声、音乐、环境噪声等）。

使用 YAMNet 模型，默认配置为 CPU 推理。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型和标签

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/yamnet.tflite
ls -l /etc/labels/yamnet.json
```

</NewCodeBlock>

### 2. 查看配置

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config-audio-classification.json
```

</NewCodeBlock>

关键字段：

| 字段        | 默认值                      | 说明                          |
| ----------- | --------------------------- | ----------------------------- |
| `file-path` | `/etc/media/video-mp3.mp4`  | 输入音频/视频文件（MP3 编码） |
| `model`     | `/etc/models/yamnet.tflite` | 模型文件                      |
| `labels`    | `/etc/labels/yamnet.json`   | 标签文件                      |
| `threshold` | `10`                        | 置信度阈值                    |
| `codec`     | `mp3`                       | 音频编码格式                  |
| `runtime`   | `cpu`                       | 推理硬件                      |

> 默认使用 CPU 推理。如需 DSP 推理，将 `runtime` 改为 `dsp` 并添加 `ml-framework: "tflite"`。

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-audio-classification --config-file=/etc/configs/config-audio-classification.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Running app with model: /etc/models/yamnet.tflite and labels: /etc/labels/yamnet.json
Pipeline state changed from PAUSED to PLAYING
```

显示器上播放测试视频，音频分类结果叠加显示。

## 验证

- Pipeline 进入 `PLAYING` 状态
- 终端持续输出音频分类结果
- 显示器显示分类标签

## 工作原理

YAMNet 是基于 AudioSet 数据集训练的音频事件分类模型，支持 521 种音频类别。Pipeline 流程：

```text
filesrc → qtdemux → (音频解码) → qtimlaudioconverter
                                          ↓
                                qtimltflite (推理)
                                          ↓
                               qtimlaclassification
                                          ↓
                               (分类标签叠加显示)
```
