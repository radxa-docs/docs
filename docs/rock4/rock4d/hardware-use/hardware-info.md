---
sidebar_position: 0
---

# 硬件信息

## 芯片框图

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/hardware-rk3576.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 系统框图

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/hardware-rk3576-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口信息

对于可以外接设备的接口，点击接口说明可以参考使用教程。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
| 序号 | 说明                       | 数量 | 序号 | 说明                         | 数量 | 序号 | 说明                         | 数量 |
|:----:|:---------------------------|:----:|:----:|:----------------------------|:----:|:----:|:----------------------------|:----:|
|  ①   | [USB Type-C 接口](./usb-type-c) |  1   |  ⑩  | [PoE 接口](./gigabit-ethernet) |  1   |  ⑲  | [MIPI CSI 接口](./mipi-csi) |  1   |
|  ②   | 用户指示灯                 |  1   |  ⑪  | [Maskrom 按键](./maskrom)                |  1   |  ⑳  | [HDMI 2.1 接口](./hdmi)     |  1   |
|  ③   | 电源指示灯                 |  1   |  ⑫  | [USB 2.0 Type-A 接口](./usb-type-a) |  2   |  ㉑  | [Recovery 引脚](./recovery)             |  1   |
|  ④   | 电源按键                   |  1   |  ⑬  | Rockchip RK3576（J）        |  1   |  ㉒  | [UFS 模块接口](./emmc-ufs-connector) |  1   |
|  ⑤   | [FPC 接口](./fpc-connector)|  1   |  ⑭  | [USB 3.0 Type-A 接口](./usb-type-a) |  2   |  ㉓  | [RTC 接口](./rtc)           |  1   |
|  ⑥   | [WiFi6 和 蓝牙 5.4](./ante.md) |  1   |  ⑮  | SPI NOR Flash               |  1   |  ㉔  | [eMMC 模块接口](./emmc-ufs-connector) |  1   |
|  ⑦   | [天线接口](./ante)          |  1   |  ⑯  | [千兆以太网口（支持PoE）](./gigabit-ethernet) |  1   |  ㉕  | [MIPI CSI 接口](./mipi-csi) |  1   |
|  ⑧   | [40 Pin GPIO 接口](./pin-gpio)|  1   |  ⑰  | [风扇接口](./fan)            |  1   |  ㉖  | [MicroSD 卡槽](./microsd)   |  1   |
|  ⑨   | LPDDR5 内存                |  1   |  ⑱  | [耳机插孔](./headphone)      |  1   |  ㉗  | [MIPI DSI 接口](./mipi-dsi) |  1   |

- 用户指示灯

系统正常启动时，用户指示灯会闪烁。

- 电源指示灯

系统正常启动时，电源指示灯会亮起。

- 电源按键

短按触发开机或者电源菜单选项，长按关机。

- LPDDR5 内存

LPDDR5 内存可选 2GB / 4GB / 8GB / 16GB 容量。

- Rockchip RK3576（J）

瑞莎 ROCK 4D 提供两个 SoC 版本：基于 RK3576 的商业级 ROCK 4D 和 基于 RK3576J 的工业级 ROCK 4D。
