---
sidebar_position: 101
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# QIM SDK Development Guide

The Qualcomm Intelligent Multimedia SDK (IM SDK) is a GStreamer-based AI/ML application development framework. It provides ready-to-use CLI tools and hardware-accelerated plugins covering the complete pipeline from video capture, AI inference, to result rendering.

## Relationship with QAIRT

QIM SDK sits on top of QAIRT SDK:

| Layer                   | Contents                                                                   | Status on Q900                   |
| ----------------------- | -------------------------------------------------------------------------- | -------------------------------- |
| **QAIRT Runtime**       | QNN / SNPE / LiteRT runtime libraries                                      | Installed via apt (`qairt-libs`) |
| **QIM SDK Plugins**     | GStreamer ML plugins (capture, preprocess, inference, postprocess, render) | Installed via apt                |
| **QIM SDK Sample Apps** | `gst-ai-*` CLI tools                                                       | Installed via apt                |

Install QAIRT base libraries first (`sudo apt install -y qairt-libs`), see the installation steps below.

## Prerequisites

- Radxa AIRbox Q900 (QCS9075 / SA8775P, HTP V73 NPU)
- Ubuntu 24.04, with network access
- Display connected (Wayland)

## Installation

### Step 1: Install QAIRT Base Libraries

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y qairt-libs
```

</NewCodeBlock>

### Step 2: Install QIM SDK

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y \
    gstreamer1.0-tools \
    tensorflow-lite-qcom-apps \
    gstreamer1.0-qcom-sample-apps \
    gstreamer1.0-qcom-python-examples
```

</NewCodeBlock>

All ML inference plugins and video processing plugins are automatically installed as dependencies.

### Step 3: Verify Installation

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls /usr/bin/gst-ai-*
```

</NewCodeBlock>

Expected output: 20 `gst-ai-*` CLI tools.

## Download Models and Test Resources

Use the official script for one-click download:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y unzip
curl -L -O https://raw.githubusercontent.com/quic/sample-apps-for-qualcomm-linux/refs/heads/main/download_artifacts.sh
chmod +x download_artifacts.sh
sudo ./download_artifacts.sh -v GA1.6-rel -c QCS9075
```

</NewCodeBlock>

After download:

| Directory       | Contents                                   |
| --------------- | ------------------------------------------ |
| `/etc/models/`  | 10 `.tflite` quantized models              |
| `/etc/labels/`  | 16 label and config files                  |
| `/etc/media/`   | 4 test videos                              |
| `/etc/configs/` | 38 app config JSONs (from package install) |

## Quick Verification

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-classification --config-file=/etc/configs/config_classification.json
```

</NewCodeBlock>

On success, the display shows the test video with classification labels overlaid. The terminal output includes `Using DSP Delegate` and `Pipeline state changed to PLAYING`.

Press `Ctrl + C` to stop.

> Normally you do **not** need to manually set `XDG_RUNTIME_DIR` or `WAYLAND_DISPLAY` — these are configured automatically on SSH login.

## Available Sample Applications

The following apps have been verified on Q900 (QCS9075):

| Application                                                                        | Description                         | Model                                    | NPU           |
| ---------------------------------------------------------------------------------- | ----------------------------------- | ---------------------------------------- | ------------- |
| [Image Classification](./classification.md)                                        | Identify subjects in images         | InceptionV3                              | DSP           |
| [Object Detection](./object-detection.md)                                          | Detect and locate objects           | YOLOX                                    | DSP           |
| [Pose Detection](./pose-detection.md)                                              | Human body keypoint detection       | HRNet                                    | DSP           |
| [Image Segmentation](./segmentation.md)                                            | Per-pixel semantic segmentation     | DeepLabV3+                               | DSP           |
| [Monocular Depth](./monodepth.md)                                                  | Depth heatmap estimation            | MiDaS V2                                 | DSP           |
| [Super Resolution](./superresolution.md)                                           | Low-resolution upscaling            | QuickSRNet                               | DSP (partial) |
| [Audio Classification](./audio-classification.md)                                  | Audio event classification          | YAMNet                                   | CPU           |
| [Face Detection](./face-detection.md)                                              | Face landmark detection             | Lightweight Face Detection               | DSP           |
| [Daisy-Chain Detection & Classification](./daisychain-detection-classification.md) | Cascaded detection + classification | YOLOX + InceptionV3                      | DSP           |
| [Daisy-Chain Detection & Pose](./daisychain-detection-pose.md)                     | Cascaded detection + pose           | YOLOX + HRNet                            | DSP           |
| [Parallel AI Fusion](./parallel-inference.md)                                      | 4-model simultaneous inference      | YOLOX + InceptionV3 + HRNet + DeepLabV3+ | DSP           |
| [Multistream Inference](./multistream-inference.md)                                | Multi-stream concurrent detection   | YOLOX                                    | DSP           |
| [Event Encoder](./event-encoder.md)                                                | Detection event encoding            | YOLOX                                    | DSP           |
| [Metadata Parser](./metadata-parser.md)                                            | Detection metadata export           | YOLOX                                    | DSP           |

> See the [IM SDK Reference Manual](https://docs.qualcomm.com/doc/80-70020-50SC/topic/download-model-and-label-files.html) Chapter 3 for the full list.

## Reference

- [Python GStreamer Apps](./python-apps.md) — Python binding examples
- [Build from Source](./build-from-source.md) — Compile custom GStreamer apps on-device

## Troubleshooting

### No display output

Check that the Wayland socket exists:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY
```

</NewCodeBlock>

### DSP inference failure

Verify FastRPC device nodes exist:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
ls /dev/fastrpc-cdsp*
```

</NewCodeBlock>

If no output, see [Enable NPU](../fastrpc-setup.md).

### Model files missing

Re-run the download script:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo ./download_artifacts.sh -v GA1.6-rel -c QCS9075
```

</NewCodeBlock>
