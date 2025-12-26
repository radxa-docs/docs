---
sidebar_position: 9
---

# DX-STREAM

DX-STREAM 是一个自定义的 GStreamer 插件，用于将实时流式数据集成到基于 DEEPX NPU 的 AI 推理应用中。
它提供了一套模块化的流水线框架，包含可配置的预处理、推理和后处理组件，专为视觉 AI 工作而设计。DX-STREAM 使开发者能够构建灵活、高性能的应用，适用于视频分析、智能摄像头以及边缘 AI 系统等应用场景。

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/dx-stream-arch.webp"/>
   DX-STREAM Architecture
</div>

## 安装方法

### 克隆 DX-ALL-SUITE 仓库

:::tip
请按照 [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite) 克隆指定版本的 DX-ALL-SUITE 仓库
:::

### 编译 DX-STREAM

进入 `dx-all-suite/dx-runtime/dx_stream` 目录

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_stream
```

</NewCodeBlock>

#### 安装必要依赖

<NewCodeBlock tip="Host" type="device">

```bash
./install.sh
```

</NewCodeBlock>

#### 编译 dx-stream

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh
```

</NewCodeBlock>

#### 验证 dx-stream

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

#### 卸载 dx-stream

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh --uninstall
```

</NewCodeBlock>

## 运行例子

### 下载示例模型和视频

<NewCodeBlock tip="Host" type="device">

```bash
./setup.sh
```

</NewCodeBlock>

### 运行实例 Demo

<NewCodeBlock tip="Host" type="device">

```bash
./run_demo.sh
```

</NewCodeBlock>

执行 `run_demo.sh` 后请选择选项里的 demo

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
   <img src="/img/aicore-dx-m1/dx-stream-demo.webp"/>
   DX-STREAM Demo
</div>

## DX-STREAM 文档构建

:::tip
更多关于 DX-STREAM 的使用方法，请构建详细文档查阅
:::

### 安装 MkDocs

<NewCodeBlock tip="Host" type="device">

```bash
pip install mkdocs mkdocs-material mkdocs-video pymdown-extensions mkdocs-with-pdf markdown-grid-tables
```

</NewCodeBlock>

### 构建文档

<NewCodeBlock tip="Host" type="device">

```bash
cd docs
mkdocs build
```

</NewCodeBlock>

构建完成后会在当前目录下生成 `DEEPX_DX-STREAM_UM_v2.1.0.pdf`

### 启动文档服务

可以使用浏览器访问网页文档

<NewCodeBlock tip="Host" type="device">

```bash
mkdocs serve
```

</NewCodeBlock>
