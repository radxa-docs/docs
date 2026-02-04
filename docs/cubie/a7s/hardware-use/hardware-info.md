---
sidebar_position: 1
---

# 硬件接口

主要介绍主板的硬件接口信息。

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7s/block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7s/cubie-a7s-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                                   | 序号 | 说明             | 序号 | 说明                                                |
| ---- | -------------------------------------- | ---- | ---------------- | ---- | --------------------------------------------------- |
| 1    | 千兆以太网                             | 2    | 15-Pin GPIO 排针 | 3    | Wi‑Fi 6 & BT5.4 模组                                |
| 4    | 天线座                                 | 5    | USB 2.0 Type-A   | 6    | FPC 接口<br />- PCIe 3.0 x1, 支持拓展 NVMe 固态硬盘 |
| 7    | USB BOOT 按键                          | 8    | 30-Pin GPIO 排针 | 9    | 板载 eMMC                                           |
| 10   | MIPI CSI 摄像头接口                    | 11   | 风扇接口         | 12   | microSD 卡槽                                        |
| 13   | 全志 A733                              | 14   | LPDDR5           | 15   | USB-C 2<br />- USB 3.0, 支持 DP Alt 模式和 OTG 功能 |
| 16   | USB-C 1<br />- 支持 5V 供电和 OTG 功能 |      |                  |      |                                                     |

:::tip 板载 eMMC
若您购买的 Cubie A7S 型号为无板载 eMMC 版本，则主板板载 eMMC 位置预留，无任何元器件。
:::

### 千兆以太网

Cubie A7S 板载 1 个 千兆以太网口，用于有线连接网络，支持 10/100/1000 Mbps 自适应速率。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/rj45_led.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

| LED  | 状态 | 描述                                   |
| ---- | ---- | -------------------------------------- |
| 橙色 | 常亮 | 链路已建立（设备已连接到网络）         |
| 绿色 | 闪烁 | 正在进行数据传输（网络活动中）         |
| 关闭 | -    | 未检测到链路（网线未插或存在网络问题） |

### WiFi & BT

Cubie A7S 板载 1 个 Wi-Fi 6 & BT5.4 模组，用于无线连接网络，支持 2.4GHz/5GHz 双频 Wi-Fi，支持蓝牙 5.4。

### 天线座

Cubie A7S 板载 1 个 天线座，用于连接天线，增强无线信号。

### USB

Cubie A7S 板载 1 个 USB 2.0 Type-A、1 个 USB 2.0 Type-C（USB-C1）、1 个 USB 3.0 Type-C（USB-C2）接口。

- USB 2.0 Type-A：用于连接 USB 2.0 设备，如鼠标、键盘、U 盘等。
- USB 2.0 Type-C（USB-C1）：支持 5V 供电和 OTG 功能。
- USB 3.0 Type-C（USB-C2）： 支持 DP Alt 模式和 OTG 功能。

### 30-Pin GPIO 排针

<TabItem value="Cubie A7S">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

