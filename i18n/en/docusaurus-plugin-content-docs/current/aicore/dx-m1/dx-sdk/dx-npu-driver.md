---
sidebar_position: 4
---

# DX-NPU Driver

**DX-NPU Driver** is the driver software for the Radxa AICore DX-M1. Users need to install this driver on the host with the AICore DX-M1 installed.

## Installation Method

### Check Hardware Connection Status

Please refer to [Hardware Installation](../hardware_install) to install the AICore DX-M1.

<NewCodeBlock tip="Host" type="device">

```bash
lspci
```

</NewCodeBlock>

```bash
0000:01:00.0 Processing accelerators: DEEPX Co., Ltd. DX_M1A (rev 01)
```

On some systems, the name may not be displayed, and you might see the following information instead:

```bash
0b:00.0 1200: 1ff4:0000
```

### Download Installation Package

Please download the DX-NPU-Driver installation package from the DX-M1 SDK [Resource Download](../download.md) page and extract it:

<NewCodeBlock tip="Host" type="device">

```bash
tar -xvf dx_rt_npu_linux_driver_v1.3.1.tar.gz && cd dx_rt_npu_linux_driver
```

</NewCodeBlock>

### Install Driver

Install system dependencies:

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install git gcc g++ cmake ninja-build python3-dev python3-venv kmod
```

</NewCodeBlock>

Install dx-npu-driver:

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh
sudo ./build.sh -c install
```

</NewCodeBlock>

Reboot the host:

<NewCodeBlock tip="Host" type="device">

```bash
sudo reboot
```

</NewCodeBlock>

### Verify Driver Status

<NewCodeBlock tip="Host" type="device">

```bash
lsmod | grep dx
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ lsmod | grep dx
dxrt_driver            45056  2
dx_dma                462848  7 dxrt_driver
```
