---
sidebar_position: 4
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Image Segmentation

`gst-ai-segmentation` performs semantic segmentation on each frame of a video stream, assigning a class label to each pixel and rendering results as a semi-transparent colored mask.

Uses the DeepLabV3+ MobileNet model.

Unlike [Object Detection](./object-detection.md), detection draws bounding boxes around objects; segmentation classifies and colors every pixel.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Model and Labels

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/deeplabv3_plus_mobilenet_quantized.tflite
ls -l /etc/labels/deeplabv3_resnet50.json
```

</NewCodeBlock>

### 2. View Configuration

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config_segmentation.json
```

</NewCodeBlock>

Key fields:

| Field               | Default                                                 | Description         |
| ------------------- | ------------------------------------------------------- | ------------------- |
| `file-path`         | `/etc/media/video.mp4`                                  | Input video path    |
| `ml-framework`      | `tflite`                                                | Inference framework |
| `model`             | `/etc/models/deeplabv3_plus_mobilenet_quantized.tflite` | Model file          |
| `labels`            | `/etc/labels/deeplabv3_resnet50.json`                   | Color mapping file  |
| `runtime`           | `dsp`                                                   | Inference hardware  |
| `video-disposition` | `stretch`                                               | Video layout mode   |

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-segmentation --config-file=/etc/configs/config_segmentation.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

Terminal output:

```text
Running app with model: /etc/models/deeplabv3_plus_mobilenet_quantized.tflite and labels: /etc/labels/deeplabv3_resnet50.json
Using DSP Delegate
VERBOSE: Replacing 136 out of 136 node(s) with delegate (TfLiteQnnDelegate) node, yielding 1 partitions for the whole graph.
Pipeline state changed from PAUSED to PLAYING
```

The display shows the test video overlaid with a semi-transparent colored segmentation mask. Different colors represent different classes (person, car, road, building, etc.).

## Validation

- `Using DSP Delegate`: Inference running on NPU
- `Replacing 136 out of 136 node(s)`: All 136 operators delegated to DSP
- Pipeline reaches `PLAYING` state
- Display correctly shows segmentation mask

## Troubleshooting

### Segmentation mask not displaying

Verify the label file is valid JSON:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
python3 -c "import json; json.load(open('/etc/labels/deeplabv3_resnet50.json'))" && echo "JSON valid"
```

</NewCodeBlock>

If the output is `404: Not Found` or other non-JSON content, re-run the download script.
