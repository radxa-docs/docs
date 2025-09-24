---
sidebar_position: 1
---

# 硬件接口

主要介绍主板的硬件接口信息。

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/block_diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/cubie_a5e_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                | 序号 | 说明                   | 序号 | 说明                       |
| ---- | ------------------- | ---- | ---------------------- | ---- | -------------------------- |
| ①    | Wi-Fi / 蓝牙模块    | ⑧    | PoE 排针               | ⑭    | LPDDR4 / LPDDR4x 内存      |
| ②    | 天线座              | ⑨    | 千兆以太网（支持 PoE） | ⑮    | 全志 A527 / T527           |
| ③    | USB 3.0 Type-A HOST | ⑩    | MIPI DSI               | ⑯    | 板载 eMMC（预留）          |
| ④    | HDMI                | ⑪    | MicroSD 卡槽           | ⑰    | 40 Pin GPIO 排针           |
| ⑤    | SPI Flash           | ⑫    | MIPI CSI               | ⑱    | USB Type-C (5V 供电 & OTG) |
| ⑥    | UBOOT 按键          | ⑬    | M.2 M Key 2230 插槽    | ⑲    | 千兆以太网（不支持 PoE）   |
| ⑦    | 状态指示灯          |      |                        |      |                            |

:::tip 板载 eMMC
若您购买的 Cubie A5E 型号为无板载 eMMC 套餐，则主板板载 eMMC 位置预留，无任何元器件。
:::

- 状态指示灯
  - 绿色常亮：系统供电正常
  - 蓝色闪烁：系统启动正常
