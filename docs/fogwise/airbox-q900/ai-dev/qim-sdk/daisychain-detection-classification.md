---
sidebar_position: 9
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 菊花链检测与分类

`gst-ai-daisychain-detection-classification` 对视频流执行级联推理：先用 [目标检测](./object-detection.md) 定位物体，再对检测到的每个物体执行 [图像分类](./classification.md)，进一步细化识别结果。

这种级联方式适合需要先定位再细分的场景，例如先检测到"动物"，再分类为"金鱼"。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型文件

应用复用检测和分类模型，均由 `download_artifacts.sh` 自动下载：

```bash
ls -l /etc/models/yolox_quantized.tflite /etc/models/inception_v3_quantized.tflite
```

### 2. 查看配置

```bash
cat /etc/configs/config_daisychain_detection_classification.json
```

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-daisychain-detection-classification --config-file=/etc/configs/config_daisychain_detection_classification.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Using DSP delegate with TFLITE for Classification
Using DSP delegate with TFLITE for Detection
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
VERBOSE: Replacing 142 out of 142 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

显示器上播放测试视频，先检测物体位置（边界框），再对每个物体显示细粒度分类标签。

## 验证

- 检测模型（YOLOX, 329 节点）和分类模型（InceptionV3, 142 节点）同时在 DSP 上运行
- Pipeline 进入 `PLAYING` 状态
- 显示器同时显示边界框和分类标签

## 工作原理

Pipeline 分两级：

```text
filesrc → qtdemux → h264parse → v4l2h264dec
                ↓                        ↓
           (分流)               qtimlvconverter
                                        ↓
                           qtimltflite (YOLOX 检测, DSP)
                                        ↓
                                  qtimlvdetection
                                        ↓
                           qtimlvconverter (ROI 裁剪)
                                        ↓
                           qtimltflite (InceptionV3 分类, DSP)
                                        ↓
                               qtimlvclassification
                                        ↓
                                  qtivcomposer
                                        ↓
                                   waylandsink
```

与单独的 [目标检测](./object-detection.md) 或 [图像分类](./classification.md) 相比，菊花链方式可以在检测基础上提供更细粒度的分类结果。
