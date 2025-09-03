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
   <img src="/img/cm4/cm4_block_diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口信息

<Tabs queryString="product">
<TabItem value="CM4">

<div style={{textAlign: 'center'}}>
   <img src="/img/cm4/cm4_core_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明         | 序号 | 说明                   | 序号 | 说明         | 序号 | 说明                  |
| ---- | ------------ | ---- | ---------------------- | ---- | ------------ | ---- | --------------------- |
| ①    | LPDDR4X 内存 | ③    | SoC:Rockchip RK3576(J) | ⑤    | 天线接口     | ⑦    | 板载 eMMC             |
| ②    | Maskrom 按键 | ④    | SPI Flash              | ⑥    | WiFi/BT 芯片 | ⑧    | 3x 100 Pin B2B 连接器 |

</TabItem>

<TabItem value="CM4 IO 板">

<div style={{textAlign: 'center'}}>
   <img src="/img/cm4/cm4_base_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                         | 序号 | 说明                                    | 序号 | 说明                 |
| ---- | ---------------------------- | ---- | --------------------------------------- | ---- | -------------------- |
| ①    | DC 12V 输入                  | ⑧    | USB 2.0 Type-A 接口                     | ⑮    | 14 Pin GPIO 接口     |
| ②    | 电源引脚（可触发关机、重启） | ⑨    | 千兆以太网口（支持PoE，需搭配 PoE HAT） | ⑯    | RTC 接口             |
| ③    | 电源输出                     | ⑩    | USB 3.0 Type-A 接口                     | ⑰    | UFS 模块接口         |
| ④    | 风扇接口                     | ⑪    | HDMI 接口                               | ⑱    | 4 通道 MIPI CSI 接口 |
| ⑤    | MicroSD 卡槽                 | ⑫    | 2x 2 通道 MIPI CSI 接口                 | ⑲    | 4 通道 MIPI DSI 接口 |
| ⑥    | 耳机插孔                     | ⑬    | PoE 接口                                | ⑳    | M.2 M Key 2280 接口  |
| ⑦    | 2x USB 3.0 Type-C 接口       | ⑭    | 40 Pin GPIO 接口                        | ㉑   | 3x 100 Pin B2B 接口  |

</TabItem>
</Tabs>

- 电源指示灯

使用电源适配器给瑞莎 CM4 供电，CM4 IO 板的电源指示灯（红色）亮起，表示电源正常。

瑞莎 CM4 的指示灯在上电会亮绿色，系统正常运行后会熄灭几秒，然后和 CM4 IO 板的用户指示灯（绿色）一起闪烁。

- 用户指示灯

瑞莎 CM4 的用户指示灯（绿色）闪烁，表示系统正常运行。
