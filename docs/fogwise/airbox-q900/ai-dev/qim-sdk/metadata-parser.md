---
sidebar_position: 16
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 元数据解析

`gst-ai-metadata-parser-example` 对视频流执行目标检测，并将检测结果的元数据（坐标、类别、置信度）解析输出，可用于对接外部分析系统或存储检测日志。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型

```bash
ls -l /etc/models/yolox_quantized.tflite
```

### 2. 查看配置

```bash
cat /etc/configs/config-metadata-parser.json
```

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-metadata-parser-example --config-file=/etc/configs/config-metadata-parser.json
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

显示器上播放检测画面，终端持续输出结构化的检测元数据（JSON 格式）。

## 验证

- YOLOX 模型（329 节点）在 DSP 上运行
- Pipeline 进入 `PLAYING` 状态
- 终端输出有效的元数据结构
