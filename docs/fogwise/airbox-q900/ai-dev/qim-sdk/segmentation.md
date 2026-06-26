---
sidebar_position: 4
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 图像分割

`gst-ai-segmentation` 对视频流逐帧执行语义分割，为每个像素分配类别标签，以半透明彩色蒙版叠加渲染。

使用 DeepLabV3+ MobileNet 模型。

与 [目标检测](./object-detection.md) 的区别：检测用边界框框出物体，分割对每个像素分类并着色。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)

## 步骤

### 1. 确认模型和标签

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/deeplabv3_plus_mobilenet_quantized.tflite
ls -l /etc/labels/deeplabv3_resnet50.json
```

</NewCodeBlock>

### 2. 查看配置

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config_segmentation.json
```

</NewCodeBlock>

关键字段：

| 字段                | 默认值                                                  | 说明         |
| ------------------- | ------------------------------------------------------- | ------------ |
| `file-path`         | `/etc/media/video.mp4`                                  | 输入视频路径 |
| `ml-framework`      | `tflite`                                                | 推理框架     |
| `model`             | `/etc/models/deeplabv3_plus_mobilenet_quantized.tflite` | 模型文件     |
| `labels`            | `/etc/labels/deeplabv3_resnet50.json`                   | 颜色映射文件 |
| `runtime`           | `dsp`                                                   | 推理硬件     |
| `video-disposition` | `stretch`                                               | 视频布局方式 |

### 3. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-segmentation --config-file=/etc/configs/config_segmentation.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
Running app with model: /etc/models/deeplabv3_plus_mobilenet_quantized.tflite and labels: /etc/labels/deeplabv3_resnet50.json
Using DSP Delegate
VERBOSE: Replacing 136 out of 136 node(s) with delegate (TfLiteQnnDelegate) node, yielding 1 partitions for the whole graph.
Pipeline state changed from PAUSED to PLAYING
```

显示器上播放测试视频，画面叠加半透明彩色分割蒙版。不同颜色对应不同类别（人、车、道路、建筑等）。

## 验证

- `Using DSP Delegate`：推理在 NPU 上运行
- `Replacing 136 out of 136 node(s)`：全部 136 个算子委派到 DSP
- Pipeline 进入 `PLAYING` 状态
- 显示器正确显示分割蒙版

## 排障

### 分割蒙版不显示

确认标签文件内容有效：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 -c "import json; json.load(open('/etc/labels/deeplabv3_resnet50.json'))" && echo "JSON 有效"
```

</NewCodeBlock>

如果输出 `404: Not Found` 或其他非 JSON 内容，重新运行下载脚本。
