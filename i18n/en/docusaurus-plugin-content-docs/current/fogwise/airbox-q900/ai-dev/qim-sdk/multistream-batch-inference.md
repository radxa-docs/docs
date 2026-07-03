---
sidebar_position: 13
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-29
---

# Multistream Batch Inference

`gst-ai-multistream-batch-inference` performs batch AI inference (object detection or image segmentation) on multiple video streams simultaneously, batching streams for a single inference pass to improve throughput.

Q900 (QCS9075) supports up to 24 concurrent input streams (6 batches × batch-size 4).

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation)
- YOLOv8 TFLite model with batch-size=4 (export via Qualcomm AI Hub; see [Model Export](./model-export.md#method-2-qualcomm-ai-hub-export-for-yolov8-object-detection-multistream-batch))

## Steps

### 1. Export Batch Model

Export YOLOv8 with `--batch-size 4`. See [Model Export](./model-export.md#4-export-batch-model-batch4-for-multistream-batch-inference) for the full command.

Push the model and labels to the device:

<NewCodeBlock tip="host$" type="device">

```bash
scp yolov8_det.tflite radxa@<device-ip>:/etc/models/
```

</NewCodeBlock>

### 2. Create Configuration

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 -c "
import json
with open('/etc/configs/config-multistream-batch-inference.json') as f:
    base = json.load(f)
entry = base['pipeline-info'][0]
entry['model-path'] = '/etc/models/yolov8_det.tflite'
entry['labels-path'] = '/etc/labels/yolov8.json'
# Generate 6 batches × 4 streams = 24 streams (id max=5)
base['pipeline-info'] = []
for i in range(6):
    e = json.loads(json.dumps(entry))
    e['id'] = i
    base['pipeline-info'].append(e)
with open('/tmp/cfg_batch.json', 'w') as f:
    json.dump(base, f, indent=2)
print('24-stream config written')
"
```

</NewCodeBlock>

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-multistream-batch-inference --config-file=/tmp/cfg_batch.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

```text
VERBOSE: Replacing 282 out of 282 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from NULL to READY:
Pipeline state changed from READY to PAUSED:
Pipeline state changed from PAUSED to PLAYING:
```

The display shows 24 concurrent detection streams.

## Validation

- All ops delegated to DSP
- Pipeline reaches `PLAYING` state
- 24 streams display correct bounding boxes simultaneously

## Configuration Reference

| Field                                 | Description                                                   | Default           |
| ------------------------------------- | ------------------------------------------------------------- | ----------------- |
| `output-type`                         | Output type: `wayland` / `filesink`                           | `wayland`         |
| `pipeline-info[].id`                  | Batch ID (0–5)                                                | `0`               |
| `pipeline-info[].input-type`          | Input source type                                             | `file`            |
| `pipeline-info[].input-file-path`     | Input files (4 per batch)                                     | See config        |
| `pipeline-info[].mlframework`         | Inference framework                                           | `tflite`          |
| `pipeline-info[].model-path`          | Model path                                                    | Must be replaced  |
| `pipeline-info[].labels-path`         | Label path                                                    | Must be replaced  |
| `pipeline-info[].constants`           | LiteRT quantization constants                                 | Model-specific    |
| `pipeline-info[].post-process-plugin` | Post-process plugin: `qtimlvdetection` / `qtimlvsegmentation` | `qtimlvdetection` |

## Pipeline Flow

```text
filesrc × 4 → qtdemux → h264parse → v4l2h264dec → qtibatch (batch)
                                                          ↓
                                                 qtimlvconverter
                                                          ↓
                                               qtimltflite (DSP batch inference)
                                                          ↓
                                                  qtimldemux (debatch)
                                                          ↓
                                             qtimlvdetection / qtimlvsegmentation
                                                          ↓
                                                   qtivcomposer
                                                          ↓
                                                    waylandsink
```
