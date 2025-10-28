---
sidebar_position: 1
---

# Quick Start

This guide primarily uses the ROCK 5B+ as an example to demonstrate how to use the Radxa AICore DX-M1 product.

:::info Compatibility

The AICore DX-M1 has been tested and verified to work with multiple Radxa Single Board Computers (SBCs).

- Compatible Motherboards
  - ROCK 5B
  - ROCK 5B+

:::

## Product Appearance

<div style={{textAlign: 'center'}}>
   AICore DX-M1 Module Front View
   <img src="/en/img/aicore-dx-m1/dx-m1-top.webp" style={{width: '60%', maxWidth: '800px'}} />
   AICore DX-M1 Module Rear View
   <img src="/en/img/aicore-dx-m1/dx-m1-bottom.webp" style={{width: '60%', maxWidth: '800px'}} />
</div>

## Prerequisites

You need to prepare the following hardware components to use with the AICore DX-M1:

- **AI Computing Module**: Radxa AICore DX-M1
- **Board Kit**: AICore DX-M1 compatible motherboard + power adapter + system boot media (e.g., Micro SD card, etc.)

:::tip Requirements
The board must meet the following requirements:

- Capable of booting the system normally
- Provides an **unoccupied M.2 M Key slot** (supporting PCIe Gen 3.0 x4) for installing the AICore DX-M1
  :::

## Hardware Installation

For ROCK 5B+, you can refer to the [Hardware Installation](./hardware_install) tutorial to install the AICore DX-M1.

:::tip Note
For motherboards with M.2 M Key slots, the installation steps and methods are generally the same. You can refer to the [Hardware Installation](./hardware_install) tutorial to install the AICore DX-M1.
:::

## Hardware Recognition

After installing the AICore DX-M1 into the motherboard's M.2 M Key slot and booting the system, you can open a terminal and enter the `lspci` command to verify if the system correctly recognizes the AICore DX-M1:

<NewCodeBlock tip="Device" type="device">
```
lspci
```
</NewCodeBlock>

If the system recognizes the AICore DX-M1, the terminal will display output similar to the following:

```
0000:01:00.0 Processing accelerators: DEEPX Co., Ltd. DX_M1A
```

## Environment Setup

For Linux (Ubuntu, Debian) systems, you can refer to the [DX-NPU-Driver Installation](DX-SDK/dx-npu-driver) tutorial and the [DX-RT Runtime Installation](./DX-SDK/dx-rt) tutorial to install the required drivers and runtime environment for the AICore DX-M1.

## Application Examples

After successfully completing the above steps, you can refer to the [DX-APP Examples](./DX-SDK/dx-app) tutorial to use the AICore DX-M1 for AI acceleration and inference.
