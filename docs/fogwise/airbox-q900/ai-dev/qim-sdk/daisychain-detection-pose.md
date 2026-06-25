---
sidebar_position: 10
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 菊花链检测与姿态估计

`gst-ai-daisychain-detection-pose` 对视频流执行级联推理：先用 [目标检测](./object-detection.md) 定位人体，再对检测到的每个人体执行 [姿态检测](./pose-detection.md)，绘制骨架连线。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型文件

应用复用检测和姿态模型，均由 `download_artifacts.sh` 自动下载：

```bash
ls -l /etc/models/yolox_quantized.tflite /etc/models/hrnet_pose_quantized.tflite
```

### 2. 查看配置

```bash
cat /etc/configs/config-daisychain-detection-pose.json
```

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-daisychain-detection-pose --config-file=/etc/configs/config-daisychain-detection-pose.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Using DSP delegate with TFLITE for Pose
Using DSP delegate with TFLITE for Detection
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
VERBOSE: Replacing 518 out of 518 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

显示器上播放测试视频，检测到的人体周围显示边界框并绘制骨架连线。

## 验证

- 检测模型（YOLOX, 329 节点）和姿态模型（HRNet, 518 节点）同时在 DSP 上运行
- Pipeline 进入 `PLAYING` 状态
- 显示器同时显示边界框和人体骨架

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
                           qtimltflite (HRNet 姿态, DSP)
                                        ↓
                                   qtimlvpose
                                        ↓
                                  qtivcomposer
                                        ↓
                                   waylandsink
```

与 [菊花链检测与分类](./daisychain-detection-classification.md) 的区别在于第二级使用姿态估计而非分类。
