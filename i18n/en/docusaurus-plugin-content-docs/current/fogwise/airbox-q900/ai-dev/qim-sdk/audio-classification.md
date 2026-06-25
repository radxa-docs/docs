---
sidebar_position: 7
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Audio Classification

`gst-ai-audio-classification` performs audio event classification on an audio stream, identifying sound types (e.g., speech, music, ambient noise).

Uses the YAMNet model, with the default configuration using CPU inference.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Model and Labels

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/yamnet.tflite
ls -l /etc/labels/yamnet.json
```

</NewCodeBlock>

### 2. View Configuration

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config-audio-classification.json
```

</NewCodeBlock>

Key fields:

| Field       | Default                     | Description                          |
| ----------- | --------------------------- | ------------------------------------ |
| `file-path` | `/etc/media/video-mp3.mp4`  | Input audio/video file (MP3 encoded) |
| `model`     | `/etc/models/yamnet.tflite` | Model file                           |
| `labels`    | `/etc/labels/yamnet.json`   | Label file                           |
| `threshold` | `10`                        | Confidence threshold                 |
| `codec`     | `mp3`                       | Audio encoding format                |
| `runtime`   | `cpu`                       | Inference hardware                   |

> Default uses CPU inference. For DSP inference, change `runtime` to `dsp` and add `ml-framework: "tflite"`.

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-audio-classification --config-file=/etc/configs/config-audio-classification.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

Terminal output:

```text
Running app with model: /etc/models/yamnet.tflite and labels: /etc/labels/yamnet.json
Pipeline state changed from PAUSED to PLAYING
```

The display shows the test video with audio classification results overlaid.

## Validation

- Pipeline reaches `PLAYING` state
- Terminal continuously outputs audio classification results
- Display shows classification labels

## How It Works

YAMNet is an audio event classification model based on the AudioSet dataset, supporting 521 audio categories. Pipeline flow:

```text
filesrc → qtdemux → (audio decode) → qtimlaudioconverter
                                          ↓
                                qtimltflite (inference)
                                          ↓
                               qtimlaclassification
                                          ↓
                               (classification label overlay)
```
