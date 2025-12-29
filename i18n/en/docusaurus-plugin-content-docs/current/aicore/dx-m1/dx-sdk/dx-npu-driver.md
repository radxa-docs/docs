---
sidebar_position: 4
---

# DXRT-NPU-Driver

**DXRT-NPU-Driver** is the driver software for the Radxa AI Core DX-M1. You need to install this driver on the host where the DX-M1 is installed.

## Installation

### Check Hardware Connection

Install the Radxa AI Core DX-M1 by following [Hardware Installation](../hardware_install).

<NewCodeBlock tip="Host" type="device">

```bash
lspci
```

</NewCodeBlock>

```bash
0001:11:00.0 Processing accelerators: DEEPX Co., Ltd. DX_M1 (rev 01)
```

On some systems, the device name may not be shown and you may see the following output instead:

```bash
0b:00.0 1200: 1ff4:0000
```

### Install System Dependencies

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install git gcc g++ cmake ninja-build python3-dev python3-venv kmod libncurses5-dev libncursesw5-dev
```

</NewCodeBlock>

### Clone the DX-ALL-SUITE Repository

:::tip
Clone the specified DX-ALL-SUITE version following [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite).
:::

### Install the Driver

Enter the `dx-all-suite/dx-runtime/dx_rt_npu_linux_driver/modules` directory.

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt_npu_linux_driver/modules
```

</NewCodeBlock>

:::tip
There are three ways to install DXRT-NPU-Driver. Choose any one of the following:

- Install via .deb package

- Build via script

- Build via Makefile

:::

#### Install via .deb Package

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install ./release/latest/dxrt-driver-dkms_1.8.0-2_all.deb
```

</NewCodeBlock>

#### Build via Script

Build dx-npu-driver using the `build.sh` script.

<NewCodeBlock tip="Host" type="device">

```bash
sudo ./build.sh -d m1 -m deepx -c install
```

</NewCodeBlock>

```bash
 Usage:
	build.sh <options>

 options:
	-d, --device   [device]      select target device: m1 v3
	-m, --module   [module]      select PCIe module: deepx
	-k, --kernel   [kernel dir]  'KERNEL_DIR=[kernel dir]', The directory where the kernel source is located
	                                         default: /lib/modules/6.1.84-7-rk2410/build)
	-a, --arch     [arch]        set 'ARCH=[arch]' Target CPU architecture for cross-compilation, default: aarch64
	-t, --compiler [cross tool]   'CROSS_COMPILE=[cross tool]' cross compiler binary, e.g aarch64-linux-gnu-
	-i, --install  [install dir] 'INSTALL_MOD_PATH=[install dir]', module install directory
	                                         install to: [install dir]/lib/modules/[KERNELRELEASE]/extra/
	-c, --command  [command]     clean | install | uninstall
	                                         - uninstall: Remove the module files installed on the host PC.
	-j, --jops     [jobs]        set build jobs
	-f, --debug    [debug]       set debug feature [debugfs | log | all]
	-v, --verbose                build verbose (V=1)
	-h, --help                   show this help
```

Reboot the host.

<NewCodeBlock tip="Host" type="device">

```bash
sudo reboot
```

</NewCodeBlock>

#### Build via Makefile

Build dx-npu-driver using make.

<NewCodeBlock tip="Host" type="device">

```bash
sudo make DEVICE=m1 PCIE=deepx install
```

</NewCodeBlock>

Configure the driver to load on boot.

<NewCodeBlock tip="Host" type="device">

```bash
sudo depmod -A
sudo cp dx_dma.conf /etc/modprobe.d/
```

</NewCodeBlock>

Reboot the host.

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

### Uninstall the Driver

#### Uninstall (Installed via .deb)

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt remove dxrt-driver-dkms
```

</NewCodeBlock>

#### Uninstall (Installed via script)

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh -d m1 -m deepx -c uninstall
```

</NewCodeBlock>
