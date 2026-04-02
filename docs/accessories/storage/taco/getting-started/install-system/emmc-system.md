---
sidebar_position: 5
---

import IMAGER_INSTALL_SYSTEM from '../../../../../common/raspberry-pi/\_imager-install-system.mdx';

# 安装系统到 eMMC

介绍如何通过 Taco 将系统安装到树莓派 CM5 的 eMMC 中。

## 前提条件

- 树莓派 CM5（板载 eMMC）
- 瑞莎 Taco
- 主机电脑（Linux 或 macOS）
- USB-A 转 USB-C 数据线

说明：Linux 推荐 Debian 或 Ubuntu。

## RPIBOOT

RPIBOOT 是树莓派官方提供的 USB 引导与设备烧录工具，可通过 USB 将系统镜像部署到目标设备的存储介质中，无需依赖 SD 卡完成系统烧录或更新。

## 安装 RPIBOOT

<Tabs queryString="Platform">

<TabItem value="Debian/Ubuntu">

- 安装依赖

在终端上使用以下命令安装编译 RPIBOOT 所需要的工具。

<NewCodeBlock tip="Debian/Ubuntu$" type="host">

```
sudo apt update
sudo apt install git libusb-1.0-0-dev pkg-config build-essential -y
```

</NewCodeBlock>

- 拉取 / 编译

在终端上使用命令拉取和编译 `usbboot` 源码

<NewCodeBlock tip="Debian/Ubuntu$" type="host">

```
git clone --recurse-submodules --shallow-submodules --depth=1 https://github.com/raspberrypi/usbboot
cd usbboot
sudo make install
```

</NewCodeBlock>

</TabItem>

<TabItem value="macOS">

<NewCodeBlock tip="macOS$" type="host">

```
git clone --recurse-submodules --shallow-submodules --depth=1 https://github.com/raspberrypi/usbboot
cd usbboot
sudo make install
```

</NewCodeBlock>

</TabItem>

</Tabs>

## RPIBOOT 模式

当目标设备进入 USB 引导模式后，主机可通过 USB 识别并访问目标存储，从而将系统镜像写入板载 eMMC。

进入 RPIBOOT 模式步骤：

1. 按住 Taco 上的 RPIBOOT 按钮。
2. 使用数据线连接到主机，USB-C 接口连接到 Taco，USB-A 接口连接到主机。
3. 松开 RPIBOOT 按钮。

:::tip RPIBOOT 模式

单独使用数据线连接 Taco 和主机，不要连接 SATA 硬盘或者功耗较大的外设，以免影响系统供电稳定。

若主板连接 SATA 硬盘或者功耗较大的外设，请按照下面步骤进入 RPIBOOT 模式：

1. 按住 Taco 上的 RPIBOOT 按钮。
2. 使用 12V 电源适配器为主板供电。
3. 松开 RPIBOOT 按钮。
4. 使用数据线连接到主机，USB-C 接口连接到 Taco，USB-A 接口连接到主机。

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/accessories/taco/enter-rpiboot-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用 RPIBOOT

<NewCodeBlock tip="PC (Debian/Ubuntu/macOS)" type="host">

```
sudo rpiboot -d mass-storage-gadget
```

</NewCodeBlock>

系统会自动识别到设备并开始引导过程，正常终端会出现类似以下信息：

```
RPIBOOT: build-date 2026/03/27 pkg-version local 101f2d00

Please fit the EMMC_DISABLE / nRPIBOOT jumper before connecting the power and USB cables to the target device.
If the device fails to connect then please see https://rpltd.co/rpiboot for debugging tips.

Loading: mass-storage-gadget/bootfiles.bin
Using mass-storage-gadget/bootfiles.bin
Waiting for BCM2835/6/7/2711/2712...

Sending bootcode.bin
Successful read 4 bytes
Waiting for BCM2835/6/7/2711/2712...

Second stage boot server
File read: mcb.bin
File read: memsys00.bin
File read: memsys01.bin
File read: rp1c0fw1.bin
File read: memsys02.bin
File read: rp1c0fw2.bin
File read: memsys03.bin
File read: bootmain
Loading: mass-storage-gadget/config.txt
File read: config.txt
Loading: mass-storage-gadget/boot.img
File read: boot.img
Second stage boot server done
```

系统会出现一个可移动设备，此时可以使用 Raspberry Pi Imager 安装系统镜像到树莓派 CM5 的 eMMC 中。

## 安装系统

<IMAGER_INSTALL_SYSTEM />
