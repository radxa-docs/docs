---
sidebar_position: 1
---

# 硬件接口

主要介绍 Cubie A7Z 的硬件接口信息。

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7z/block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7z/a7z-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                            | 序号 | 说明                 | 序号 | 说明              |
| ---- | ------------------------------- | ---- | -------------------- | ---- | ----------------- |
| ①    | USB-C 2.0 OTG & Power 接口      | ⑥    | 天线接口             | ⑪    | PCIe 3.0 FPC 接口 |
| ②    | USB-C 3.1 OTG & DP Alt 模式接口 | ⑦    | WiFi 6 / BT5 模组    | ⑫    | 40-Pin GPIO 接口  |
| ③    | Allwinner A733                  | ⑧    | 4-lane MIPI CSI 接口 | ⑬    | LPDDR4/4x RAM     |
| ④    | Micro HDMI 接口                 | ⑨    | 板载 UFS             | ⑭    | MicroSD 卡槽      |
| ⑤    | FAN 接口                        | ⑩    | UBOOT 按键           |      |                   |

- 电源指示灯

若 Cubie A7Z 供电正常，电源指示灯将显示为绿色。

- LPDDR4/4x

LPDDR4/4x 可选：1GB / 2GB / 4GB / 8GB / 16GB

- 板载 UFS

板载 UFS 模块最高可选 1TB 存储空间。
