---
sidebar_position: 11
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 并行 AI 融合

`gst-ai-parallel-inference` 在同一个视频流上**同时运行多个 AI 模型**，所有模型并行在 NPU 上推理，结果融合显示。

默认配置同时运行 4 个模型：目标检测（YOLOX）、图像分类（InceptionV3）、姿态检测（HRNet）、图像分割（DeepLabV3+），全部在 DSP 上并行执行。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型文件

所有模型均由 `download_artifacts.sh` 自动下载：

```bash
ls -l /etc/models/{yolox_quantized,inception_v3_quantized,hrnet_pose_quantized,deeplabv3_plus_mobilenet_quantized}.tflite
```

### 2. 查看配置

```bash
cat /etc/configs/config-parallel-inference.json
```

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-parallel-inference --config-file=/etc/configs/config-parallel-inference.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
VERBOSE: Replacing 142 out of 142 node(s) with delegate (TfLiteQnnDelegate) node
VERBOSE: Replacing 518 out of 518 node(s) with delegate (TfLiteQnnDelegate) node
VERBOSE: Replacing 136 out of 136 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

显示器上同时显示边界框、分类标签、人体骨架和分割蒙版，四种 AI 结果叠加在同一个画面上。

## 验证

- 4 个模型（329 + 142 + 518 + 136 = 1125 个算子）全部在 DSP 上并行运行
- Pipeline 进入 `PLAYING` 状态
- 显示器同时显示四种推理结果

## 工作原理

Pipeline 使用 GStreamer 的 `tee` 元素将视频流分发给多个推理分支：

```text
                          ┌─→ qtimlvconverter → qtimltflite (检测, DSP) → qtimlvdetection ─┐
                          │                                                                  │
filesrc → qtdemux →       ├─→ qtimlvconverter → qtimltflite (分类, DSP) → qtimlvclassification ─┤
h264parse → v4l2h264dec → tee                                                              qtivcomposer → waylandsink
                          ├─→ qtimlvconverter → qtimltflite (姿态, DSP) → qtimlvpose ────────┤
                          │                                                                  │
                          └─→ qtimlvconverter → qtimltflite (分割, DSP) → qtimlvsegmentation ┘
```

四个推理分支共享输入视频流，各自独立在 DSP 上运行，最终由 `qtivcomposer` 将结果融合渲染到同一帧。这验证了 Q900 的 HTP V73 NPU 支持多模型并行处理。
