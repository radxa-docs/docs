---
sidebar_position: 4
---

# DXRT-NPU-Driver

**DXRT-NPU-Driver** is the driver software for Radxa AICore DX-M1. Users need to install this driver software on the host where the AICore DX-M1 is installed.

## Installation

### Check Hardware Connection Status

Please refer to [Hardware Installation](../hardware_install) to install AICore DX-M1

<NewCodeBlock tip="Host" type="device">

```bash
lspci
```

</NewCodeBlock>

```bash
0001:11:00.0 Processing accelerators: DEEPX Co., Ltd. DX_M1 (rev 01)
```

On some systems, the name may not be printed and the following information will be output:

```bash
0b:00.0 1200: 1ff4:0000
```

### Install System Dependencies

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install git gcc g++ cmake ninja-build python3-dev python3-venv kmod libncurses5-dev libncursesw5-dev
```

</NewCodeBlock>

### Clone DX-ALL-SUITE Repository

:::tip
Please follow [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite) to clone the specified version of the DX-ALL-SUITE repository
:::

### Install Driver

Navigate to the `dx-all-suite/dx-runtime/dx_rt_npu_linux_driver/modules` directory

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt_npu_linux_driver/modules
```

</NewCodeBlock>

:::tip
DXRT-NPU-Driver installation has two methods, you can use

- Script installation

- Makefile compilation
  :::

- Script installation

    <NewCodeBlock tip="Host" type="device">

  ```bash
  ./build.sh -d m1 -m deepx
  sudo ./build.sh -d m1 -m deepx -c install
  ```

    </NewCodeBlock>

- Makefile compilation

  Compile dx-npu-driver

    <NewCodeBlock tip="Host" type="device">

  ```bash
  make DEVICE=m1 PCIE=deepx
  sudo make DEVICE=m1 PCIE=deepx install
  ```

    </NewCodeBlock>

  Configure automatic driver loading on boot

    <NewCodeBlock tip="Host" type="device">

  ```bash
  sudo depmod -A
  sudo cp dx_dma.conf /etc/modprobe.d/
  ```

    </NewCodeBlock>

Restart host

<NewCodeBlock tip="Host" type="device">

```bash
sudo reboot
```

</NewCodeBlock>

### Check Driver Status

<NewCodeBlock tip="Host" type="device">

```bash
lsmod | grep dx
```

</NewCodeBlock>

```bash
rock@rock-5b-plus:~$ lsmod | grep dx
dxrt_driver            45056  2
dx_dma                483328  9 dxrt_driver
```

### Uninstall Driver

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt_npu_linux_driver/modules
sudo ./build.sh -d m1 -m deepx -c uninstall
```

</NewCodeBlock>
