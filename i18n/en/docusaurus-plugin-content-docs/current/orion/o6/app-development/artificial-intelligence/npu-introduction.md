---
sidebar_position: 1
---

# NPU SDK Installation

## NPU Overview

The Radxa Orion O6 features an NPU (Neural Processing Unit) with up to 28.8TOPs of computing power, supporting INT4, INT8, INT16, FP16, BF16, and TF32 acceleration types.
This document explains how users can utilize the CIX P1 NPU SDK to run AI models and applications accelerated by the NPU. It includes explanations of the model compilation tools, toolchains, and common model cases.

## CIX Early Bird Program

The NPU SDK includes the NOE Compiler and CIX AI Model Hub. To obtain the SDK, users must apply for the CIX Early Bird Program.

Application link: [CIX Early Bird Program](https://support.cixtech.com/#/)

## Install NPU SDK (x86 Linux Environment)

After applying through the [CIX Early Bird Program](#cix-early-bird-program), an email will be sent to the registered email address. Follow the email instructions to download the SDK.

```bash
tar -xvf nor.tag.gz
```

:::tip
The CIX P1 NPU SDK is installed on an x86 host and requires Python version 3.8.

Users should prepare a Python 3.8 environment. It is recommended to use [Anaconda](https://www.anaconda.com/download).
:::

### Install NOE Compiler

The NOE Compiler is used for model compilation, converting ONNX framework models into formats that can be accelerated by the NPU.

```bash
cd noe
pip3 install -r requirements.txt
pip3 install ./CixBuilder-6.1.2958.1-py3-none-any.whl
```

## Install NOE UMD (Orion O6)

:::tip
The NOE UMD package is released in the form of a Debian installation package. If using the Python API, ensure to inherit system dependencies when creating a virtual environment:

**`python3 -m venv --system-site-packages .venv`**
:::

After applying through the [CIX Early Bird Program](#cix-early-bird-program), an email will be sent to the registered email address. Follow the email instructions to download the UMD (User Mode Driver) Debian package.

```bash
sudo dpkg -i ./cix-noe-umd_0.01-1_arm64.deb
```
