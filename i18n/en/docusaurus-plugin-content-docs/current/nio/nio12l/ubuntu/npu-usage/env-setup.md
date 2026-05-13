---
sidebar_position: 2
description: Introduces how to set up the NPU development environment
---

# NPU Environment Setup

The NIO 12L is powered by the MediaTek MT8395 (Genio 1200), which integrates an APU (AI Processor Unit) and AI Accelerator (Aia). You can use the NeuroPilot software stack on Ubuntu to access hardware acceleration for AI inference.

## Install Firmware and Runtime

First, install the APU firmware and Neuron runtime:

```bash
sudo apt install mediatek-apusys-firmware-genio1200
sudo apt install mediatek-libneuron mediatek-neuron-utils mediatek-libneuron-dev
sudo reboot
```

## Install Neuron SDK

After rebooting, install the Neuron SDK:

<NewCodeBlock tip="Device" type="device">

```bash
snap install mtk-neuropilot --edge
```

</NewCodeBlock>

The `--edge` channel publishes the latest packages, which may update more frequently than the stable channel. For stable production use, check the Snap Store for each channel's version and support status.

## Verify Installation

### vpu5_test

```bash
sudo vpu5_test -a ks -l 10
```

The result should show `PASS`.

### ncc-tflite

`ncc-tflite` is a command-line tool for converting models from tflite format to dla format:

<NewCodeBlock tip="Device" type="device">

```bash
ncc-tflite --help
```

</NewCodeBlock>

### neuronrt

`neuronrt` can run dla models to verify model integrity:

<NewCodeBlock tip="Device" type="device">

```bash
neuronrt -v
```

</NewCodeBlock>

## Run Benchmark

```bash
sudo mkdir -p /usr/share/benchmark_dla
sudo cp /usr/share/neuropilot/benchmark_dla/* /usr/share/benchmark_dla/
sudo apt install python3-pip
sudo pip3 install numpy
sudo python3 /usr/share/benchmark_dla/benchmark.py --auto
```

## Supported Model Formats

- **TFLite** (`.tflite`)
- **ONNX** (`.onnx`) — requires loading via the Neuron API
- **Caffe** (`.caffemodel`)

For more details, refer to the official MediaTek documentation:

- [NeuroPilot Overview](https://neuropilot-developer.mediatek.com/resources/public/latest/en/docs/readme)
- [Neuron SDK Documentation](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/release/v25.0/sw/yocto/ml-guide/ml-neuron-sdk.html)
