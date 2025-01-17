---
sidebar_position: 2
description: "瑞莎 CM3J + 树莓派 Compute Module 4 IO Board"
---

import InstallCoreBoard from "../../../\_install_uninstall_coreboard_on_rpi-cm4-io_guide.mdx";

# 瑞莎 CM3J + 树莓派 Compute Module 4 IO Board

## 准备

- 瑞莎 CM3J 核心板 + 树莓派 Compute Module 4 IO 底板

<Tabs queryString="model">
    <TabItem value="CM3J 核心板">
        <img src="/img/cm3j/cm3j-core-package.webp" alt="cm3j" style={{ width: "60%" }} />
    </TabItem>
    <TabItem value="树莓派 Compute Module 4 IO 板">
        <img src="/img/cm3j/rpi-cm4-io-package.webp" alt="cm3j" style={{ width: "60%" }} />
    </TabItem>
</Tabs>

- 要启动瑞莎 CM3J + 树莓派 Compute Module 4 IO Board, 还需要以下物品：

  - DC 12V/3A 适配器。
  - 一个 HDMI 线和一个支持 HDMI 的显示器，推荐分辨率为 1080P 或更高，4K 显示器将提供最佳体验。
  - 一套 USB 鼠标和键盘，常见的 USB 输入设备均支持即插即用。
  - 一根网线，更新系统时需要联网。

:::tip
电源适配器推荐使用官方的 [Power DC12 36W](https://radxa.com/products/accessories/power-dc12-36w)
:::

## 组装

<InstallCoreBoard />

## 选择启动方式

请根据您的需要参考[安装系统](../install-os/) 部分来选择您的启动系统的方式。

## 接线和上电

1. 插入烧录完操作系统后的 SD 卡(这里以 SD 卡启动为例)。

<img src="/img/cm3j/cm3j-sdcard.webp" width="500" alt="cm3j sdcard" />

2. 通过 HDMI 线将树莓派 Compute Module 4 IO Board 的 HDMI0 输出接口连接到 HDMI 显示器。

<img src="/img/cm3j/cm3j-hdmi-wire.webp" width="500" alt="cm3j hdmi" />

3. 将 USB 鼠标和键盘连接到树莓派 Compute Module 4 IO Board 的任一 USB 2.0 接口。

<img src="/img/cm3j/cm3j-usb-wire.webp" width="500" alt="cm3j usb" />

4. 将网线连接到以太网口。

<img src="/img/cm3j/cm3j-ethernet-wire.webp" width="500" alt="cm3j ethernet" />

5. 将电源适配器插入树莓派 Compute Module 4 IO Board 的电源接口。设备上电启动，核心板绿色电源指示灯将亮起。

<img src="/img/cm3j/cm3j-pwr-wire.webp" width="500" alt="cm3j pwr" />

:::tip

系统从上电到开机启动，整个过程持续约 40 秒，系统成功启动后核心板绿色指示灯会由常亮状态变为闪烁状态。

:::

## 登录系统

系统启动后，HDMI 显示桌面。

<img src="/img/cm3j/cm3j-login.webp" alt="cm3j login" style={{ width: "60%"}} />

使用 radxa 账号登录，密码为 radxa。
