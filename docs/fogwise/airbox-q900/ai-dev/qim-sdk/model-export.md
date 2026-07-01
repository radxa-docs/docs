---
sidebar_position: 19
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-29
---

# 模型导出

IM SDK 的下载脚本 (`download_artifacts.sh`) 仅提供 10 个基础 TFLite 模型。以下 Demo 需要自行导出额外模型：

| Demo                                                 | 所需模型                             | 导出方式           |
| ---------------------------------------------------- | ------------------------------------ | ------------------ |
| [多输入多输出](./multi-input-output.md)              | YOLOv5 (`yolov5.tflite`)             | 从 YOLOv5 源码导出 |
| [多流批量推理](./multistream-batch-inference.md)     | YOLOv8 batch=4 (`yolov8_det.tflite`) | Qualcomm AI Hub    |
| [目标检测](./object-detection.md)（YOLOv8/YOLO-NAS） | YOLOv8 / YOLO-NAS                    | Qualcomm AI Hub    |

## 方式一：从 YOLOv5 源码导出（多输入多输出 Demo）

<NewCodeBlock tip="host$" type="device">

```bash
git clone https://github.com/ultralytics/yolov5.git
cd yolov5
python -m pip install -r requirements.txt tensorflow-cpu
python export.py --weights yolov5m.pt --img 320 --include tflite --int8 --data data/coco128.yaml
```

</NewCodeBlock>

将导出的模型推送到设备：

<NewCodeBlock tip="host$" type="device">

```bash
scp yolov5m-int8.tflite radxa@<device-ip>:/etc/models/yolov5.tflite
```

</NewCodeBlock>

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# 创建 yolov5 标签文件（复制 yolonas 标签）
sudo cp /etc/labels/yolonas.labels /etc/labels/yolov5.labels
```

</NewCodeBlock>

> 此导出方式使用 `--img 320` 以匹配 Demo 输入分辨率。**不要**使用默认 640，否则会因输入尺寸不匹配导致推理失败。

## 方式二：Qualcomm AI Hub 导出 YOLOv8（目标检测、多流批量推理）

### 1. 注册并获取 API Token

[Qualcomm AI Hub](https://aihub.qualcomm.com/) → Settings → API 令牌。

### 2. 安装 qai-hub-models

<NewCodeBlock tip="host$" type="device">

```bash
python -m venv qaihm
source qaihm/bin/activate
pip install qai-hub-models
```

</NewCodeBlock>

### 3. 导出标准模型（batch=1）

<NewCodeBlock tip="host$" type="device">

```bash
python -m qai_hub_models.models.yolov8_det.export \
    --quantize w8a8 \
    --target-runtime=tflite \
    --device "Dragonwing IQ-9075 EVK"
```

</NewCodeBlock>

### 4. 导出批量模型（batch=4，用于多流批量推理）

<NewCodeBlock tip="host$" type="device">

```bash
python -m qai_hub_models.models.yolov8_det.export \
    --quantize w8a8 \
    --target-runtime=tflite \
    --device "Dragonwing IQ-9075 EVK" \
    --batch-size 4
```

</NewCodeBlock>

> `--batch-size 4` 必须匹配 Demo 的流数量。Q900 (QCS9075) 最多支持 4 路。

### 5. 推送到设备

<NewCodeBlock tip="host$" type="device">

```bash
scp yolov8_det.tflite radxa@<device-ip>:/etc/models/
```

</NewCodeBlock>
