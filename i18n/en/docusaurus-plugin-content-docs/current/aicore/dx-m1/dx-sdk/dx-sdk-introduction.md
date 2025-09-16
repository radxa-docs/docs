---
sidebar_position: 1
---

# DX-M1 SDK Introduction

## Overview

The DX-M1 SDK is a software development kit designed to optimize AI models and efficiently deploy them on the Radxa AICore DX-M1 accelerator card. With the DX-M1 SDK, users can port mainstream AI framework models (PyTorch, ONNX, TensorFlow) to the Radxa AICore DX-M1 AI accelerator card for hardware-accelerated inference using the DEEPX NPU.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-m1-sdk-overview.webp"/>
   DX-M1 SDK overview
</div>

## SDK Components

The DX-M1 SDK consists of two main parts: the model compilation component and the model inference component.

:::tip
To download the DX-M1 SDK, please visit the [Resource Download](../download.md) page.
:::

### Model Compilation Component

- [**DX-COM (Model Compiler)**](./dx-com): Compiles ONNX models into DXNN model files that can be executed on the NPU, based on ONNX model files and configuration files.
- [**DX-SIM (Inference Simulator)**](./dx-sim): Simulates NPU hardware functionality on x86 PCs to perform inference on DXNN models.
- [**DX-Tron (DXNN Model Viewer)**](./dx-tron): A structure viewer for DXNN models.

### Model Inference Component

- [**DX-NPU-Driver (Driver Software)**](./dx-npu-driver): Used to drive the AICore DX-M1.

- [**DX-RT (Runtime Software)**](./dx-rt): A runtime that enables interaction between users and the AICore DX-M1 NPU hardware, implementing pre-processing and post-processing during inference, and managing NPU input and output.

- [**DX-APP (Demo Application)**](./dx-app): A template for applications based on the AICore DX-M1 NPU.

## System Requirements

| Component   | Requirements                     |
| ----------- | -------------------------------- |
| CPU         | x86 (x64)                        |
| RAM         | ≥ 16GB                           |
| Storage     | ≥ 8GB                            |
| OS          | Ubuntu 18.04, 20.04, 22.04 (x64) |
| LDD Version | ≥ 2.28                           |