| FUNC9 | FUNC8 |   FUNC7   |  FUNC6   |   FUNC5    |                  FUNC4                   |   FUNC3   |   FUNC2   | FUNC1 |               Pin#               |              Pin#               | FUNC1 |   FUNC2   |   FUNC3   |              FUNC4               |   FUNC5   |          FUNC6          |  FUNC7   |   FUNC8   | FUNC9 |
| :---: | :---: | :-------: | :------: | :--------: | :--------------------------------------: | :-------: | :-------: | :---: | :------------------------------: | :-----------------------------: | :---: | :-------: | :-------: | :------------------------------: | :-------: | :---------------------: | :------: | :-------: | :---: |
|       |       |           |          |            |                                          |           |           | +3.3V | <div className='yellow'>1</div>  |  <div className='red'>2</div>   | +5.0V |           |           |                                  |           |                         |          |           |       |
|       |       | TWI11-SDA | TWI3-SDA |  TWI7-SDA  |                UART2-CTS                 | UART3-RX  |  PWM1-5   | PJ23  |  <div className='green'>3</div>  |  <div className='red'>4</div>   | +5.0V |           |           |                                  |           |                         |          |           |       |
|       |       | TWI11-SCK | TWI3-SCK |  TWI7-SCK  |                UART2-RTS                 | UART3-TX  |  PWM1-4   | PJ22  |  <div className='green'>5</div>  | <div className='black'>6</div>  |  GND  |           |           |                                  |           |                         |          |           |       |
|       |       | PB-EINT0  | JTAG-MS  |  LCD0-D0   |             DSI-TRIG-LCD-TE1             | UART0-TX  | UART2-TX  |  PB0  |  <div className='green'>7</div>  | <div className='green'>8</div>  |  PB9  | UART0-TX  |  PWM1-1   |           WATCHDOG-SIG           | LCD0-D16  |        TWI8-SCK         | TWI0-SCK | PB-EINT9  |       |
|       |       |           |          |            |                                          |           |           |  GND  |  <div className='black'>9</div>  | <div className='green'>10</div> | PB10  | UART0-RX  |  PWM1-2   |           PLL-LOCK-DBG           | LCD0-D17  |        TWI8-SDA         | TWI0-SDA | PB-EINT10 |       |
|       |       | PB-EINT1  | JTAG-CK  |  LCD0-D1   |                 UART0-RX                 | UART2-RX  |           |  PB1  | <div className='green'>11</div>  | <div className='green'>12</div> |  PB5  |  PWM0-1   | LCD0-D17  |           TRACE-DATA0            | PB-EINT5  |                         |          |           |       |
|       |       | PL-EINT6  | S-PWM0-4 |  S-IR-RX   |                S-UART0-TX                | S-JTAG-DO |           |  PL6  | <div className='green'>13</div>  | <div className='black'>14</div> |  GND  |           |           |                                  |           |                         |          |           |       |
|       |       | PL-EINT7  | S-PWM0-5 | S-UART0-RX |                S-JTAG-DI                 |           |           |  PL7  | <div className='green'>15</div>  | <div className='green'>16</div> | PJ24  |  PWM1-6   | UART4-TX  |             TWI4-SCK             | PJ-EINT24 |                         |          |           |       |
|       |       |           |          |            |                                          |           |           | +3.3V | <div className='yellow'>17</div> | <div className='green'>18</div> | PJ25  |  PWM1-7   | UART4-RX  |             TWI4-SDA             | PJ-EINT25 |                         |          |           |       |
|       |       | LVDS1-D1P | DSI1-D1P |  EINK-D12  |        SPI1-MOSI &lt;DBI-SDO&gt;         |  PWM1-2   | PD-EINT12 | PD12  | <div className='green'>19</div>  | <div className='black'>20</div> |  GND  |           |           |                                  |           |                         |          |           |       |
|       |       | LVDS1-D1N | DSI1-D1N |  EINK-D13  | SPI1-MISO &lt;DBI-SDI/DBI-TE/DBI-DCX&gt; |  PWM1-3   | PD-EINT13 | PD13  | <div className='green'>21</div>  | <div className='green'>22</div> |  PL5  | S-JTAG-CK | S-PWM0-3  |             PL-EINT5             |           |                         |          |           |       |
|       |       | LVDS1-D0N | DSI1-D0N |  EINK-D11  |        SPI1-CLK &lt;DBI-SCLK&gt;         |  PWM1-1   | PD-EINT11 | PD11  | <div className='green'>23</div>  | <div className='green'>24</div> | PD10  | LCD0-D14  | LVDS1-D0P |             DSI1-D0P             | EINK-D10  | SPI1-CS0&lt;DBI-CSX&gt; |  PWM1-0  | PD-EINT10 |       |
|       |       |           |          |            |                                          |           |           |  GND  | <div className='black'>25</div>  | <div className='green'>26</div> | PD14  | LCD0-D20  | EINK-D14  | SPI1-HOLD&lt;DBI-DCX/DBI-WRX&gt; | UART3-RTS |        PD-EINT14        |          |           |
|       |       | LVDS1-CKN | DSI1-D2N |  EINK-LEH  |                 TWI2-SDA                 | UART3-RX  | PD-EINT17 | PD17  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | PD16  | LCD0-D22  | LVDS1-CKP |             DSI1-D2P             | EINK-OEH  |        TWI2-SCK         | UART3-TX | PD-EINT16 |       |
|       |       | UART2-RTS | HDMI-SCL |  LCD0-D8   |                 JTAG-DO                  | TWI0-SCK  | PB-EINT2  |  PB2  | <div className='green'>29</div>  | <div className='black'>30</div> |  GND  |           |           |                                  |           |                         |          |           |

   </div>
</TabItem>

### 15-Pin GPIO 排针

<TabItem value="Cubie A7S">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

