---
sidebar_position: 14
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-29
---

# 多输入多输出推理

`gst-ai-multi-input-output-object-detection` 同时对多路输入源执行目标检测，每路独立推理，支持文件、RTSP 和摄像头输入组合，输出可到显示器、文件或 RTSP 流。

最大支持 6 路输入同时检测。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装) 和 [模型下载](./README.md#下载模型和测试资源)
- YOLOv5 TFLite 模型（默认下载不包含此模型，需通过 Qualcomm AI Hub 自行转换）

## 步骤

### 1. 准备输入视频

配置默认使用 6 路文件输入。将测试视频复制为多份：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
for i in $(seq 1 6); do
    sudo cp /etc/media/video.mp4 /etc/media/video${i}.mp4
done
```

</NewCodeBlock>

### 2. 准备 YOLOv5 模型

默认配置文件引用 `/etc/models/yolov5.tflite`，该模型未包含在下载脚本中，需从 YOLOv5 源码导出。

在主机上执行：

<NewCodeBlock tip="host$" type="device">

```bash
git clone https://github.com/ultralytics/yolov5.git
cd yolov5
python -m pip install -r requirements.txt tensorflow-cpu
python export.py --weights yolov5m.pt --img 320 --include tflite --int8 --data data/coco128.yaml
```

</NewCodeBlock>

> **`--img 320` 是必须的**：此 Demo 的输入分辨率要求为 320×320。使用默认 640 会因尺寸不匹配导致推理失败。

将模型推送到设备并创建标签文件：

<NewCodeBlock tip="host$" type="device">

```bash
scp yolov5m-int8.tflite radxa@<device-ip>:/etc/models/yolov5.tflite
```

</NewCodeBlock>

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo cp /etc/labels/yolonas.labels /etc/labels/yolov5.labels
```

</NewCodeBlock>

> **注意**：此 Demo **不支持** YOLOX 模型（`yolox_quantized.tflite`）。下载脚本提供的 YOLOX 模型在其他 Demo（如 `gst-ai-object-detection`）中可正常使用，但本 Demo 必须使用 YOLOv5。

### 3. 修改配置文件

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 -c "
import json
with open('/etc/configs/config-multi-input-output-object-detection.json') as f:
    c = json.load(f)
c['model'] = '/etc/models/yolov5.tflite'
c['labels'] = '/etc/labels/yolov5.labels'
json.dump(c, open('/tmp/cfg_multi_in_out.json', 'w'), indent=2)
print('config written')
"
```

</NewCodeBlock>

> 如果模型输出格式与 YOLOX 兼容，`labels` 可使用 `/etc/labels/yolox.json`。

### 4. 运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-multi-input-output-object-detection --config-file=/tmp/cfg_multi_in_out.json
```

</NewCodeBlock>

按 `Ctrl + C` 停止。

## 预期输出

终端输出：

```text
TARGET Can support file source, RTSP source and camera source
Run app with model: ... and labels: ...
IN Options: camera: 0 (id: 0), file: 6, rtsp: 0
OUT Options: display: 1, file: (null), rtsp: 0
VERBOSE: Replacing 334 out of 334 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from NULL to READY:
Pipeline state changed from READY to PAUSED:
Pipeline state changed from PAUSED to PLAYING:
```

显示器上同时显示 6 路检测画面，每路独立绘制边界框。

## 验证

- 334 个算子全部委派到 DSP
- Pipeline 进入 `PLAYING` 状态
- 显示器显示 6 路检测画面，每路独立绘制边界框

## 配置说明

| 字段               | 说明                                  | 默认值                           |
| ------------------ | ------------------------------------- | -------------------------------- |
| `input-file-path`  | 文件输入路径（JSON 数组，最多 6 路）  | `["/etc/media/video1.mp4", ...]` |
| `input-rtsp-path`  | RTSP 输入地址（JSON 数组，最多 6 路） | 空                               |
| `num-camera`       | 摄像头数量（0-2）                     | `0`                              |
| `camera-id`        | 摄像头设备 ID                         | `0`                              |
| `model`            | 目标检测模型路径                      | `/etc/models/yolov5.tflite`      |
| `labels`           | 标签文件路径                          | `/etc/labels/yolov5.json`        |
| `output-display`   | 是否输出到显示器                      | `true`                           |
| `output-file-path` | 输出文件路径（可选）                  | 空                               |
| `output-rtsp-path` | RTSP 输出地址（可选）                 | 空                               |

## Pipeline 流程

```text
filesrc × 6 → qtdemux → h264parse → v4l2h264dec → qtimlvconverter
                                                          ↓
                                             qtimltflite (DSP 推理)
                                                          ↓
                                             qtimlvdetection (YOLO 后处理)
                                                          ↓
                                                   qtivcomposer
                                                          ↓
                                                    waylandsink
```
