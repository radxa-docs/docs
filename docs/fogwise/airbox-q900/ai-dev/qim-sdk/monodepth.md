---
sidebar_position: 5
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 单目深度估计

`gst-ai-monodepth` 对视频流逐帧执行单目深度估计，生成深度图并以热力图叠加渲染。暖色调（红/橙）表示距离较近，冷色调（蓝）表示距离较远。

使用 MiDaS V2 模型。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型和标签

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/midas_quantized.tflite
ls -l /etc/labels/monodepth.json
```

</NewCodeBlock>

### 2. 查看配置

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config_monodepth.json
```

</NewCodeBlock>

关键字段：

| 字段           | 默认值                               | 说明         |
| -------------- | ------------------------------------ | ------------ |
| `file-path`    | `/etc/media/video.mp4`               | 输入视频路径 |
| `ml-framework` | `tflite`                             | 推理框架     |
| `model`        | `/etc/models/midas_quantized.tflite` | 模型文件     |
| `labels`       | `/etc/labels/monodepth.json`         | 颜色映射文件 |
| `runtime`      | `dsp`                                | 推理硬件     |

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-monodepth --config-file=/etc/configs/config_monodepth.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Running app with model: /etc/models/midas_quantized.tflite and labels: /etc/labels/monodepth.json
Using DSP Delegate
VERBOSE: Replacing 140 out of 140 node(s) with delegate (TfLiteQnnDelegate) node, yielding 1 partitions for the whole graph.
Pipeline state changed from PAUSED to PLAYING
```

显示器上播放测试视频，叠加深度热力图。暖色（红/橙）表示近处物体，冷色（蓝）表示远处背景。

## 验证

- `Using DSP Delegate`：推理在 NPU 上运行
- `Replacing 140 out of 140 node(s)`：全部 140 个算子委派到 DSP
- Pipeline 进入 `PLAYING` 状态
- 显示器正确显示深度热力图

## 工作原理

MiDaS (Monocular Depth Estimation) 以单张 RGB 图像为输入，输出每个像素的相对深度值。GStreamer pipeline：

```text
filesrc → qtdemux → h264parse → v4l2h264dec
                ↓                        ↓
           (分流)               qtimlvconverter (预处理)
                                        ↓
                              qtimltflite (DSP 推理)
                                        ↓
                              后处理 (深度→热力图)
                                        ↓
                                  qtivcomposer
                                        ↓
                                   waylandsink
```
