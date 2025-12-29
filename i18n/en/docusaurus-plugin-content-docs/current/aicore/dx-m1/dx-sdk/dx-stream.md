---
sidebar_position: 9
---

# DX-STREAM

DX-STREAM is a custom GStreamer plugin for integrating real-time streaming data into AI inference applications based on the DEEPX NPU.
It provides a modular pipeline framework with configurable pre-processing, inference, and post-processing components, designed specifically for vision AI workloads. DX-STREAM enables developers to build flexible, high-performance applications for scenarios such as video analytics, smart cameras, and edge AI systems.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-stream-arch.webp"/>
   DX-STREAM Architecture
</div>

## Installation

### Clone the DX-ALL-SUITE Repository

:::tip
Clone the specified DX-ALL-SUITE version following [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite).
:::

### Build DX-STREAM

Enter the `dx-all-suite/dx-runtime/dx_stream` directory.

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_stream
```

</NewCodeBlock>

#### Install Required Dependencies

<NewCodeBlock tip="Host" type="device">

```bash
./install.sh
```

</NewCodeBlock>

#### Build dx-stream

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh
```

</NewCodeBlock>

#### Verify dx-stream

<NewCodeBlock tip="Host" type="device">

```bash
gst-inspect-1.0 dxstream
```

</NewCodeBlock>

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/v2.1.0/docs/dx-all-suite/dx-runtime/dx_stream$ gst-inspect-1.0 dxstream
Plugin Details:
  Name                     dxstream
  Description              DX Stream plugin
  Filename                 /lib/aarch64-linux-gnu/gstreamer-1.0/libgstdxstream.so
  Version                  2.1.0
  License                  LGPL
  Source module            gst-dxstream
  Binary package           GStreamer DEEPX DX-Stream Plugins
  Origin URL               https://github.com/DEEPX-AI/dx_stream

  dxgather: DxGather
  dxinfer: DXInfer
  dxinputselector: DXInputSelector
  dxmsgbroker: DXMsgBroker
  dxmsgconv: DXMsgConv
  dxosd: DXOsd
  dxoutputselector: DXOutputSelector
  dxpostprocess: DXPostprocess
  dxpreprocess: DXPreprocess
  dxrate: DXRate
  dxtracker: DXTracker

  11 features:
  +-- 11 elements
```

#### Uninstall dx-stream

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh --uninstall
```

</NewCodeBlock>

## Running Examples

### Download Sample Models and Videos

<NewCodeBlock tip="Host" type="device">

```bash
./setup.sh
```

</NewCodeBlock>

### Run the Demo

<NewCodeBlock tip="Host" type="device">

```bash
./run_demo.sh
```

</NewCodeBlock>

After running `run_demo.sh`, select a demo from the menu.

```bash
(.venv) rock@rock-5b-plus:~/ssd/deepx/v2.1.0/docs/dx-all-suite/dx-runtime/dx_stream$ ./run_demo.sh
/mnt/ssd/deepx/v2.1.0/docs/dx-all-suite/dx-runtime/dx_stream ~/ssd/deepx/v2.1.0/docs/dx-all-suite/dx-runtime/dx_stream
[INFO] DX_STREAM_PATH: /mnt/ssd/deepx/v2.1.0/docs/dx-all-suite/dx-runtime/dx_stream
[INFO] Models and Videos directory already exists. Skipping download.
0: Object Detection (YOLOv5s)
1: Object Detection (YOLOv5s with PPU)
2: Face Detection (YOLOV5S_Face)
3: Face Detection (SCRFD500M with PPU)
4: Pose Estimation (YOLOV5Pose)
5: Pose Estimation (YOLOV5Pose with PPU)
6: Multi-Object Tracking
7: Semantic Segmentation
8: Multi-Channel Object Detection
9: Multi-Channel RTSP
-: secondary mode
which AI demo do you want to run:(timeout:10s, default:0)
```

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-stream-demo.webp"/>
   DX-STREAM Demo
</div>

## Build DX-STREAM Documentation

:::tip
For more details on how to use DX-STREAM, please build the full documentation and refer to it.
:::

### Install MkDocs

<NewCodeBlock tip="Host" type="device">

```bash
pip install mkdocs mkdocs-material mkdocs-video pymdown-extensions mkdocs-with-pdf markdown-grid-tables
```

</NewCodeBlock>

### Build Documentation

<NewCodeBlock tip="Host" type="device">

```bash
cd docs
mkdocs build
```

</NewCodeBlock>

After the build completes, `DEEPX_DX-STREAM_UM_v2.1.0.pdf` will be generated in the current directory.

### Start the Documentation Server

You can access the documentation in a web browser.

<NewCodeBlock tip="Host" type="device">

```bash
mkdocs serve
```

</NewCodeBlock>
