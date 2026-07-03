---
sidebar_position: 19
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-29
---

# Model Export

The IM SDK download script (`download_artifacts.sh`) provides only 10 base TFLite models. The following demos require custom-exported models:

| Demo                                                            | Required Model                       | Export Method             |
| --------------------------------------------------------------- | ------------------------------------ | ------------------------- |
| [Multi-Input Multi-Output](./multi-input-output.md)             | YOLOv5 (`yolov5.tflite`)             | Export from YOLOv5 source |
| [Multistream Batch Inference](./multistream-batch-inference.md) | YOLOv8 batch=4 (`yolov8_det.tflite`) | Qualcomm AI Hub           |
| [Object Detection](./object-detection.md) (YOLOv8/YOLO-NAS)     | YOLOv8 / YOLO-NAS                    | Qualcomm AI Hub           |

## Method 1: Export from YOLOv5 Source (for Multi-Input Multi-Output)

<NewCodeBlock tip="host$" type="device">

```bash
git clone https://github.com/ultralytics/yolov5.git
cd yolov5
python -m pip install -r requirements.txt tensorflow-cpu
python export.py --weights yolov5m.pt --img 320 --include tflite --int8 --data data/coco128.yaml
```

</NewCodeBlock>

Push the exported model to the device:

<NewCodeBlock tip="host$" type="device">

```bash
scp yolov5m-int8.tflite radxa@<device-ip>:/etc/models/yolov5.tflite
```

</NewCodeBlock>

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
# Create yolov5 label file (copy yolonas labels)
sudo cp /etc/labels/yolonas.labels /etc/labels/yolov5.labels
```

</NewCodeBlock>

> This method uses `--img 320` to match the demo's input resolution. **Do not** use the default 640, or inference will fail due to input size mismatch.

## Method 2: Qualcomm AI Hub Export for YOLOv8 (Object Detection, Multistream Batch)

### 1. Register and Get API Token

[Qualcomm AI Hub](https://aihub.qualcomm.com/) → Settings → API Token.

### 2. Install qai-hub-models

<NewCodeBlock tip="host$" type="device">

```bash
python -m venv qaihm
source qaihm/bin/activate
pip install qai-hub-models
```

</NewCodeBlock>

### 3. Export Standard Model (batch=1)

<NewCodeBlock tip="host$" type="device">

```bash
python -m qai_hub_models.models.yolov8_det.export \
    --quantize w8a8 \
    --target-runtime=tflite \
    --device "Dragonwing IQ-9075 EVK"
```

</NewCodeBlock>

### 4. Export Batch Model (batch=4, for Multistream Batch Inference)

<NewCodeBlock tip="host$" type="device">

```bash
python -m qai_hub_models.models.yolov8_det.export \
    --quantize w8a8 \
    --target-runtime=tflite \
    --device "Dragonwing IQ-9075 EVK" \
    --batch-size 4
```

</NewCodeBlock>

> `--batch-size 4` must match the number of streams in the demo. Q900 (QCS9075) supports up to 4 streams.

### 5. Push to Device

<NewCodeBlock tip="host$" type="device">

```bash
scp yolov8_det.tflite radxa@<device-ip>:/etc/models/
```

</NewCodeBlock>
