---
sidebar_position: 10
---

# 编译 / 烧录瑞莎 BIOS 固件

烧录我们提供的 BIOS 固件，支持从 U 盘或 NVMe 固态硬盘启动系统。

若您使用 SDK Manager 或命令行安装过系统，将会擦除瑞莎 C200 Orin 开发套件的预装 BIOS 固件，无法通过 U 盘启动系统，可以通过以下方式重新烧录瑞莎 BIOS 固件。

## 环境搭建

### 硬件配置

推荐在 Ubuntu 22.04 的主机上进行系统的安装，若是使用虚拟机运行 Ubuntu 22.04，请确保烧录 BIOS 固件的过程中主板连接到虚拟机。

- Ubuntu 22.04

### 安装 Docker

运行以下命令安装 Docker 和设置权限：

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```bash
sudo apt update
sudo apt install docker.io
sudo usermod -a -G docker ${USER}
newgrp docker
```

</NewCodeBlock>

完成以上操作后，重新打开新的终端，输入 `docker --version` 命令，如果显示 Docker 版本信息，说明 Docker 安装成功。

## 编译瑞莎 BIOS 固件

### 安装依赖

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```bash
sudo apt install make gcc device-tree-compiler build-essential flex bison libssl-dev -y
```

</NewCodeBlock>

### 拉取源码

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```bash
git clone https://github.com/radxa/c200-bootupd.git
```

</NewCodeBlock>

### 编译源码

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```bash
cd c200-bootupd
DTC=/usr/bin/dtc make build
```

</NewCodeBlock>

编译成功后，终端会出现 `DTBs compiled successfully.` 的提示信息。

### 硬件连接

1. 使用跳线帽或杜邦线将 FC REC 和 GND 引脚短接
2. 使用主板电源适配器给瑞莎 C200 Orin 开发套件供电
3. 使用 USB Type-c 数据线连接主板和电脑

:::tip Recovery 模式

进入 Recovery 模式只需要在开机过程中检测到 FC REC 引脚连接到 GND 即可，烧录系统过程中可拔掉跳线帽或者杜邦线。

FC REC 引脚和 GND 引脚位置可以参考 [GPIO 接口文档](../../c200-orin/hardware-use/pin-gpio.md#其它-gpio-接口)

:::

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/hardware-connection-edk2.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 烧录固件

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```bash
make flash_spi
```

</NewCodeBlock>

烧录成功后，终端会出现 `The target generic has been flashed successfully.` 的提示信息。

:::tip 注意事项

检查短接 FC REC 引脚和 GND 引脚的跳线帽或者杜邦线是否拔掉，避免下次启动直接进入 Recovery 模式。

:::
