---
sidebar_position: 1
---

# DX-M1 SDK Introduction

## Overview

DX-M1 SDK is a software development kit for optimizing AI models and deploying them efficiently on the Radxa AI Core DX-M1 accelerator.
With DX-M1 SDK, you can port mainstream AI framework models (PyTorch, ONNX, TensorFlow) to the Radxa AI Core DX-M1 and run hardware-accelerated inference using the DEEPX NPU.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-m1-sdk-overview.webp"/>
   DX-M1 SDK overview
</div>

## SDK Components

DX-M1 SDK consists of two parts: model compilation and model inference.

:::tip
Download the DX-M1 SDK package from the [Downloads](../download.md) page and use [**DX-ALL-SUITE**](#dx-all-suite).
:::

### Model Compilation

- [**DX-COM (Model Compiler)**](./dx-com) compiles ONNX model files into DXNN models that can run on the NPU, based on a configuration file.

[//]: # "- [**DX-SIM (Inference Simulator)**](./dx-sim) Simulates NPU hardware behavior on an x86 PC to run inference on DXNN models."

- [**DX-Tron (DXNN Model Viewer)**](./dx-tron) is a viewer for inspecting the DXNN model structure.

### Model Inference

- [**DXRT-NPU-Driver (Driver)**](./dx-npu-driver) is used to drive the Radxa AI Core DX-M1.

- [**DX-RT (Runtime)**](./dx-rt) is the runtime that interacts with the DX-M1 NPU hardware and provides pre/post-processing during inference while managing NPU inputs and outputs.

- [**DX-APP (Demo Applications)**](./dx-app) is an application demo template built on the DX-M1 NPU.

- [**DX-STREAM (GStreamer Plugin)**](./dx-stream) is a custom GStreamer plugin for integrating real-time streaming data into DEEPX NPU-based applications.

## DX-ALL-SUITE

DX-ALL-SUITE is the integrated repository for DEEPX-SDK, making it easier to install and use the DEEPX-SDK.

:::info
VERSION: v2.1.0
:::

<NewCodeBlock tip="Host" type="device">

```bash
export VERSION=v2.1.0
```

</NewCodeBlock>

<NewCodeBlock tip="Host" type="device">

```bash
git clone -b ${VERSION} --recurse-submodules https://github.com/DEEPX-AI/dx-all-suite.git
```

</NewCodeBlock>
