---
sidebar_position: 2
description: 介绍如何配置 NPU 开发环境
---

# NPU 环境配置

NIO 12L 搭载 MediaTek MT8395 (Genio 1200) 内置 APU (AI Processor Unit) 和 AI Accelerator (Aia)，可通过 NeuroPilot 软件栈在 Ubuntu 上调用硬件加速进行 AI 推理。

## 安装固件与运行时

首先安装 APU 固件和 Neuron 运行时：

```bash
sudo apt install mediatek-apusys-firmware-genio1200
sudo apt install mediatek-libneuron mediatek-neuron-utils mediatek-libneuron-dev
sudo reboot
```

## 安装 Neuron SDK

重启后安装 Neuron SDK：

<NewCodeBlock tip="Device" type="device">

```bash
snap install mtk-neuropilot --edge
```

</NewCodeBlock>

`--edge` 渠道发布的是最新软件包，可能比稳定渠道更新更频繁。如需用于稳定生产环境，可前往 Snap 商店查看各版本渠道和官方支持状态。

## 验证安装

### vpu5_test

```bash
sudo vpu5_test -a ks -l 10
```

测试结果应显示 `PASS`。

### ncc-tflite

`ncc-tflite` 用于将模型从 tflite 格式转换为 dla 格式：

<NewCodeBlock tip="Device" type="device">

```bash
ncc-tflite --help
```

</NewCodeBlock>

### neuronrt

`neuronrt` 可运行 dla 模型并验证完整性：

<NewCodeBlock tip="Device" type="device">

```bash
neuronrt -v
```

</NewCodeBlock>

## 运行 Benchmark

```bash
sudo mkdir -p /usr/share/benchmark_dla
sudo cp /usr/share/neuropilot/benchmark_dla/* /usr/share/benchmark_dla/
sudo apt install python3-pip
sudo pip3 install numpy
sudo python3 /usr/share/benchmark_dla/benchmark.py --auto
```

## 支持的模型格式

- **TFLite** (`.tflite`)
- **ONNX** (`.onnx`) — 需通过 Neuron API 加载
- **Caffe** (`.caffemodel`)

更多信息参考 MediaTek 官方文档：

- [NeuroPilot 主页](https://neuropilot-developer.mediatek.com/resources/public/latest/en/docs/readme)
- [Neuron SDK 文档](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/release/v25.0/sw/yocto/ml-guide/ml-neuron-sdk.html)
