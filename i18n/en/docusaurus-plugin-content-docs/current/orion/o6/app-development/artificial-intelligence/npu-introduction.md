---
sidebar_position: 1
---

# NPU SDK Installation

## Introduction to NPU

The Radxa Orion O6 boasts a powerful NPU (Neural Processing Unit) with up to 28.8TOPs computing power, supporting acceleration for INT4 / INT8 / INT16 / FP16 / BF16 and TF32 data types.
This document primarily explains how to run AI models and applications with NPU - accelerated inference using the CIX P1 NPU SDK. It covers model compilation tools, the toolchain, and step - by - step explanations of common model cases.

## CIX Early Bird Program

The NPU SDK includes the NOE Compiler and CIX AI Model Hub, and access to the SDK requires applying for the CIX Early Bird Program.
Application link: [CIX Early Bird Program](https://support.cixtech.com/#/)

## Install NPU SDK (x86 Linux Environment)

### Downloading the NPU SDK

After applying through the [CIX Early Bird Program](#cix-early-bird-program), an email will be sent to your registered mailbox. Please download the SDK according to the email instructions.

```bash
tar -xvf nor.tag.gz
```

### Installing the NPU SDK on an X86 Host

:::tip
The CIX P1 NPU SDK is installed on an X86 host and requires Python version 3.8.

Please prepare a Python 3.8 environment in advance, and it is recommended to use [anaconda](https://www.anaconda.com/download)
:::

### Installing the NOE Compiler

The NOE Compiler is used for model compilation, converting models in the ONNX framework format to a format that can be used for NPU - accelerated inference.

```bash
cd noe
pip3 install -r requirements.txt
pip3 install ./CixBuilder-6.1.2958.1-py3-none-any.whl
```

## Installing the NOE UMD on the Board

:::tip
The NOE UMD package is released in the form of a deb installation package. If using the Python API, when creating a virtual environment, please inherit the system dependencies: **`python3 -m venv --system-site-packages .venv`**
:::
After applying through the [CIX Early Bird Program](#cix-early-bird-program), an email will be sent to your registered mailbox. Please download the UMD (User Mode Driver) deb package according to the email instructions.

```bash
sudo dpkg -i ./cix-noe-umd_0.01-1_arm64.deb
```
