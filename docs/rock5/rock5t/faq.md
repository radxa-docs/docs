---
sidebar_position: 10
---

# FAQ

## Q1： 联系社区

请参考 https://docs.radxa.com/welcome

## Q2： TF 卡，ROCK 5T 能否从 PCIe M.2 NVME 固态硬盘启动？

是的。ROCK 5T 可以从 PCIe M.2 NVME 固态硬盘启动。
ROCK 5T 配备了一个 16MB 的 SPI Nor Flash 和 PCIe M.2 M-Key 接口。
SPI Nor Flash 存储引导程序。NVME 固态硬盘存储整个系统镜像（至少包括内核和 rootfs）。
有关镜像写入，请参阅本指南。[SPI Nor Flash](./getting-started/install-os/erase-spi-flash) 和 [PCIe NVME SSD](./getting-started/install-os/nvme) 启动。

## Q3： 另外，价格中是否包含散热片和风扇？

不，默认情况下不包括散热片和风扇。

## Q4： 我的 ROCK 5T 无法启动，如何检查是否坏了

按以下步骤排除 ROCK 5T 故障：

- 关闭 ROCK 5T 电源，SD 卡、NVMe SSD
- 按住 MASKROOM 按钮 [（标签 32）](./hardware-design/hardware-interface)
- 使用 USB A to C 电缆将 ROCK 5T USB C 接口插入电脑然后接上 DC 12V 适配器，绿色 LED 灯应亮起
- 检查电脑 "设备管理器 "中是否有新的 USB 设备，如果有，说明 ROCK 5T 已激活。如果没有，请尝试其他 USB 端口，我们建议将 ROCK 5T 连接到电脑的后面板。

:::note 供电说明
ROCK 5T 由 DC 12V 适配器（或 PoE）供电，板上的 USB Type-C 接口仅用于 OTG/数据/进入 Maskrom 模式，不会为板子供电。因此在排查能否启动时，需要先确保 DC 12V 适配器已经接入。
:::

## Q6： 我的 ROCK 5T HDMI 不能显示任何内容

- 您可以在 /boot/extlinux/extlinux.conf 中手动添加 HDMI 分辨率和帧速率
- 只需在附加行中添加 video=1920x1080@60（只需将分辨率和帧频改为显示器支持的分辨率即可）

## Q7： 我通过 RKDevTool 工具烧录 eMMC 成功了，但是上电之后，Led 不闪，屏幕无输出

原因确认:

去掉 microSD 及 NVME 设备，短接 DISABLE SPI 并按住 Maskrom 按键上电，然后通过 USB 线连接板子和PC，此时看设备是否进入 [Maskrom 状态](./low-level-dev/maskrom/)，
如果不是MaskRom状态，则大概率是下面的原因:

在 [通过 USB 烧录系统到eMMC](./low-level-dev/maskrom/) 的时候没有按照说明 按 Maskrom 按键，导致烧录系统到了 [SPI Flash](./low-level-dev/maskrom/erase)中, 而系统启动的时候，先读取SPI的信息，此时出现错误，无法正常启动。

解决办法：

[清空 SPI Flash](./low-level-dev/maskrom/erase), 然后重新按步骤 [通过USB烧录系统到eMMC](./low-level-dev/maskrom/)

## Q8： Radxa APT 公钥不可用

当我尝试运行 apt update 时，得到以下错误信息：

```text
root@rock-5T:~# apt update
Hit:1 http://security.debian.org/debian-security bookworm-security InRelease
Hit:2 http://httpredir.debian.org/debian bookworm InRelease
Get:3 http://apt.radxa.com/bookworm-stable bookworm InRelease [2362 B]
Hit:4 http://httpredir.debian.org/debian bookworm-updates InRelease
Hit:5 http://httpredir.debian.org/debian bookworm-backports InRelease
Err:3 http://apt.radxa.com/bookworm-stable bookworm InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 9B98116C9AA302C7
Reading package lists... Done
W: GPG error: http://apt.radxa.com/bookworm-stable bookworm InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 9B98116C9AA302C7
E: The repository 'http://apt.radxa.com/bookworm-stable bookworm InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```

原因是公钥已过期。您可以执行以下命令获取新的可用密钥。

```bash
sudo apt-get install -y wget
export DISTRO=bookworm-stable
wget -O - apt.radxa.com/$DISTRO/public.key | sudo apt-key add -
sudo apt-get update
```

## Q9： 风扇不转动/风扇如何安装

请按照[风扇使用教程](./getting-started/interface-usage/fan)。
