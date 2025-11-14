---
sidebar_position: 1
---

# DX-M1 SDK Introduction

## Overview

DX-M1 SDK is a suite of SDKs for optimizing artificial intelligence models and efficiently deploying them on Radxa AICore DX-M1 accelerator cards.
Users can use DX-M1 SDK to port mainstream AI framework models (Pytorch, Onnx, Tensorflow) to Radxa AICore DX-M1 AI accelerator cards for hardware-accelerated inference using DEEPX NPU.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-m1-sdk-overview.webp"/>
   DX-M1 SDK overview
</div>

## SDK Components

DX-M1 SDK consists of two parts: model compilation part and model inference part.

:::tip
For DX-M1 SDK configuration, please go to the [Resources Download page](../download.md) and use [**DX-ALL-SUITE**](#dx-all-suite) to download
:::

### Model Compilation Part

- [**DX-COM (Model Compiler)**](./dx-com) compiles ONNX models into DXNN model file format executable on NPU based on ONNX model files and configuration files.

[//]: # "- [**DX-SIM (Inference Simulator)**](./dx-sim) simulates inference of DXNN models by simulating NPU hardware functions on X86 PC."

- [**DX-Tron (DXNN Model Viewer)**](./dx-tron) is a structure viewer for DXNN models.

### Model Inference Part

- [**DXRT-NPU-Driver (Driver Software)**](./dx-npu-driver) is used to drive AICore DX-M1.

- [**DX-RT (Runtime Software)**](./dx-rt) is the runtime for users to interact with AICore DX-M1 NPU hardware, implementing pre-processing and post-processing during inference, managing NPU input and output.

- [**DX-APP (Demo Applications)**](./dx-app) are application demo templates based on AICore DX-M1 NPU.

## DX-ALL-SUITE

DX-ALL-SUITE is the integrated repository of DEEPX-SDK, which can be used to facilitate user installation and use of DEEPX-SDK.

:::info
VERSION: v1.0.0
:::

<NewCodeBlock tip="Host" type="device">

```bash
export VERSION=v1.0.0
```

</NewCodeBlock>

<NewCodeBlock tip="Host" type="device">

```bash
git clone -b ${VERSION} --recurse-submodules https://github.com/DEEPX-AI/dx-all-suite.git
```

</NewCodeBlock>
