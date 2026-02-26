---
sidebar_position: 2
---

import Images from "../../\_image.mdx"

# SD 卡启动做启动盘安装到 eMMC

### 文件下载

<Images loader={false} system_img={true} spi_img={false} />

第三方系统请参考[资源下载汇总](../../download)

### 制作启动盘

参考上文 [制作 MicroSD 启动盘](./etcher)，接下来我们以此为基础，将系统安装到 eMMC 中。

### 登录到系统

通过串口或者 HDMI 登录到系统。

:::tip
账号密码都为 radxa
:::

### 开启 Overlay

ROCK 5 ITX 的 eMMC 是默认关闭的，我们需要在系统中通过[设备树配置](../os-config/rsetup#overlays)来启用 eMMC。

:::tip

1. 请启用 `[] Enable EMMC` 项 Overlay。
2. 在启用成功显示 `[*] Enable EMMC` 后退出重启才能使配置生效。

:::

### 查看 eMMC 设备

打开终端，用命令 lsblk 查看 mmc 设备

```bash
radxa@rock-5-itx:~$ lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
mtdblock0     31:0    0   16M  0 disk
mmcblk1      179:0    0 29.3G  0 disk
|-mmcblk1p1  179:1    0   16M  0 part /config
|-mmcblk1p2  179:2    0  300M  0 part /boot/efi
`-mmcblk1p3  179:3    0   29G  0 part /
mmcblk0      179:32   0 29.1G  0 disk
|-mmcblk0p1  179:33   0    4M  0 part
|-mmcblk0p2  179:34   0    4M  0 part
|-mmcblk0p3  179:35   0    4M  0 part
|-mmcblk0p4  179:36   0    4M  0 part
|-mmcblk0p5  179:37   0    4M  0 part
|-mmcblk0p6  179:38   0    1M  0 part
|-mmcblk0p7  179:39   0   40M  0 part
|-mmcblk0p8  179:40   0  123M  0 part
|-mmcblk0p9  179:41   0  372M  0 part
|-mmcblk0p10 179:42   0  384M  0 part
|-mmcblk0p11 179:43   0   16M  0 part
|-mmcblk0p12 179:44   0    1M  0 part
|-mmcblk0p13 179:45   0  5.2G  0 part
`-mmcblk0p14 179:46   0   23G  0 part
mmcblk0boot0 179:64   0    4M  1 disk
mmcblk0boot1 179:96   0    4M  1 disk
zram0        254:0    0  3.9G  0 disk [SWAP]
```

eMMC 默认是 mmcblk0

### 安装系统到 eMMC

镜像文件详见 [文件下载](#文件下载)，下面以 rock-5-itx_debian_bullseye_kde_b3.img.xz 为例。

```bash
radxa@rock-5-itx:~$ sudo xzcat /home/radxa/rock-5-itx_debian_bullseye_kde_b3.img.xz | dd of=/dev/mmcblk0 bs=1M status=progress
```

### 启动系统

关闭系统后，断电，拔掉 Micro SD 卡，然后上电，系统从 eMMC 启动。
