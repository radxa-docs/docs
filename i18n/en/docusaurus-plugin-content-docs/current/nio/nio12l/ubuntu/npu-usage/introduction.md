---
sidebar_position: 1
description: Introduces NPU hardware structure, deployment modes, and software stack on the NIO12L platform
---

# Introduction

## Hardware

### Genio Concept

The SoC used by NIO 12L is **Genio 1200**. Genio is the SoC series name used by MediaTek for IoT platforms.

### Genio 1200 Architecture

Genio 1200 has the following hardware available for AI acceleration:

| Hardware | Model             | Description                                |
| -------- | ----------------- | ------------------------------------------ |
| GPU      | Arm Mali-G57 MC5  | Provides floating-point model acceleration |
| NPU      | 2xMDLA2.0 + 2xVP6 | Neural Network Processing Unit             |

NPU is the collective name for MDLA and VPU. Inside the NPU, there are small, medium, and large-scale cores. This heterogeneous design provides support for various types of AI.

:::info About MDLA
MDLA stands for **Mediatek Deep Learning Accelerator**. It is primarily used for convolutional neural network acceleration.
:::

:::warning Limitations
MDLA2.0 does not support recurrent neural networks or Transformer-based generative large models.
:::

## Deployment

### Overview

The Genio AI software stack supports both analytical AI and generative AI, using a **host-device** architecture. This means models are converted and quantized on the host, then the processed models are run on the device.

![AI Software Stack Overview](/img/nio/nio12l/ai_sw_stack_common.webp)

### Two Modes

The inference modes running on the device are divided into **online** and **offline** modes:

| Mode    | Inference Framework                  | Model Format |
| ------- | ------------------------------------ | ------------ |
| online  | General AI frameworks (TFlite, ONNX) | tflite, onnx |
| offline | Neuron Runtime                       | dla          |

The core difference is whether a general AI framework's inference parsing tool needs to be configured on the device. Both modes require configuring the NPU's Neuron Runtime, because when the general AI framework's inference parsing tool calls the NPU, it also goes through Neuron Runtime.

:::note Online Mode
This mode is suitable for scenarios where models can efficiently utilize heterogeneous frameworks.
:::

#### Analytical AI - Online Mode Hardware Scheduling

| Framework          | Supported Hardware |
| ------------------ | ------------------ |
| ONNX Runtime       | CPU, NPU           |
| TFlite Interpreter | CPU, GPU, NPU      |

For models in tflite format, MediaTek provides a dedicated conversion tool called **NeuroPilot Converter**, which is more friendly to hardware acceleration.

#### Generative AI

:::caution Limitations
Currently, only offline mode is available and is for educational purposes only. Genio 1200 does not support generative AI yet.
:::

<details>
<summary>Generative AI Deployment Process</summary>

1. Quantize the model using the `mtk_llm_sdk` tool
2. Convert to tflite format using the `post_training_quantize` tool
3. Convert to dla format using NeuroPilot Converter
4. Compile into an executable and push to the device for execution
5. Run on the NPU via Neuron Runtime on the device

</details>

## Software Stack

### NeuroPilot

NeuroPilot (NP) is MediaTek's collection of tools, documentation, runtimes, and interfaces for AI development.

:::important Version Information
For a given SoC, the NP version that can be used throughout its lifecycle is fixed, because the types of operators supported by the hardware were determined during the initial hardware design.

- MDLA2.0's "2.0" identifies its version number
- NP version needs to match the MDLA hardware version
  :::

### Genio 1200 Support Status

| Feature                 | Support Status      |
| ----------------------- | ------------------- |
| Analytical AI (online)  | TFlite ✅ / ONNX ❌ |
| Analytical AI (offline) | ✅                  |
| Generative AI           | ❌                  |
