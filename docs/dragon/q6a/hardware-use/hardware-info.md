---
sidebar_position: 1
---

# 硬件信息

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_block_diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                   | 序号 | 说明                                                             | 序号 | 说明            |
| :--: | :--------------------- | :--: | :--------------------------------------------------------------- | :--: | :-------------- |
|  1   | 高通 QCS6490           |  2   | [40-Pin GPIO 接口](./pin-gpio)                                   |  3   | [M.2 M Key 插槽](./nvme)  |
|  4   | [WiFi 6 / BT 5.4](./ante) |  5   | [天线接口](./ante)                                               |  6   | [电源按键](./power)        |
|  7   | 用户指示灯             |  8   | 电源指示灯                                                       |  9   | [Type-C 供电接口](./power-header) |
|  10  | [电源输入接口](./power-header) |  11  | [MIPI CSI（4 通道）](./mipi-csi)                                 |  12  | [microSD 卡槽](./microsd)    |
|  13  | [MIPI DSI（4 通道）](./mipi-dsi) |  14  | [PoE 接口](./eth-poe)                                            |  15  | [千兆以太网](./eth-poe)      |
|  16  | QSPI Nor Flash         |  17  | [USB 接口](./usb)<br/>USB 2.0 Type-A（上层）/ USB 3.1 OTG Type-A（下层） |  18  | LPDDR5 内存     |
|  19  | [2x USB 2.0 Type-A 接口](./usb) |  20  | [EDL 按键](./edl)                                                |  21  | [耳机插孔](./headphone)        |
|  22  | [标准 HDMI](./hdmi)    |  23  | [eMMC & UFS 模块二合一接口](./ufs-emmc-com)                      |  24  | [RTC 电池接口](./rtc)    |
|  25  | [2x MIPI CSI（2 通道）](./mipi-csi) |      |                                                                  |      |                 |

### 电源输入接口引脚定义

序号 10 为 12V 外部电源输入接口，为 2-Pin 排针，引脚定义如下：

| 引脚 | 定义 |
| :--: | :--: |
|  1   | 12V |
|  2   | GND |

:::danger
请勿接错或者接反电源，不当操作可能导致设备硬件损坏。
:::
