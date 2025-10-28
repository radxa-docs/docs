---
sidebar_position: 1
---

# DX-M1 SDK 介绍

## 概述

DX-M1 SDK 是一套用于优化人工智能模型并将模型高效地部署在瑞莎智核 DX-M1 加速卡上的 SDK。
用户使用 DX-M1 SDK 可以将主流的人工智能框架模型（Pytorch, Onnx, Tensorflow）移植到瑞莎智核 DX-M1 AI 加速卡上使用 DEEPX NPU 进行硬件加速推理。

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/dx-m1-sdk-overview.webp"/>
   DX-M1 SDK overview
</div>

## SDK 组成

DX-M1 SDK 由两部分组成分别为模型编译部分和模型推理部分。

:::tip
DX-M1 SDK 下载请到 [资源下载页面](../download.md) 进行下载
:::

### 模型编译部分

- [**DX-COM（模型编译器）**](./dx-com) 是根据 ONNX 模型文件和配置文件，将 ONNX 模型编译成在 NPU 上可执行的 DXNN 模型文件格式。
- [**DX-SIM（推理模拟器）**](./dx-sim) 通过在 X86 PC 上模拟 NPU 硬件功能，模拟推理 DXNN 模型。
- [**DX-Tron（DXNN 模型查看器）**](./dx-tron) 是 DXNN 模型的结构查看器。

### 模型推理部分

- [**DX-NPU-Driver（驱动软件）**](./dx-npu-driver) 用于驱动智核 DX-M1。

- [**DX-RT（运行时软件）**](./dx-rt) 用户与智核 DX-M1 NPU 硬件进行交互的运行时，并实现推理过程中的前后处理，管理 NPU 的输入与输出。

- [**DX-APP（演示应用）**](./dx-app) 是基于智核 DX-M1 NPU 的应用 demo 模板。

## 系统要求

| CPU         | x86（x64）                        |
| ----------- | --------------------------------- |
| 内存（RAM） | ≥ 16GB                            |
| 存储空间    | ≥ 8GB                             |
| 操作系统    | Ubuntu 18.04、20.04、22.04（x64） |
| LDD 版本    | ≥ 2.28                            |
