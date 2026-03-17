---
sidebar_position: 1
---

# Quick start

This guide explains how to get started with Radxa AIcore DX-M1 / DX-M1M.

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

- **AIcore DX-M1**

The host board must provide an available M.2 M Key slot, supporting PCIe Gen 3.0

- **AIcore DX-M1M**

The host board must provide an available M.2 M Key or B Key slot, supporting PCIe Gen 3.0
:::

:::info Compatibility

AIcore DX-M1 / DX-M1M has been verified to work with multiple Radxa single-board computers (SBCs).

> **Verified Radxa-compatible boards**

```text
- ROCK 5A
- ROCK 5B
- ROCK 5B+
- ROCK 5 ITX
```

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
