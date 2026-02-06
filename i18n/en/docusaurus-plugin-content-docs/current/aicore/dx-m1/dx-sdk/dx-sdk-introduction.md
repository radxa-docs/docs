---
sidebar_position: 1
---

# DX-M1 / DX-M1M SDK introduction

## Overview

The DX-M1 / DX-M1M SDK is a software development kit for optimizing AI models and efficiently deploying them on Radxa AIcore DX-M1 / DX-M1M accelerator cards.
With the DX-M1 / DX-M1M SDK, you can port models from mainstream AI frameworks (PyTorch, ONNX, TensorFlow) to Radxa AIcore DX-M1 / DX-M1M, and run hardware-accelerated inference on the DEEPX NPU.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-m1-sdk-overview.webp"/>
   DX-M1 / DX-M1M SDK overview
</div>

## SDK components

The DX-M1 / DX-M1M SDK consists of two parts: model compilation and model inference.

:::tip
For DX-M1 / DX-M1M SDK packages, go to the [Downloads page](../download.md) or use [**DX-ALL-SUITE**](#dx-all-suite).
:::

### Model compilation

- [**DX-COM (model compiler)**](./dx-com) compiles an ONNX model file along with a configuration file into the DXNN model format that can be executed on the NPU.

[//]: # "- [**DX-SIM (inference simulator)**](./dx-sim) simulates NPU hardware functionality on an x86 PC to run DXNN model inference simulation."

- [**DX-Tron (DXNN model viewer)**](./dx-tron) is a structure viewer for DXNN models.

### Model inference

- [**DXRT-NPU-Driver (driver)**](./dx-npu-driver) provides driver support for AIcore DX-M1 / DX-M1M.

- [**DX-RT (runtime)**](./dx-rt) is the runtime used to interact with AIcore DX-M1 / DX-M1M NPU hardware. It provides pre-processing and post-processing during inference and manages NPU inputs and outputs.

- [**DX-APP (demo application)**](./dx-app) is a demo application template based on the AIcore DX-M1 / DX-M1M NPU.

- [**DX-STREAM (GStreamer plugin)**](./dx-stream) is a custom GStreamer plugin used to integrate real-time streaming data into applications based on the DEEPX NPU.

## DX-ALL-SUITE

DX-ALL-SUITE is an integration repository for the DEEPX SDK, which helps you install and use the DEEPX SDK more conveniently.

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
