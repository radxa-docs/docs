---
sidebar_position: 3
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Pose Detection

`gst-ai-pose-detection` performs human pose detection on each frame of a video stream, drawing skeleton connections between body keypoints.

Uses the HRNet model.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Required Files

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/models/hrnet_pose_quantized.tflite
ls -l /etc/labels/hrnet_pose.json
ls -l /etc/labels/hrnet_settings.json
```

</NewCodeBlock>

> `hrnet_settings.json` defines the connections between body joints. Missing this file causes `Invalid pose settings path` error.

### 2. View Configuration

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cat /etc/configs/config_pose.json
```

</NewCodeBlock>

Key fields:

| Field                | Default                                   | Description             |
| -------------------- | ----------------------------------------- | ----------------------- |
| `file-path`          | `/etc/media/video.mp4`                    | Input video path        |
| `ml-framework`       | `tflite`                                  | Inference framework     |
| `model`              | `/etc/models/hrnet_pose_quantized.tflite` | Model file              |
| `labels`             | `/etc/labels/hrnet_pose.json`             | Label file              |
| `pose-settings-path` | `/etc/labels/hrnet_settings.json`         | Joint connection config |
| `runtime`            | `dsp`                                     | Inference hardware      |

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-pose-detection --config-file=/etc/configs/config_pose.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

Terminal output:

```text
Running app with model: /etc/models/hrnet_pose_quantized.tflite and labels: /etc/labels/hrnet_pose.json and settings /etc/labels/hrnet_settings.json
Using DSP Delegate
VERBOSE: Replacing 518 out of 518 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

The display shows the test video with skeleton connections drawn between body keypoints.

## Validation

- `Using DSP Delegate`: Inference running on NPU
- `Replacing 518 out of 518 node(s)`: All 518 operators delegated to DSP
- Pipeline reaches `PLAYING` state
- Display correctly shows human skeleton overlay

## Troubleshooting

### Invalid pose settings path

Verify `hrnet_settings.json` exists under `/etc/labels/`:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls -l /etc/labels/hrnet_settings.json
```

</NewCodeBlock>

If missing, re-run the download script:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo ./download_artifacts.sh -v GA1.6-rel -c QCS9075
```

</NewCodeBlock>
