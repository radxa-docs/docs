---
sidebar_position: 2
title: 系统安装
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'
import EnterMaskromMode from '../../\_enter_maskrom_mode.mdx'

本文档将介绍如何把 Android 镜像安装到 ROCK 5B/5B+。

ROCK 5B/5B+ 可以从 microSD 卡启动，也可以从 EMMC 启动，还可以从 SSD 启动，基于不同的启动方式，安装系统到不同的介质上。

### 清除 SPI Flash

在使用 microSD 卡/ eMMC 启动时，如果SPI Flash 里面有数据，需要先清空 SPI Flash，参考 [清除 SPI Flash](../../low-level-dev/maskrom/erase.md)。

<details>

<summary>什么情况下 SPI Flash 会有数据</summary>

一般有两种情况下会有数据

1. 在 EMMC 和 SPI Flash 都是空的清空下， 通过 USB 接口刷写镜像到板载 EMMC,此时板子是 Maskrom 模式，如果此时**不去按 Maskrom 按键**直接烧录系统，就会将数据写入到 SPI FLASH 中
2. 主动烧录，例如需要从 nvme 启动系统，需要先烧录SPI Flash 镜像

</details>

## 安装操作系统

<Tabs queryString="target">

<TabItem value="microsd" label="安装系统到 microSD 卡">

#### 准备工作

- 1x microSD 卡(容量 >=8GB)
- 1x microSD 读卡器
- 5V 电源适配器 (推荐使用 [Radxa Power PD30W](/accessories/pd_30w))

#### 安装系统

<Etcher model="rock5b" />

#### 启动系统

- 按照上述步骤成功烧录 microSD 卡后，将 microSD 卡插入 Radxa ROCK 5B/5B+ 的 MicroSD 插槽内。
- Radxa ROCK 5B/5B+ 的供电接口为 [USB 2.0 OTG Type C port](/rock5/rock5b/hardware-design/hardware-interface)，请使用 Type-C 线缆连接供电口和适配器。

:::tip
ROCK 5B/5B+ 支持 9V/2A、12V/2A、15V/2A 和 20V/2A 的 USB Type-C PD 2.0。瑞莎推荐使用 [Radxa Power PD30W](/accessories/pd_30w)。
:::

#### 参考文档

</TabItem>

<TabItem value="emmc" label="安装系统到 eMMC ">

#### 准备工作

- usb A-C 线 x1
- x86 PC
- rock5b/5b+
- EMMC Module

#### 系统安装

<Tabs queryString="target">

<TabItem value="linux" label="Linux">

#### Linux 系统使用 rkdeveloptool 写入

[rkdeveloptool](../../low-level-dev/maskrom/linux)

</TabItem>

<TabItem value="mac" label="Mac">

#### Mac 系统使用 rkdeveloptool 写入

[rkdeveloptool](../../low-level-dev/maskrom/mac-os)

</TabItem>

<TabItem value="windows" label="Windows">

#### Windows 系统使用 rkdevtool 写入

[rkdevtool](/rock5/rock5b/low-level-dev/maskrom/windows)

</TabItem>

</Tabs>

#### 启动 ROCK 5B/5B+

1. 通过适配器为 ROCK 5B/5B+ 供电
2. ROCK 5B/5B+ 将在绿色电源 LED 亮起的情况下启动

</TabItem>

<TabItem value="ssd" label="安装系统到 Nvme">

#### 准备工作

- 1x NVME ssd （M.2 FAT32 格式）
- USB 接口线缆
- 电源

#### 镜像下载

请到 [资源下载中心](../../download.md) 下载对应的镜像文件

#### 系统安装

<Tabs queryString="target">

<TabItem value="linux" label="Linux(适用于 Rock5B)">

#### Linux 系统使用 rkdeveloptool 写入

[rkdeveloptool](../../low-level-dev/maskrom/linux.md)

</TabItem>

<TabItem value="mac" label="mac(适用于Rock 5B)">

#### Mac 系统使用 rkdeveloptool 写入

[rkdeveloptool](../../low-level-dev/maskrom/mac-os.md)

</TabItem>

<TabItem value="windows" label="Windows（适用于Rock 5B/5B+）">

##### 安装 RKDevTool

RKDevTool 是 Rockchip 为 Windows 平台下进行 USB 烧录所开发的软件。如果您的 Windows 主机上没有安装 RKDevTool， 请按照以下步骤进行安装。

请下载并解压以下文件以安装 RKDevTool：

- [RKDevTool v2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip) (含中文使用文档)
- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

##### 安装驱动

下载并解压 DriverAssistant，然后执行 DriverInstall.exe 并点击 `Install Driver` 按钮来安装驱动。
如果你之前已经安装过其他版本的驱动，请先点击 `Uninstall Driver` 卸载驱动，然后再重新安装。

![RK Driver](/img/configuration/RK-Driver-Assistant-Install-Uninstall.webp)

##### 安装 RKDevTool

解压 RKDevTool_Release_v2.96_zh.zip 后，点击 RKDevTool.exe 即可使用。

#### 进入 Maskrom 模式

<EnterMaskromMode/>

##### 按照以下操作烧入镜像

![RK Android update](/img/rock5itx/rock5itx_android_update_zh.webp)

</TabItem>

</Tabs>

#### 启动 ROCK 5B/5B+

1. 通过适配器为 ROCK 5B/5B+ 供电
2. ROCK 5B/5B+ 将在绿色电源 LED 亮起的情况下启动

</TabItem>
</Tabs>

:::tip
Android 系统在刷机完成后的第一次启动时常相对较长，还请耐心等待
:::

## 常见问题

- SPI-NVME 安装系统时出现：切换 PCIE 存储失败，loader 不支持切换

  1. 检查 SSD 是否插入 Radxa SBC 对应的接口，ROCK 5B+ 仅有一个 M.2 接口支持 SPI-NVME 启动，启动失败可换接口尝试.
  2. 检查 SSD 格式是否为 FAT32 格式.
