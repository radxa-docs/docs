---
sidebar_position: 6
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 视频超分辨率

`gst-ai-superresolution` 使用 AI 模型对低分辨率视频进行超分辨率重建，生成高分辨率输出帧。

使用 QuickSRNet Small 模型（约 42 KB），适合实时推理。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/quicksrnetsmall_quantized.tflite
```

</NewCodeBlock>

> 超分辨率应用不需要标签文件。

### 2. 查看配置

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config-superresolution.json
```

</NewCodeBlock>

关键字段：

| 字段              | 默认值                 | 说明         |
| ----------------- | ---------------------- | ------------ |
| `input-file-path` | `/etc/media/video.mp4` | 输入视频路径 |

> 注意：超分辨率配置使用 `input-file-path`（而非 `file-path`）。

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-superresolution --config-file=/etc/configs/config-superresolution.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Running app with model: /etc/models/quicksrnetsmall_quantized.tflite
VERBOSE: Replacing 10 out of 13 node(s) with delegate (TfLiteQnnDelegate) node, yielding 3 partitions for the whole graph.
Pipeline state changed from PAUSED to PLAYING
```

显示器显示超分辨率处理后的视频画面，细节比原始输入更清晰。

## 验证

- `Replacing 10 out of 13 node(s)`：10 个算子委派到 DSP，3 个回退 CPU
- Pipeline 进入 `PLAYING` 状态
- 显示器显示超分后画面

> 部分算子（Reshape、Transpose）不支持 DSP，自动回退到 CPU 执行。不影响整体功能。

## 工作原理

QuickSRNet 是专为移动和嵌入式设备设计的超轻量级超分辨率网络。Pipeline 流程：

```text
filesrc → qtdemux → h264parse → v4l2h264dec
                                       ↓
                               qtimlvconverter
                                       ↓
                          qtimltflite (DSP + CPU)
                                       ↓
                                qtivcomposer
                                       ↓
                                 waylandsink
```
