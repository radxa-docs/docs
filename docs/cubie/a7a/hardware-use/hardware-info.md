---
sidebar_position: 1
---

# 硬件接口

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/a7a-system-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/a7a-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                | 序号 | 说明                       | 序号 | 说明                      |
| ---- | ------------------- | ---- | -------------------------- | ---- | ------------------------- |
| ①    | USB Type-C 接口     | ⑧    | USB Type-A 接口            | ⑮    | 天线接口                  |
| ②    | HDMI 接口           | ⑨    | LPDDR5 内存                | ⑯    | FPC 接口                  |
| ③    | 风扇接口            | ⑩    | 千兆以太网接口（支持 PoE） | ⑰    | Allwinner A733            |
| ④    | 耳机插孔            | ⑪    | PoE 接口                   | ⑱    | 电源按键                  |
| ⑤    | UBOOT 按键          | ⑫    | WiFi6 和 蓝牙5.4           | ⑲    | eMMC / UFS 模块二合一接口 |
| ⑥    | USB 2.0 Type-A 接口 | ⑬    | 40 Pin GPIO 排针           | ⑳    | MIPI CSI 接口             |
| ⑦    | RTC 接口            | ⑭    | MIPI DSI 接口              | ㉑   | MicroSD 卡槽              |

- 电源指示灯

Cubie A7A 正常供电，电源指示灯绿色亮起；断电或关机时，电源指示灯熄灭。

- 状态指示灯

系统正常启动时，状态指示灯蓝色闪烁；系统异常时，状态指示灯熄灭。

- LDDR5 内存

LDRR5 内存可选：2GB / 4GB / 8GB / 16GB。
