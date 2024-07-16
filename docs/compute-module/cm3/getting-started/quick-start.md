---
sidebar_position: 2
---

# 快速上手

## 包装清单

<Tabs queryString="versions">
    <TabItem value="Radxa CM3 核心板">
        <img src="/img/cm3/cm3-package.webp" alt="Radxa CM3 核心板" style={{ width: "80%" }} />
    </TabItem>
    <TabItem value="Radxa CM3 IO Board">
        <img src="/img/cm3/cm3-io-package.webp" alt="Radxa CM3 IO Board" style={{ width: "80%" }} />
    </TabItem>
</Tabs>

<Tabs queryString="versions">
    <TabItem value="Radxa CM3 核心板">
        Radxa CM3 标准包装包括以下物品：
            - Radxa CM3 核心板
    </TabItem>
    <TabItem value="Radxa CM3 IO Board">
        Radxa CM3 IO Board 标准包装包括以下物品：
            - Radxa CM3 IO Board
    </TabItem>
</Tabs>

要启动 Radxa CM3 IO Board，您还需要一下设备：

- 一个充电器(推荐使用 DC 12V 充电器)。Radxa CM3 IO Board 还支持 PoE 供电。更过供电详情，请参考[电源方案](./power-supply)。
- 一个 HDMI 线和一个支持 HDMI 的显示器，推荐分辨率为 1080P 或更高，4K 显示器将提供最佳体验。
- 一套 USB 鼠标和键盘，常见的 USB 输入设备均支持即插即用。
- 一根网线，更新系统时需要联网。

非必需但可增强 Radxa CM3 IO Board 基本功能的外设：

- 散热器，参考[散热器选型](./interface-usage/fan)来安装散热器

## 安装操作系统

参考[安装系统](./install-os/) 部分安装操作系统。

## 接线和上电

1. 通过 HDMI 线将 Radxa CM3 IO Board 的任一 HDMI 输出接口连接到 HDMI 显示器。

<img src="/img/cm3/cm3-io-hdmi-connect.webp" alt="cm3 io board hdmi" style={{ width: "80%" }}  />

2. 将 USB 鼠标和键盘连接到 Radxa CM3 IO Board 的任一 USB 2.0 或 3.0 接口。

<img src="/img/cm3/cm3-io-usb.webp" alt="cm3 io board usb" style={{ width: "80%" }} />

3. 将网线连接到以太网口。

<img src="/img/cm3/cm3-io-ethernet-connect.webp" alt="cm3 io board ethernet" style={{ width: "80%" }}  />

4. 将电源适配器插入 Radxa CM3 IO Board 的电源接口。设备上电，电源指示灯显示绿色，启动正常后，指示灯开始闪烁。

<img src="/img/cm3/cm3-io-pwr.webp" alt="cm3 io board pwr"style={{ width: "80%" }} />

:::tip

系统从上电到开机启动，整个过程持续约 40 秒，然后进入系统桌面。

:::