|              Pin#               | FUNC1 |   FUNC2    |   FUNC3    |    FUNC4    |   FUNC5    |  FUNC6   |
| :-----------------------------: | :---: | :--------: | :--------: | :---------: | :--------: | :------: |
| <div className='green'>1</div>  |  PB3  |  HDMI-SDA  |  LCD0-D9   |  PB-EINT3   |            |          |
| <div className='green'>2</div>  |  PM3  | S-UART0-RX | S-UART1-RX |  S-PWM0-5   |  PM-EINT3  |          |
| <div className='green'>3</div>  |  PM4  | S-UART0-TX | S-UART1-TX |  S-PWM0-0   |  S-IR-RX   | PM-EINT4 |
| <div className='black'>4</div>  |  GND  |            |            |             |            |          |
| <div className='green'>5</div>  |  PB6  |   PWM0-2   |   PWM0-8   | TRACE-DATA1 |  PB-EINT6  |          |
| <div className='green'>6</div>  |  PB4  |   PWM0-0   |  HDMI-CEC  |  LCD0-D16   | TRACE-CLK  | PB-EINT4 |
| <div className='green'>7</div>  |  PB8  |   PWM1-0   |  OWA0-OUT  | TRACE-DATA3 |  PB-EINT8  |          |
| <div className='green'>8</div>  |  PB7  |   PWM0-9   |  OWA0-IN   | TRACE-DATA2 |  PB-EINT7  |          |
| <div className='black'>9</div>  |  GND  |            |            |             |            |          |
| <div className='green'>10</div> |  PG0  |  SDC1-CLK  |  LCD0-D0   |   PWM1-1    |  LPC-LAD0  | PG-EINT0 |
| <div className='green'>11</div> |  PG1  |  SDC1-CMD  |  LCD0-D1   |   PWM1-2    |  LPC-LPME  | PG-EINT1 |
| <div className='green'>12</div> |  PG2  |  SDC1-D0   |  LCD0-D8   |   PWM1-3    | LPC-LPCPD  | PG-EINT2 |
| <div className='green'>13</div> |  PG3  |  SDC1-D1   |  LCD0-D9   |   PWM1-4    | LPC-LFRAME | PG-EINT3 |
| <div className='green'>14</div> |  PG4  |  SDC1-D2   |  LCD0-D16  |   PWM1-5    |  LPC-LSMI  | PG-EINT4 |
| <div className='green'>15</div> |  PG5  |  SDC1-D3   |  LCD0-D17  |   PWM1-6    |  LPC-LCLK  | PG-EINT5 |

   </div>
</TabItem>

### FPC 接口

Cubie A7S 板载 1 个 FPC 接口，支持PCIe 3.0标准、单通道（x1）的高速数据扩展接口，支持拓展 NVMe 固态硬盘。

### 状态指示灯

Cubie A7S 板载 1 个 电源指示灯和 1 个 状态指示灯，用于显示系统状态。

- 电源指示灯：绿色常亮，表示系统供电正常
- 状态指示灯：蓝色闪烁，表示系统启动正常

### USB BOOT 按键

Cubie A7S 板载 1 个 USB BOOT 按键，用于进入 FEL 模式。

:::tip FEL 模式

FEL 是 Allwinner（全志）芯片中的一种低级启动和刷机模式，主要用于设备无法从常规存储介质启动时的系统恢复或调试。

- 进入 FEL 模式

主板上电前，按住 Cubie A7S 的 UBOOT 按键，主板上电后，松开 UBOOT 按键就可以进入 FEL 模式。

:::

### MIPI 摄像头接口

Cubie A7S 板载 1 个 4 通道 MIPI 摄像头接口，可以通过该接口连接 MIPI 摄像头。

主板 MIPI CSI 接口规格如下：

- 接口类型：31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口
- 连接方式：翻盖式，下接触

### microSD 卡槽

Cubie A7S 板载 1 个 microSD 卡槽，兼容 MicroSD / MicroSDHC / MicroSDXC 卡，主要用作系统启动盘或扩展存储空间。

推荐使用容量 32GB 及以上的 MicroSD 卡，以获得更好的存储空间。

### 板载 eMMC（可选）

若购买的是板载 eMMC 版本，可以用作系统启动盘或拓展存储空间。

eMMC 模块相比于 MicroSD 卡读写速度更快，对于想提高系统读写和启动速度的用户来说，是个不错的选择。
