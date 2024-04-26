---
sidebar_position: 1
---

import Rkdeveloptool from "../../../common/dev/\_rkdeveloptool.mdx";
import RKDevTool from "../../../common/dev/\_rkdevtool.mdx"

# 安装系统到 EMMC

## 准备工作

- 1x USB 线 （一端 USB C，一端 USB A）
- 1x 12V DC 电源适配器

## 镜像下载

请到 [资源下载汇总](../getting-started/download) 下载对应的镜像文件

## 进入 Maskrom 模式

1. 拔出 microSD 卡和电源线
2. 按住 Maskrom 按钮
3. 通过 USB-A 转 USB-C 线连接PC 主机的 USB，如果如果PC端检测到有设备，则进入到 Maskrom 模式（Radxa ROCK 5 ITX 的 OTG 接口是 TYPE-C,可通过 USB-C 转 USB-A 线连接主机和进入 Maskrom 的主板进行通信）
   
<img src="/img/rock5itx/rock5itx-maskrom-new.webp" alt="maskrom new version" width="500" />

<Tabs queryString="maskrom">

<TabItem value="Windows">

如操作正常，RKDevTool 会提示 `发现一个MASKROM设备`：

   <img src="/img/configuration/rkdevtool-zh-maskrom.webp" alt="RKDevTool zh maskrom" />
</TabItem>

<TabItem value="Linux">

如操作正常， `rkdeveloptool ld`会提示 进入MASKROM模式：

```
PC:~$ sudo rkdeveloptool ld
DevNo=1	Vid=0x2207,Pid=0x350b,LocationID=109	Maskrom
```

</TabItem>

</Tabs>

在 Maskrom 模式下，您可使用 [rkdevtool](rkdevtool) 或 [upgrade-tool](upgrade-tool) 来对您的产品进行擦写、线刷等操作。

## 安装系统到 eMMC

<Tabs queryString="install-os-emmc-using-maskrom">

<TabItem value="Windows">

<RKDevTool />

</TabItem>

<TabItem value="Linux">

<Rkdeveloptool />

</TabItem>

</Tabs>

## 启动系统

- 使用12V DC 电源适配器上电，然后系统开始启动，HDMI显示桌面。

## 常见问题
