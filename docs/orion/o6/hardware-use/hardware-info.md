---
sidebar_position: 10
---

# 硬件信息

## 芯片框图

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6n/orion-o6n-p1-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/orion-o6-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/orion-o6-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                                                      | 序号 | 说明                                                                     | 序号 | 说明                                     |
| ---- | --------------------------------------------------------- | ---- | ------------------------------------------------------------------------ | ---- | ---------------------------------------- |
| 1    | USB 2.0 接口（前置面板）                                  | 11   | 2x 扬声器接口                                                            | 21   | 电源按键                                 |
| 2    | 音频接口（前置面板）                                      | 12   | 状态指示灯                                                               | 22   | 4-Pin 风扇接口<br/>- 支持 PWM 调速与测速 |
| 3    | 触摸面板接口                                              | 13   | 复位按键                                                                 | 23   | BIOS 闪存座                              |
| 4    | 多功能接口（前置面板）<br/>- 支持电源 / 指示灯 / 重启功能 | 14   | 3.5 mm 耳机插孔                                                          | 24   | 此芯 P1 SoC                              |
| 5    | UART 接口                                                 | 15   | 2x 5G 以太网                                                             | 25   | 40-Pin GPIO 排针                         |
| 6    | eDP 接口                                                  | 16   | DP 接口                                                                  | 26   | LPDDR5                                   |
| 7    | RTC 电池座                                                | 17   | HDMI 接口                                                                | 27   | ATX 电源接口                             |
| 8    | PCIe x16 插槽（PCIe Gen x4）                              | 18   | 2x USB 3.2 Type-A                                                        | 28   | 2x MIPI CSI 4-lane                       |
| 9    | M.2 M Key 插槽                                            | 19   | 2x USB 2.0 Type-A                                                        | 29   | TPM (Unsoldered)                         |
| 10   | M.2 E Key 2230 插槽                                       | 20   | 2x USB Type-C<br/>- 20V Type-C 供电，支持 PD 协议<br/>- 支持 DP 视频输出 |      |                                          |

### 电源按键

主要用于控制主板的电源开关。

- 主板系统关闭时，按下电源按键可启动主板
- 主板系统运行时，短按电源按键会触发电源事件，根据操作系统设置，操作可显示电源菜单或进入系统挂起模式。
- 长按电源按键 4 秒会触发强制关机。

### 复位按键

主要控制主板系统复位，短按将重新启动系统。

### 状态指示灯

板载两个状态指示灯。

- 绿色指示灯：表示电源状态
- 蓝色指示灯：表示系统状态
  - BIOS 正常启动，蓝色指示灯常亮
  - 操作系统正常启动，蓝色指示灯闪烁

### USB Type-C 端口

板载两个 USB 3.2 Type-C 端口，最高传输速度可达 10Gbps，均支持主板供电功能，其中一个 USB Type-C 端口支持 DP 备用模式。

