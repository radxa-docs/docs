---
sidebar_position: 4
---

# DX-NPU-Driver 驱动

**DX-NPU-Driver** 是瑞莎智核 DX-M1 的驱动软件，用户需在安装了智核 DX-M1 的 host(主机) 上安装此驱动软件。

## 安装方法

### 检查硬件连接状态

请参考 [硬件安装](../hardware_install) 安装智核 DX-M1

<NewCodeBlock tip="Host" type="device">

```bash
lspci
```

</NewCodeBlock>

```bash
0000:01:00.0 Processing accelerators: DEEPX Co., Ltd. DX_M1A (rev 01)
```

某些系统上不打印名字，会输出以下信息

```bash
0b:00.0 1200: 1ff4:0000
```

### 下载安装包

请在 DX-M1 SDK [资源下载](../download.md)页面下载 DX-NPU-Driver 安装包并解压

<NewCodeBlock tip="Host" type="device">

```bash
tar -xvf dx_rt_npu_linux_driver_v1.3.1.tar.gz && cd dx_rt_npu_linux_driver
```

</NewCodeBlock>

### 安装驱动

安装系统依赖

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt install git gcc g++ cmake ninja-build python3-dev python3-venv kmod
```

</NewCodeBlock>

安装 dx-npu-driver

<NewCodeBlock tip="Host" type="device">

```bash
./build.sh
sudo ./build.sh -c install
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
dx_dma                462848  7 dxrt_driver
```
