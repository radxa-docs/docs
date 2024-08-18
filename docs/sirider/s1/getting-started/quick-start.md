---
sidebar_position: 2
description: "快速上手SiRider S1，让您能够轻松开始使用和探索其功能。"
---

# 快速上手

## 包装清单

    <img src="/img/sirider/s1/sirider_s1_overview_1.webp" alt="sirider s1 overview" width="700" />
  
    SiRider S1 标准包装包括以下物品：
        - SiRider S1 主板
        - 散热风扇
 
要启动 SiRider，您还需要一下设备：

- 一个充电器(推荐使用支持12V的 PD 充电器), 更多方案请参考[电源方案](./power-supply)。
- 一个 HDMI 线和一个支持 HDMI 的显示器，推荐分辨率为 1080P 或更高。
- 一套 USB 鼠标和键盘，常见的 USB 输入设备均支持即插即用。
- 一根网线，更新系统时需要联网。

## 安装操作系统

SiRider S1 出厂默认自带 Ubuntu 系统, 如果想重新刷系统，请参考 [安装系统](./install-os/) 部分安装操作系统。

## 接线和上电

1. 通过 HDMI 线将 SiRider S1 的 HDMI 输出接口连接到 HDMI 显示器。

2. 将 USB 鼠标和键盘连接到 SiRider S1 的任一 USB 3.0 接口。

3. 将网线连接到以太网口。

4. 将电源适配器插入 SiRider S1 的电源接口。设备上电，然后短按Power 键一下，电源指示灯显示绿色，启动正常后，指示灯开始闪烁。

    <img src="/img/sirider/s1/sirider_s1_power_on.webp" alt="sirider s1 overview" width="700" />

## 系统登录

Ubuntu 系统默认用户名： root 对应的密码： root

如果使用串口登录，可以使用一条 USB-A 转 Type-C的线，Type-C 端接到 S1的 DEBUG 口，另一端 USB-A 接入到 PC 上，波特率为 115200

<img src="/img/sirider/s1/sirider_s1_power_on.webp" alt="sirider s1 overview" width="700" />

:::tip
系统从上电到开机启动，整个过程持续约 20 秒，然后进入系统桌面。
:::