- 建议使用 [瑞莎 PD 65W 电源适配器](https://radxa.com/products/accessories/power-pd-65w) 给主板供电
- 任意 USB Type-C 端口均可给主板供电，若同时连接两个电源，首个插入的 PD 电源将为主板供电
- 每个 USB Type-C 端口可为外部设备提供高达 3A 电流
- USBC0 支持 OTG 模式，USBC1 支持 HOST 模式

### USB Type-A 端口

板载 2 个 USB 2.0 Type-A 端口、2 个 USB 3.2 Type-A 端口以及前置面板的 USB 2.0 接口。

- USB 2.0 Type-A：最高传输速率 480Mbps，所有 USB 2.0 端口共享 1.4A 总电流
- USB 3.2 Type-A：最高传输速率 10Gbps，每个端口电流限制为 1A
- USB 2.0 接口（前置面板）

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/pinout_f_usb.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

| 引脚 | 名称     | 描述           | 引脚 | 名称     | 描述           | 引脚 | 名称     | 描述           |
| ---- | -------- | -------------- | ---- | -------- | -------------- | ---- | -------- | -------------- |
| 1    | 5V_1     | 电源（+5V）    | 2    | 5V_2     | 电源（+5V）    | 3    | USB_DM_1 | USB 数据负信号 |
| 4    | USB_DM_2 | USB 数据负信号 | 5    | USB_DP_1 | USB 数据正信号 | 6    | USB_DP_2 | USB 数据正信号 |
| 7    | GND      | 接地连接       | 8    | GND      | 接地连接       | 9    | /        | 保留或未连接   |
| 10   | GND      | 接地连接       |      |          |                |      |          |                |

### HDMI 接口

板载 HDMI A 型接口，最高支持 4K@60Hz，不支持 HDMI CEC 功能。

### DP 接口

板载 DP 接口，最高支持 4K@120Hz，支持多流传输（MST）功能。

### eDP 接口

板载 eDP 接口，采用 0.5 mm 间距的 40-Pin IPEX 接口，可直接连接 eDP 面板，最高支持 4K@60Hz。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/pinout_eDP.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

| 引脚 | 名称 | 描述              | 引脚 | 名称  | 描述          | 引脚 | 名称 | 描述                    |
| ---- | ---- | ----------------- | ---- | ----- | ------------- | ---- | ---- | ----------------------- |
| 1    | NC   | 未连接            | 2    | GND   | 接地          | 3    | 3N   | eDP 通道 3 负信号       |
| 4    | 3P   | eDP 通道 3 正信号 | 5    | GND   | 接地          | 6    | 2N   | eDP 通道 2 负信号       |
| 7    | 2P   | eDP 通道 2 正信号 | 8    | GND   | 接地          | 9    | 1N   | eDP 通道 1 负信号       |
| 10   | 1P   | eDP 通道 1 正信号 | 11   | GND   | 接地          | 12   | 0N   | eDP 通道 0 负信号       |
| 13   | 0P   | eDP 通道 0 正信号 | 14   | GND   | 接地          | 15   | AUXP | eDP 辅助通道正          |
| 16   | AUXN | eDP 辅助通道负    | 17   | GND   | 接地          | 18   | VDD1 | 电源（+3.3V）           |
| 19   | VDD2 | 电源（+3.3V）     | 20   | VDD3  | 电源（+3.3V） | 21   | VDD4 | 电源（+3.3V）           |
| 22   | NC   | 未连接            | 23   | GND   | 接地          | 24   | GND  | 接地                    |
| 25   | GND  | 接地              | 26   | GND   | 接地          | 27   | NC   | 未连接                  |
| 28   | GND  | 接地              | 29   | GND   | 接地          | 30   | GND  | 接地                    |
| 31   | GND  | 接地              | 32   | BL_EN | 背光使能信号  | 33   | PWM  | 用于背光控制的 PWM 信号 |
| 34   | NC   | 未连接            | 35   | NC    | 未连接        | 36   | VBL1 | 背光电源                |
| 37   | VBL2 | 背光电源          | 38   | VBL3  | 背光电源      | 39   | VBL4 | 背光电源                |
| 40   | NC   | 未连接            | 41   | NC    | 未连接        | 42   | NC   | 未连接                  |
| 43   | GND  | 接地              |      |       |               |      |      |                         |

### 触摸面板接口

主要用于集成触摸屏，与 eDP 接口结合，为连接触摸屏提供直接接口。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/pinout_tp.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

| 引脚 | 名称  | 描述                         | 引脚 | 名称 | 描述                              | 引脚 | 名称 | 描述                              |
| ---- | ----- | ---------------------------- | ---- | ---- | --------------------------------- | ---- | ---- | --------------------------------- |
| 1    | Reset | 触摸控制器的复位信号（3.3V） | 2    | VCC  | 触摸面板电源（3.3V）              | 3    | GND  | 接地连接                          |
| 4    | EINT  | 外部中断信号（3.3V）         | 5    | SDA  | 用于触摸通信的 I2C 数据线（3.3V） | 6    | SCL  | 用于触摸通信的 I2C 时钟线（3.3V） |
| 7    | GND   | 接地连接                     | 8    | GND  | 接地连接                          |      |      |                                   |

### 5G 以太网口

板载双 5G RJ45 以太网口，支持 10/100/1000/2500/5000 Mbps 自适应速率。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/rj45_led.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

| LED  | 状态 | 描述                                   |
| ---- | ---- | -------------------------------------- |
| 橙色 | 常亮 | 链路已建立（设备已连接到网络）         |
| 绿色 | 闪烁 | 正在进行数据传输（网络活动中）         |
| 关闭 | -    | 未检测到链路（网线未插或存在网络问题） |

### 音频接口

板载 1 个 3.5 mm 耳机插孔和前置面板音频接口。

#### 耳机插孔

板载 1 个 3.5 mm 耳机插孔，支持音频输出和输入。

#### 音频接口（前置面板）

用于支持机箱的前置面板音频功能。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/pinout_f_audio.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

| 引脚 | 名称        | 描述               | 引脚 | 名称     | 描述           | 引脚 | 名称         | 描述                 |
| ---- | ----------- | ------------------ | ---- | -------- | -------------- | ---- | ------------ | -------------------- |
| 1    | MIC_INL     | 麦克风输入（左）   | 2    | GND      | 接地连接       | 3    | MIC_INR      | 麦克风输入（右）     |
| 4    | GND         | 接地连接           | 5    | HP_OUT_R | 耳机输出（右） | 6    | FRONT_MIC_JD | 前面板麦克风插孔检测 |
| 7    | GND         | 接地连接           | 8    | /        | 保留或未连接   | 9    | HP_OUT_L     | 耳机输出（左）       |
| 10   | FRONT_HP_JD | 前面板耳机插孔检测 |      |          |                |      |              |                      |

### PCIe x16 插槽

板载全尺寸 PCIe x16 插槽，支持 PCIe Gen4 x8，可支持高性能显卡扩展。

- 电源供应
  - 使用 ATX 供电时，PCIe 插槽的最大功率为 60W。
  - 使用 USB Type-C 供电时，PCIe 插槽的最大功率为 15W。

### 风扇接口

板载标准的 ATX 4-Pin 风扇接口，支持 PWM 控制和测速。

说明：主板上有丝印标识，方便用户识别和连接。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/pinout_fan.webp" style={{width: '20%', maxWidth: '1200px'}} />
</div>

| 引脚 | 名称 | 描述                         | 引脚 | 名称   | 描述        | 引脚 | 名称 | 描述                       |
| ---- | ---- | ---------------------------- | ---- | ------ | ----------- | ---- | ---- | -------------------------- |
| 1    | GND  | 接地连接                     | 2    | VCC12V | 电源（12V） | 3    | TACH | 转速计信号（风扇速度反馈） |
| 4    | PWM  | 脉冲宽度调制控制信号（3.3V） |      |        |             |      |      |                            |

### BIOS 闪存座

板载 1 个 BIOS 闪存芯片座，方便开发人员轻松拆卸或更换 BIOS 芯片。

- 芯片兼容性：支持 SOP8 封装的闪存芯片
- 芯片容量：8MB（64Mbit）
- 电压等级：1.8V

引脚说明：

- 芯片上的圆点为 1 脚定位标记，图中已用红色圆圈标出
- BIOS 闪存座上的三角形为 1 脚定位标记，图中已用红色三角形标出

| 引脚 | 名称     | 引脚 | 名称     | 引脚 | 名称     | 引脚 | 名称    |
| ---- | -------- | ---- | -------- | ---- | -------- | ---- | ------- |
| 1    | ROM_CS   | 2    | ROM_MISO | 3    | ROM_WP   | 4    | GND     |
| 5    | ROM_MOSI | 6    | ROM_CLK  | 7    | ROM_HOLD | 8    | ROM_VCC |

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/orion-o6-bios-socket.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip 拆卸 / 安装 BIOS 芯片

非必要操作，请勿拆卸 BIOS 芯片。

拆卸和安装 BIOS 芯片，用户可以参考 [更新 BIOS 固件教程](../low-level-dev/bios.md#使用烧录器更新-bios-固件) 教程的使用烧录器更新 BIOS 固件内容。

:::

### 40-Pin GPIO 排针

板载 40-Pin GPIO（通用输入输出）接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 40-Pin GPIO 接口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网（IoT）、机器人控制、工业自动化等领域的原型开发与功能验证。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/pinout_gpio.webp" style={{width: '15%', maxWidth: '1200px', transform: 'rotate(90deg)'}} />
</div>

<TabItem value="Orion O6">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

| Function3 | Function2    | Function1      |               Pin#               |              Pin#               | Function1 | Function2        | Function3 |
| --------- | ------------ | -------------- | :------------------------------: | :-----------------------------: | --------- | ---------------- | --------- |
|           |              | 3.3V           | <div className='yellow'>1</div>  |  <div className='red'>2</div>   | 5V        |                  |           |
|           | GPIO061      | I2C4_SDA       |  <div className='green'>3</div>  |  <div className='red'>4</div>   | 5V        |                  |           |
|           | GPIO062      | I2C4_CLK       |  <div className='green'>5</div>  | <div className='black'>6</div>  | GND       |                  |           |
|           | GPIO071      |                |  <div className='green'>7</div>  | <div className='green'>8</div>  | UART3_TXD | GPIO105          |           |
|           |              | GND            |  <div className='black'>9</div>  | <div className='green'>10</div> | UART3_RXD | GPIO106          |           |
| GPIO095   | PWM0         | UART0_TXD      | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO091   | I2S4_SCK_LB      |           |
| GPIO096   | PWM1         | UART0_RXD      | <div className='green'>13</div>  | <div className='black'>14</div> | GND       |                  |           |
| GPIO099   | FAN_OUT0     | UART1_TXD      | <div className='green'>15</div>  | <div className='green'>16</div> | UART1_RXD | FAN_TACH0        | GPIO100   |
|           |              | 3.3V           | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO044   |                  |           |
| SPI2_MOSI | GMAC1_TXD3   | GPIO141        | <div className='green'>19</div>  | <div className='black'>20</div> | GND       |                  |           |
| SPI2_MISO | GMAC1_TXD0   | GPIO138        | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO045   |                  |           |
| SPI2_CLK  | GMAC1_TX_CLK | GPIO142        | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO139   |                  | SPI2_CS0  |
|           |              | GND            | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO140   |                  | SPI2_CS1  |
| GPIO056   | I3C0_SDA     | I2C2_SDA       |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | I2C2_CLK  | I3C0_SCL         | GPIO055   |
|           | GPIO076      | I2S2_DATA_IN1  | <div className='green'>29</div>  | <div className='black'>30</div> | GND       |                  |           |
|           | GPIO078      | I2S2_DATA_OUT1 | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO046   |                  |           |
|           | GPIO079      | I2S2_DATA_OUT2 | <div className='green'>33</div>  | <div className='black'>34</div> | GND       |                  |           |
|           | I2S4_WS_LB   | GPIO092        | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO090   | I2S4_MCLK_LB     |           |
|           | GPIO080      | I2S2_DATA_OUT3 | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO093   | I2S4_DATA_IN_LB  |           |
|           |              | GND            | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO094   | I2S4_DATA_OUT_LB |           |

   </div>
</TabItem>

### ATX 电源接口

板载 1 个与 ATX 兼容的 24 针电源接口，以实现标准的 ATX 电源兼容性，方便用户使用标准 ATX 电源进行供电。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/pinout_atx_power.webp" style={{width: '15%', maxWidth: '1200px', transform: 'rotate(90deg)'}} />
</div>

| 引脚 | 名称   | 描述                                   | 引脚 | 名称  | 描述                       | 引脚 | 名称 | 描述         |
| ---- | ------ | -------------------------------------- | ---- | ----- | -------------------------- | ---- | ---- | ------------ |
| 3    | GND    | 接地连接                               | 5    | GND   | 接地连接                   | 7    | GND  | 接地连接     |
| 8    | PWR_OK | 电源正常信号（逻辑高电平：3.3V 或 5V） | 9    | 5VSB  | 备用电源（+5V，始终开启）  | 10   | 12V  | 电源（+12V） |
| 11   | 12V    | 电源（+12V）                           | 13   | NC    | 未连接                     | 14   | NC   | 未连接       |
| 15   | GND    | 接地连接                               | 16   | PS_ON | 电源开启（低电平有效信号） | 17   | GND  | 接地连接     |
| 18   | GND    | 接地连接                               | 19   | GND   | 接地连接                   | 20   | NC   | 未连接       |
| 21   | NC     | 未连接                                 | 22   | NC    | 未连接                     | 23   | NC   | 未连接       |
| 24   | GND    | 接地连接                               |      |       |                            |      |      |              |

### M.2 M Key 插槽

板载 1 个 M.2 M Key 插槽，支持 PCIe Gen4 x4，可安装 2230/2242/2260/2280 尺寸的 M.2 NVMe 固态硬盘，方便用户扩展存储需求。

### M.2 E Key 插槽

板载 1 个 M.2 E Key 插槽，支持 PCIe Gen4 x2，可安装 2230 尺寸网卡，方便用户拓展 WiFi 和蓝牙功能。

### 多功能接口（前置面板）

板载的多功能接口用于支持机箱的前面板电源按键、复位按键以及状态指示灯功能。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/pinout_f_panel.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

| 引脚 | 名称     | 描述                         | 引脚 | 名称     | 描述          | 引脚 | 名称     | 描述                |
| ---- | -------- | ---------------------------- | ---- | -------- | ------------- | ---- | -------- | ------------------- |
| 1    | SSD_LED+ | 固态硬盘 (SSD) 活动 LED（+） | 2    | PWR_LED+ | 电源 LED（+） | 3    | SSD_LED- | SSD 活动 LED（-）   |
| 4    | PWR_LED- | 电源 LED（-）                | 5    | RESET-   | 复位开关（-） | 6    | PWR_ON   | 电源开启信号        |
| 7    | RESET+   | 复位开关（+）                | 8    | PWR_GND  | 电源接地      | 9    | RSV(5V)  | 保留引脚（5V 电源） |
| 10   | NC       | 未连接                       |      |          |               |      |          |                     |

### UART 接口

专门引出 4 个专用的 UART 接口，方便用户用于各种调试。

- UART2：BIOS 和操作系统调试日志
- UART4：电源管理、电压和频率监控
- UART5：安全 BootROM 调试日志
- EC UART：板载嵌入式控制器调试日志

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/pinout_uart.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

#### UART_x 引脚图

| 引脚 | 名称 | 描述     | 引脚 | 名称    | 描述                  | 引脚 | 名称    | 描述                  |
| ---- | ---- | -------- | ---- | ------- | --------------------- | ---- | ------- | --------------------- |
| 1    | GND  | 接地连接 | 2    | UART_TX | UART 发送信号（3.3V） | 3    | UART_RX | UART 接收信号（3.3V） |

#### BOOT 引脚图

| 引脚 | 名称       | 描述     | 引脚 | 名称 | 描述     | 引脚 | 名称 | 描述 |
| ---- | ---------- | -------- | ---- | ---- | -------- | ---- | ---- | ---- |
| 1    | BOOT_STRAP | 引导引脚 | 2    | GND  | 接地连接 |      |      |      |

### MIPI CSI 接口

板载 2 个 MIPI CSI 4-lane 接口，可用于连接摄像头模块。

### RTC 电池座

板载的 RTC 电池座可用于安装 CR1220 纽扣电池，为系统提供持续的时钟信号和电源管理功能。

说明：取下 RTC 电池不会立刻清除 BIOS 设置；但若无电池且系统完全断电后再上电，固件可能检测到 RTC 掉电并自动恢复 BIOS 默认值。
