---
sidebar_position: 10
---

# FAQ

## Q1： 联系社区

请参考 https://docs.radxa.com/welcome

## Q2： ROCK 5B 将支持 WiFi 6E。新的 ROCK 5B 板是否自带 (6E) WIFI 芯片？还是需要单独购买？

由于不同用户对 WiFi 网速的要求不同，因此默认情况下不包括 WiFi 网卡。Radxa 团队推荐使用 RTL8852BE 芯片的 WIFI 网卡，以实现价格和性能之间的平衡。

## Q3： 没有 eMMC 和 TF 卡，ROCK 5B 能否从 PCIe M.2 NVME 固态硬盘启动？

是的。ROCK 5B 可以从 PCIe M.2 NVME 固态硬盘启动。
ROCK 5B 配备了一个 16MB 的 SPI Nor Flash 和 PCIe M.2 M-Key 接口。
SPI Nor Flash 存储引导程序。NVME 固态硬盘存储整个系统映像（至少包括内核和 rootfs）。
有关映像写入，请参阅本指南。[SPI Nor Flash](./getting-started/install-os/erase_spi-flash) 和 [PCIe NVME SSD](./getting-started/install-os/nvme) 启动。

## Q4： 另外，价格中是否包含散热片和风扇？

不，默认情况下不包括散热片和风扇。

## Q5：我的新 ROCK 5B 无法启动/卡在无限启动循环中

ROCK 5B 支持将 USB PD 电源协商至更高的电压，如 9V、12V、15V、20V，以满足系统总功率负载要求（带 WiFi、SSD、USB 外围设备等时约为 30W）。目前，PD 协商是在内核驱动程序中实现的，我们需要启动到内核才能开始协商，但有些电源无法等待 ROCK 5B 协商并在超时时切断电源，从而导致无限启动循环。我们提供以下建议：

- 使用官方电源 - Radxa Power PD 30W。（强烈推荐）Radxa Power PD 30W 已通过 ROCK 5B 的所有条件测试。
- 使用速度更快的 SD 卡或 eMMC 模块，并禁用引导加载程序/内核串行控制台
- 使用假的 12V USB C 电源
- 检查社区报告的其他电源状态。
- 等待 Radxa 将 PD 协商移植到引导加载程序（u-boot）。
- 仔细检查您的电源是否能提供所需的功率，尤其是 5V 电压。许多电源的最大 5V 电压为 3 安培（15W），而其他电压的最大 5V 电压可能更高。

## Q6： 我的 ROCK 5B 无法启动，如何检查是否坏了

按以下步骤排除 ROCK 5B 故障：

- 关闭 ROCK 5B 电源，取出 eMMC 模块、SD 卡、NVMe SSD
- 按住 MASKROOM 按钮 [（标签 32）](./hardware-design/hardware-interface)
- 使用 USB A to C 电缆将 ROCK 5B USB C 接口插入电脑，绿色 LED 灯应亮起
- 检查电脑 "设备管理器 "中是否有新的 USB 设备，如果有，说明 ROCK 5B 已激活。如果没有，请尝试其他 USB 端口，我们建议将 ROCK 5B 连接到电脑的后面板。

## Q7： 我的 ROCK 5B HDMI 不能显示任何内容

- 您可以在 /boot/extlinux/extlinux.conf 中手动添加 HDMI 分辨率和帧速率
- 只需在附加行中添加 video=1920x1080@60（只需将分辨率和帧频改为显示器支持的分辨率即可）

## Q8： 我通过 RKDevTool 工具烧录 eMMC 成功了，但是上电之后，Led 不闪，屏幕无输出

原因确认:

去掉 eMMC Module, MicroSD 及 NVME 设备，然后通过 USB 线连接板子和PC，此时看设备是否进入 [Maskrom 状态](./low-level-dev/maskrom/)，
如果不是MaskRom状态，则大概率是下面的原因:

**在 [通过 USB 烧录系统到eMMC](./low-level-dev/maskrom/) 的时候没有按照说明 按 Maskrom 按键，导致烧录系统到了 [SPI Flash](./low-level-dev/maskrom/)中, 而系统启动的时候，先读取SPI的信息，此时出现错误，无法正常启动。**

解决办法：

[清空 SPI Flash](./low-level-dev/maskrom/), 然后重新按步骤 [通过USB烧录系统到eMMC](./low-level-dev/maskrom/)

## Q9： Radxa APT 公钥不可用

当我尝试运行 apt update 时，得到以下错误信息：

```
root@rock-5b:~# apt update
Hit:1 http://security.debian.org/debian-security bullseye-security InRelease
Hit:2 http://httpredir.debian.org/debian bullseye InRelease
Get:3 http://apt.radxa.com/bullseye-stable bullseye InRelease [2362 B]
Hit:4 http://httpredir.debian.org/debian bullseye-updates InRelease
Hit:5 http://httpredir.debian.org/debian bullseye-backports InRelease
Err:3 http://apt.radxa.com/bullseye-stable bullseye InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 9B98116C9AA302C7
Reading package lists... Done
W: GPG error: http://apt.radxa.com/bullseye-stable bullseye InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 9B98116C9AA302C7
E: The repository 'http://apt.radxa.com/bullseye-stable bullseye InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```

原因是公钥已过期。您可以执行以下命令获取新的可用密钥。

```
sudo apt-get install -y wget
export DISTRO=bullseye-stable
wget -O - apt.radxa.com/$DISTRO/public.key | sudo apt-key add -
sudo apt-get update
```

## Q10： 风扇不转动/风扇如何安装

请按照[风扇使用教程](./getting-started/interface-usage/fan)。

## Q11： ROCK 5B，可以用 M.2 WIFI 转 nvme 转接板转接了一块 2230 的固态硬盘作为系统盘吗？

做系统盘不行，可以做存储的
