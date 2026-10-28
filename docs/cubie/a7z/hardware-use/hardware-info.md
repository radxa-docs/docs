---
sidebar_position: 1
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# 硬件接口

主要介绍 Cubie A7Z 的硬件接口信息。

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7z/block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<Tabs queryString="a7z-revision">
<TabItem value="v1" label="V1.10 / V1.11" default>

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7z/a7z-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                            | 序号 | 说明                 | 序号 | 说明              |
| ---- | ------------------------------- | ---- | -------------------- | ---- | ----------------- |
| ①    | USB-C 2.0 OTG & Power 接口      | ⑥    | 天线接口             | ⑪    | PCIe 3.0 FPC 接口 |
| ②    | USB-C 3.1 OTG & DP Alt 模式接口 | ⑦    | WiFi 6 / BT5 模组    | ⑫    | 40-Pin GPIO 接口  |
| ③    | Allwinner A733                  | ⑧    | 4-lane MIPI CSI 接口 | ⑬    | LPDDR4/4x RAM     |
| ④    | Micro HDMI 接口                 | ⑨    | 板载 UFS             | ⑭    | microSD 卡槽      |
| ⑤    | FAN 接口                        | ⑩    | UBOOT 按键           |      |                   |

</TabItem>
<TabItem value="v2" label="V2.00">

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7z/a7z-interface-v2.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Cubie A7Z V2.00 接口标注图" />
</div>

| 序号 | 说明                            | 序号 | 说明                  | 序号 | 说明                 |
| ---- | ------------------------------- | ---- | --------------------- | ---- | -------------------- |
| ①    | USB-C 2.0 OTG & Power 接口      | ⑥    | 天线接口              | ⑪    | 4 通道 MIPI DSI      |
| ②    | USB-C 3.1 OTG & DP Alt 模式接口 | ⑦    | WiFi 6 / BT5 模组     | ⑫    | 2 个 4 通道 MIPI CSI |
| ③    | Allwinner A733                  | ⑧    | FPC 接口 (PCIe Gen 3) | ⑬    | 40-Pin GPIO 排针     |
| ④    | Micro HDMI 接口                 | ⑨    | 板载 UFS              | ⑭    | LPDDR4/4x 内存       |
| ⑤    | FAN 接口                        | ⑩    | USB BOOT 按键         | ⑮    | microSD 卡槽         |

</TabItem>
</Tabs>

- 电源指示灯

若 Cubie A7Z 供电正常，电源指示灯将显示为绿色。

- LPDDR4/4x

LPDDR4/4x 可选：1GB / 2GB / 4GB / 8GB / 16GB

- 板载 UFS

板载 UFS 模块最高可选 1TB 存储空间。
