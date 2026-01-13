---
sidebar_position: 5
---

# 使用瑞莎预编译 BIOS 固件

使用预编译的瑞莎 BIOS 固件相比于重新编译和烧录瑞莎 BIOS 固件，更加方便快捷，避免编译和烧录固件的复杂操作。

## 硬件配置

推荐在 Ubuntu 22.04 的主机上进行系统的安装，若是使用虚拟机运行 Ubuntu 22.04，请确保烧录 BIOS 固件的过程中主板连接到虚拟机。

- Ubuntu 22.04

## 硬件连接

1. 使用跳线帽或杜邦线将 FC REC 和 GND 引脚短接
2. 使用主板电源适配器给瑞莎 C200 Orin 开发套件供电
3. 使用 USB Type-c 数据线连接主板和电脑

:::tip Recovery 模式

进入 Recovery 模式只需要在开机过程中检测到 FC REC 引脚连接到 GND 即可，烧录系统过程中可拔掉跳线帽或者杜邦线。

:::

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/hardware-connection-edk2.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 下载并解压源码

下载英伟达 L4T 源码。

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```
wget https://developer.download.nvidia.com/embedded/L4T/r36_Release_v4.3/release/Jetson_Linux_R36.4.3_aarch64.tbz2 -O Jetson_Linux_aarch64.tbz2
tar -xf Jetson_Linux_aarch64.tbz2
```

</NewCodeBlock>

## 下载预编译固件

下载瑞莎预编译的 BIOS 固件到指定目录。

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```
cd Linux_for_Tegra
# For Radxa C200 Orin Developer Kit:
wget https://github.com/radxa/c200-bootupd/releases/latest/download/uefi_jetson_c200.bin -O bootloader/uefi_jetson.bin
```

</NewCodeBlock>

## 烧录 BIOS 固件

使用英伟达提供的烧录脚本烧录 BIOS 固件。

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```
sudo ./flash.sh p3768-0000-p3767-0000-a0-qspi internal
```

</NewCodeBlock>

烧录成功后，检查短接 FC REC 引脚和 GND 引脚的跳线帽或者杜邦线是否拔掉，避免下次启动直接进入 Recovery 模式。
