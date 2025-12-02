---
sidebar_position: 4
description: "瑞莎 CM3J + WaveShare CM4-IO-BASE-B"
---

# 瑞莎 CM3J + WaveShare CM4-IO-BASE-B

## 准备

:::tip
若是第一次使用 WaveShare CM4-IO-BASE-B IO 板，请务必先阅读微雪 [CM4-IO-BASE-B](https://www.waveshare.net/wiki/CM4-IO-BASE-B) 官方使用文档。
:::

- 瑞莎 CM3J 核心板 + WaveShare CM4-IO-BASE-B

<Tabs queryString="model">
    <TabItem value="CM3J 核心板">
        <img src="/img/cm3j/cm3j-core-package.webp" alt="cm3j" style={{ width: "60%" }} />
    </TabItem>
    <TabItem value="WaveShare CM4-IO-BASE-B IO 板">
        <img src="/img/cm3j/waveshare-cm4-io-base-b.webp" alt="cm3j" style={{ width: "60%" }} />
    </TabItem>
</Tabs>

- 要启动瑞莎 CM3J + WaveShare CM4-IO-BASE-B IO 板, 还需要以下物品：

  - DC 5V/3A 适配器。
  - 一个 HDMI 线和一个支持 HDMI 的显示器，推荐分辨率为 1080P 或更高，4K 显示器将提供最佳体验。
  - 一套 USB 鼠标和键盘，常见的 USB 输入设备均支持即插即用。
  - 一根网线，更新系统时需要联网。

:::tip
电源适配器推荐使用官方的 [瑞莎 PD 30W 适配器](https://radxa.com/products/accessories/power-pd-30w)
:::

## 组装

<Tabs queryString="组装">

    <TabItem value="安装核心板">

    首先将核心板上的四个固定孔和底板上的**四个固定孔对齐**，然后先**轻轻按压一边**到差不多一半的深度，然后再按压另外的边到一半，确认好槽位都对齐后，再依次按压边到底部。

    注意: ***按压的时候，不要用力按压中部悬空区域，则PCB产生应力导致器件松动或者损坏，比如 DDR 松动，电阻断裂等。***

    ![注意事项](/img/cm3j/install-core-board-on-cm4-io-base-b.webp)

    </TabItem>

     <TabItem value="卸载核心板">
    使用一些类似下面的工具，从如图所示的两个角依次撬开，不要用手或者工具从中间及单边强制掰开。

    ![卸载核心板](/img/cm3j/uninstall-core-board-on-cm4-io-base-b.webp)
    </TabItem>

</Tabs>

## 选择启动方式

请根据您的需要参考[安装系统](../install-os/) 部分来选择您的启动系统的方式。

## 接线和上电

1. 插入烧录完操作系统后(这里以 SD 卡启动为例)。

<img src="/img/cm3j/cm4-io-base-b-sdcard.webp" width="500" alt="cm3j sdcard" />

2. 通过 HDMI 线将 WaveShare CM4-IO-BASE-B IO Board 的 HDMI0 输出接口连接到 HDMI 显示器。

<img src="/img/cm3j/cm4-io-base-b-hdmi-wire.webp" width="500" alt="cm3j hdmi" />

3. 将 USB 鼠标和键盘连接到 WaveShare CM4-IO-BASE-B IO Board 的任一 USB 2.0 接口。

<img src="/img/cm3j/cm4-io-base-b-usb-wire.webp" width="500" alt="cm3j usb" />

4. 将网线连接到以太网口。

<img src="/img/cm3j/cm4-io-base-b-ethernet-wire.webp" width="500" alt="cm3j ethernet" />

5. 将电源适配器插入 WaveShare CM4-IO-BASE-B IO Board 的电源接口。设备上电启动，核心板绿色电源指示灯将亮起。

<img src="/img/cm3j/cm4-io-base-b-pwr-wire.webp" width="500" alt="cm3j pwr" />

:::tip

系统从上电到开机启动，整个过程持续约 40 秒，系统成功启动后核心板绿色指示灯会由常亮状态变为闪烁状态。

:::

## 登录系统

系统启动后，HDMI 显示桌面。

<img src="/img/cm3j/cm3j-login.webp" alt="cm3j login" style={{ width: "60%"}} />

使用 radxa 账号登录，密码为 radxa。
