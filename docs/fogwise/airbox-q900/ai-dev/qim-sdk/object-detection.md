---
sidebar_position: 2
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 目标检测

`gst-ai-object-detection` 对视频流逐帧执行目标检测，在检测到的物体周围绘制边界框，标注类别名称和置信度。

支持 YOLOX、YOLOv8、YOLO-NAS 模型。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型和标签

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/yolox_quantized.tflite
ls -l /etc/labels/yolox.json
```

</NewCodeBlock>

### 2. 查看配置

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config_detection.json
```

</NewCodeBlock>

关键字段：

| 字段              | 默认值                               | 说明                                                     |
| ----------------- | ------------------------------------ | -------------------------------------------------------- |
| `file-path`       | `/etc/media/video.mp4`               | 输入视频路径                                             |
| `ml-framework`    | `tflite`                             | 推理框架                                                 |
| `yolo-model-type` | `yolox`                              | YOLO 模型类型：`yolov5` / `yolov8` / `yolox` / `yolonas` |
| `model`           | `/etc/models/yolox_quantized.tflite` | 模型文件                                                 |
| `labels`          | `/etc/labels/yolox.json`             | 标签文件                                                 |
| `threshold`       | `40`                                 | 置信度阈值 (1-100)                                       |
| `runtime`         | `dsp`                                | 推理硬件                                                 |

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-object-detection --config-file=/etc/configs/config_detection.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Running app with model: /etc/models/yolox_quantized.tflite and labels: /etc/labels/yolox.json
Using DSP Delegate
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

显示器上播放测试视频，检测到的物体周围显示彩色边界框，标注类别名称和置信度。

## 验证

- `Using DSP Delegate`：推理在 NPU 上运行
- `Replacing 329 out of 329 node(s)`：全部 329 个算子委派到 DSP
- Pipeline 进入 `PLAYING` 状态
- 显示器正确显示边界框和标签

## 调整检测灵敏度

如果检测框太少（漏检），降低阈值：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# 将 /etc/configs/config_detection.json 中 threshold 改为 20
```

</NewCodeBlock>

如果误检太多，提高阈值（如 60）。

## 切换 YOLO 模型

修改配置文件中的模型类型和路径：

```json
{
  "yolo-model-type": "yolov8",
  "model": "/etc/models/yolov8_det_quantized.tflite",
  "labels": "/etc/labels/yolov8.json"
}
```

> YOLOv8 和 YOLO-NAS 模型需要通过 Qualcomm AI Hub 单独导出。

## Pipeline 流程

```text
filesrc → qtdemux → h264parse → v4l2h264dec → qtimlvconverter
                                                       ↓
                                          qtimltflite (DSP 推理)
                                                       ↓
                                          qtimlvdetection (YOLO 后处理)
                                                       ↓
                                                qtivcomposer
                                                       ↓
                                                 waylandsink
```
