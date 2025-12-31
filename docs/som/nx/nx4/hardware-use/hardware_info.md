---
sidebar_position: 1
---

# 硬件信息

## 芯片框图

<div style={{textAlign: 'center'}}>
   <img src="/img/cm4/rk3576_block_diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<Tabs queryString="board interface">

<TabItem value="瑞莎 NX4">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                 | 序号 | 说明       | 序号 | 说明                   |
| :--: | :------------------- | :--: | :--------- | :--: | :--------------------- |
|  1   | WiFi 6 & BT 5.4 模组 |  2   | 天线接口   |  3   | SPI Flash (未焊接)     |
|  4   | 瑞芯微 RK3576        |  5   | 状态指示灯 |  6   | LPDDR5                 |
|  7   | Maskrom 按键         |  8   | 板载 eMMC  |  9   | 260-pin SO-DIMM 连接器 |
|  10  | 板载 UFS (未焊接)    |      |            |      |                        |

</TabItem>

<TabItem value="瑞莎 NX4 载板">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-io-board-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                               | 序号 | 说明                                       | 序号 | 说明                                       |
| :--: | :--------------------------------- | :--: | :----------------------------------------- | :--: | :----------------------------------------- |
|  1   | MIPI 摄像头（4 通道）              |  2   | MIPI 摄像头（4 通道）                      |  3   | DC5525 供电接口（9V-20V）                  |
|  4   | PoE 反向供电接口                   |  5   | HDMI 输出接口                              |  6   | 按键接口                                   |
|  7   | 4x USB 3.2 Type-A                  |  8   | 260-pin SO-DIMM 插槽                       |  9   | CAN 总线接口                               |
|  10  | RJ45 千兆以太网口                  |  11  | USB Type-C                                 |  12  | 电源指示灯                                 |
|  13  | 40-Pin GPIO 排针                   |  14  | M.2 M Key 2230 插槽<br /> 当前版本无法使用 |  15  | M.2 M Key 2280 插槽<br /> 当前版本无法使用 |
|  16  | M.2 E Key 2230 插槽（PCIe 2.0 x1） |  17  | RTC 电池接口                               |  18  | PoE 接口                                   |
|  19  | PWM 风扇接口                       |      |                                            |      |                                            |

:::note 接口说明

瑞莎 NX4 搭配瑞莎 NX4 载板使用，M.2 M Key 2230 和 M.2 E Key 2230 插槽无法使用。

预留的 M.2 M Key 2230 和 M.2 E Key 2230 插槽将在下一次硬件版本中移除。

:::

</TabItem>

</Tabs>

- 电源指示灯

正常状态下，瑞莎 NX4 载板的电源指示灯（绿色）亮起，表示电源正常。

- 用户指示灯

瑞莎 NX4 的状态指示灯（蓝色）闪烁，表示系统正常运行。
