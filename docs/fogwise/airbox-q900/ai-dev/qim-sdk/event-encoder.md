---
sidebar_position: 13
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 事件编码器

`gst-ai-event-encoder` 对视频流执行目标检测，并将检测到的事件（目标出现/移动等）编码输出。适合安防监控、视频分析等需要输出结构化事件信息的场景。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型

```bash
ls -l /etc/models/yolox_quantized.tflite
```

### 2. 查看配置

```bash
cat /etc/configs/config-event-encoder.json
```

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-event-encoder --config-file=/etc/configs/config-event-encoder.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Running app with model: /etc/models/yolox_quantized.tflite and labels: /etc/labels/yolox.json
Using DSP delegate
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

显示器上播放检测画面，同时终端输出检测到的事件元数据。

## 验证

- YOLOX 模型（329 节点）在 DSP 上运行
- Pipeline 进入 `PLAYING` 状态
- 终端持续输出事件编码数据
