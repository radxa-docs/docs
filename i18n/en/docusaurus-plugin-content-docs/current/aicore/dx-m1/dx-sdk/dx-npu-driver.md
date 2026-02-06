---
sidebar_position: 4
---

# DXRT-NPU-Driver

**DXRT-NPU-Driver** is the driver for Radxa AIcore DX-M1 / DX-M1M. Install this driver on the host machine that has AIcore DX-M1 / DX-M1M installed.

## Installation

### Check hardware connectivity

Follow [Hardware installation](../hardware-install) to install AIcore DX-M1 / DX-M1M.

<NewCodeBlock tip="Host" type="device">

```bash
lspci
```

</NewCodeBlock>

```bash
0001:11:00.0 Processing accelerators: DEEPX Co., Ltd. DX_M1 (rev 01)
```

On some systems, the device name is not shown, and you may see the following output instead:

```bash
0b:00.0 1200: 1ff4:0000
```

### Install system dependencies

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install git gcc g++ cmake ninja-build python3-dev python3-venv kmod libncurses5-dev libncursesw5-dev
```

</NewCodeBlock>

### Clone the DX-ALL-SUITE repository

:::tip
Follow [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite) to clone the specified version of the DX-ALL-SUITE repository.
:::

### Install the driver

Enter the `dx-all-suite/dx-runtime/dx_rt_npu_linux_driver/modules` directory.

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt_npu_linux_driver/modules
```

</NewCodeBlock>

:::tip
There are three ways to install DXRT-NPU-Driver. Choose any one of them:

- Install via a deb package

- Build using the script

- Build using the Makefile

:::

#### Install via a deb package

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install ./release/latest/dxrt-driver-dkms_1.8.0-2_all.deb
```

</NewCodeBlock>

#### Build using the script

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

#### Build using the Makefile

Build dx-npu-driver with make.

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

Reboot the host

<NewCodeBlock tip="Host" type="device">

```bash
sudo reboot
```

</NewCodeBlock>

### Check driver status

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

### Uninstall

#### Uninstall (deb package)

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt remove dxrt-driver-dkms
```

</NewCodeBlock>

#### Uninstall (script build)

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh -d m1 -m deepx -c uninstall
```

</NewCodeBlock>
