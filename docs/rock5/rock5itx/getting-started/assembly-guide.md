---
sidebar_position: 7
---

# 装机指南

## 材料

- 机箱
- 螺丝刀 x1, 螺丝若干
- 鼠标键盘
- 显示器
- ROCK 5 ITX 主板
- [瑞莎 8418B 散热器](./interface-usage/fan)
- PCIe M Key SSD
- [瑞莎 WIFI-BT 模块](./interface-usage/pcie-e-key#wifi--bt-支持模块列表)
- SATA 硬盘 x 4

## 图文教程

### 安装 RTC 电池

将 RTC 电池放入到[接口说明](../getting-started/introduction#主板概览)中标号 23 中。

<img src="/img/rock5itx/rock5itx-rtc.webp" width="700" alt="rock 5 itx rtc" />

### 安装散热风扇

- 首先，将导热硅脂均匀地涂抹在SoC RK3588上，随后将散热器对准其上的四个孔位进行安装，具体步骤可参考图示说明。

**请注意风扇接口，有防反设计**

<img src="/img/accessories/heatsink_8418b_01.webp" alt="Heatsink 8418B" style={{width: "80%" }} />

- 接下来，将扣具精准地对准ROCK 5 ITX主板背面的四个孔位，确保安装无误。

<img src="/img/accessories/heatsink_8418b_02.webp" alt="Heatsink 8418B 2" style={{width: "80%" }} />

<img src="/img/accessories/heatsink_8418b_03.webp" alt="Heatsink 8418B 3" style={{width: "80%" }} />

- 最后，请按照**对角线的顺序拧紧螺丝**以固定散热器，这样可以有效防止在固定过程中损坏ROCK 5 ITX主板。

### 安装 SSD 和 WIFI-BT 模块

将 SSD 插入[接口说明](../getting-started/introduction#主板概览)中标号 26 中，然后将 WIFI-BT 模块插入到[接口说明](../getting-started/introduction#主板概览)中标号 27 中，最后用螺丝固定。

<img src="/img/rock5itx/rock5itx-fan-wifi-pcie.webp" width="700" alt="rock 5 itx ssd/wifi-bt" />

### 安装 SATA 硬盘

如果主板带有 SATA 接口，则请按以下方式接线。

以下图片中偏上的那条为数据线，将该数据线插入[接口说明](../getting-started/introduction#主板概览)中标号 20 中的其中一个。

<img src="/img/rock5itx/rock5itx-sata_1.webp" width="700" alt="rock 5 itx sata_1 " />

如果机箱中有 SATA 电源线的话，只需要将 SATA 电源线插入到 SATA 盘中即可，[接口说明](../getting-started/introduction#主板概览)中标号 21 则空着。

<img src="/img/rock5itx/rock5itx-sata-3.webp" width="700" alt="rock 5 itx sata_2 " />

### 安装 F_PANEL 排线

将 F_PANEL 插入[接口说明](../getting-started/introduction#主板概览)中标号 8 中。

<img src="/img/rock5itx/rock5itx-pwr-led.webp" width="700" alt="rock 5 itx pwr led" />
<img src="/img/rock5itx/rock5itx-pwr-sw.webp" width="700" alt="pwr sw" />
<img src="/img/rock5itx/rock5itx-hdd-led.webp" width="700" alt="hdd led" />
<img src="/img/rock5itx/rock5itx-reset-sw.webp" width="700" alt="reset sw" />

### 安装 F_USB 排线

将 F_USB 排线插入[接口说明](../getting-started/introduction#主板概览)中标号 6 中。

<img src="/img/rock5itx/rock5itx-f-usb.webp" width="700" alt="rock 5 itx f_usb " />

### 安装 F_AUDIO 排线

将 F_AUDIO 插入[接口说明](../getting-started/introduction#主板概览)中标号 7 中。

<img src="/img/rock5itx/rock5itx-f-audio.webp" width="700" alt="rock 5 itx f_audio " />

### 安装 ATX Power

将 ATX 电源排线按照下图插入 ATX POWER 线槽内

<img src="/img/rock5itx/rock5itx-atx-power.webp" width="700" alt="rock 5 itx atx power" />

### 固定主板

将主板固定在机箱底部。

<img src="/img/rock5itx/rock5itx-fixed_to_the_chassis.webp" width="700" alt="rock 5 itx fixed to the chassis" />
<img src="/img/rock5itx/rock5itx-connector_exposure.webp" width="700" alt="rock 5 itx connector exposure" />
