---
sidebar_position: 1
---

# Quick start

This guide explains how to get started with Radxa AIcore DX-M1 / DX-M1M.

:::info Compatibility

AIcore DX-M1 / DX-M1M has been verified to work with multiple Radxa single-board computers (SBCs).

- Compatible boards
  - ROCK 2A
  - ROCK 2F
  - ROCK 3B
  - ROCK 3C
  - ROCK 4A/4A+/4B/4B+/SE
  - ROCK 5A/5B/5B+/5C/5T
  - Dragon Q6A
  - Orion O6
  - Orion O6N
  - Cubie A5E
  - Raspberry Pi 5
    :::

## Product photos

<Tabs queryString="Product">

<TabItem value="DX-M1">

<div style={{textAlign: 'center'}}>
   AIcore DX-M1 module (front)
   <img src="/en/img/aicore-dx-m1/dx-m1-top.webp" style={{width: '60%', maxWidth: '800px'}} />
   AIcore DX-M1 module (back)
    <img src="/en/img/aicore-dx-m1/dx-m1-bottom.webp" style={{width: '60%', maxWidth: '800px'}} />
</div>

</TabItem>

<TabItem value="DX-M1M">

<div style={{textAlign: 'center'}}>
   AIcore DX-M1M module (front)
   <img src="/en/img/aicore-dx-m1/dx-m1m-top.webp" style={{width: '60%', maxWidth: '800px'}} />
   AIcore DX-M1M module (back)
    <img src="/en/img/aicore-dx-m1/dx-m1m-bottom.webp" style={{width: '60%', maxWidth: '800px'}} />
</div>

</TabItem>

</Tabs>
## Prerequisites

Prepare the following hardware to use AIcore DX-M1 / DX-M1M:

- **AI accelerator module**: Radxa AIcore DX-M1 / DX-M1M
- **Host board kit**: A compatible host board + power adapter + boot media (such as a microSD card)

:::tip Requirements
The host board must meet the following requirements:

- Able to boot into an OS normally
- Provides an available **M.2 M Key** slot (PCIe Gen 3.0 supported) for installing AIcore DX-M1 / DX-M1M
  :::

## Hardware installation

Follow the [Hardware installation](./hardware-install) guide to install AIcore DX-M1 / DX-M1M.

:::tip Note
For most host boards, installing an M.2 M Key add-on device follows the same general procedure. You can refer to the [Hardware installation](./hardware-install) guide.
:::

## Verify hardware detection

After installing AIcore DX-M1 / DX-M1M into the host board's M.2 M Key slot and booting the OS, you can run `lspci` to verify whether the device is detected:

<NewCodeBlock tip="Device" type="device">
```bash
lspci
```
</NewCodeBlock>

If AIcore DX-M1 / DX-M1M is detected, you should see output similar to the following:

```text
0000:01:00.0 Processing accelerators: DEEPX Co., Ltd. DX_M1A
```

## Environment setup

On Linux (Ubuntu, Debian), refer to [DX-NPU-Driver installation](DX-SDK/dx-npu-driver) and [DX-RT runtime installation](./DX-SDK/dx-rt) to install the required driver and runtime environment for AIcore DX-M1 / DX-M1M.

## Example applications

After completing the steps above, you can follow [DX-APP examples](./DX-SDK/dx-app) to run AI acceleration and inference with AIcore DX-M1 / DX-M1M.
