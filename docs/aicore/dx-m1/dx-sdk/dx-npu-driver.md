---
sidebar_position: 4
---

# DXRT-NPU-Driver 驱动

**DXRT-NPU-Driver** 是瑞莎智核 DX-M1 / DX-M1M 的驱动软件，用户需在安装了智核 DX-M1 / DX-M1M 的 host (主机) 上安装此驱动软件。

## 安装方法

### 检查硬件连接状态

请参考 [硬件安装](../hardware-install) 安装智核 DX-M1 / DX-M1M

<NewCodeBlock tip="Host" type="device">

```bash
lspci
```

</NewCodeBlock>

```bash
0001:11:00.0 Processing accelerators: DEEPX Co., Ltd. DX_M1 (rev 01)
```

某些系统上不打印名字，会输出以下信息

```bash
0b:00.0 1200: 1ff4:0000
```

### 安装系统依赖

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install git gcc g++ cmake ninja-build python3-dev python3-venv kmod libncurses5-dev libncursesw5-dev
```

</NewCodeBlock>

### 克隆 DX-ALL-SUITE 仓库

:::tip
请按照 [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite) 克隆指定版本的 DX-ALL-SUITE 仓库
:::

### 安装驱动

进入 `dx-all-suite/dx-runtime/dx_rt_npu_linux_driver/modules` 目录

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt_npu_linux_driver/modules
```

</NewCodeBlock>

:::tip
DXRT-NPU-Driver 驱动安装有三种安装方法，请选择任意一种，可以使用

- deb 包安装

- 脚本编译

- Makefile 编译

:::

#### deb 包安装

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install ./release/latest/dxrt-driver-dkms_1.8.0-2_all.deb
```

</NewCodeBlock>

#### 脚本编译

使用 `build.sh` 脚本编译 dx-npu-driver

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

重启 host

<NewCodeBlock tip="Host" type="device">

```bash
sudo reboot
```

</NewCodeBlock>

#### Makefile 编译

使用 make 编译 dx-npu-driver

<NewCodeBlock tip="Host" type="device">

```bash
sudo make DEVICE=m1 PCIE=deepx install
```

</NewCodeBlock>

配置开机加载驱动

<NewCodeBlock tip="Host" type="device">

```bash
sudo depmod -A
sudo cp dx_dma.conf /etc/modprobe.d/
```

</NewCodeBlock>

重启 host

<NewCodeBlock tip="Host" type="device">

```bash
sudo reboot
```

</NewCodeBlock>

### 检查驱动状态

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

### 卸载驱动

#### deb 包安装卸载方法

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt remove dxrt-driver-dkms
```

</NewCodeBlock>

#### 脚本安装卸载方法

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh -d m1 -m deepx -c uninstall
```

</NewCodeBlock>
