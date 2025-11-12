---
sidebar_position: 4
---

# DXRT-NPU-Driver 驱动

**DXRT-NPU-Driver** 是瑞莎智核 DX-M1 的驱动软件，用户需在安装了智核 DX-M1 的 host (主机) 上安装此驱动软件。

## 安装方法

### 检查硬件连接状态

请参考 [硬件安装](../hardware_install) 安装智核 DX-M1

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
DXRT-NPU-Driver 驱动安装有两种安装方法，可以使用

- 脚本安装

- Makefile 编译
  :::

- 脚本安装

    <NewCodeBlock tip="Host" type="device">

  ```bash
  ./build.sh -d m1 -m deepx
  sudo ./build.sh -d m1 -m deepx -c install
  ```

    </NewCodeBlock>

- Makefile 编译

  编译 dx-npu-driver

    <NewCodeBlock tip="Host" type="device">

  ```bash
  make DEVICE=m1 PCIE=deepx
  sudo make DEVICE=m1 PCIE=deepx install
  ```

    </NewCodeBlock>

  配置开机自动加载驱动

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

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-runtime/dx_rt_npu_linux_driver/modules
sudo ./build.sh -d m1 -m deepx -c uninstall
```

</NewCodeBlock>
