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
   <img src="/img/orion/o6n/orion-o6n-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6n/orion-o6n-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                                  | 序号 | 说明                | 序号 | 说明                |
| ---- | ------------------------------------- | ---- | ------------------- | ---- | ------------------- |
| 1    | USB Type-C 接口（支持 DP 视频输出）   | 9    | 12V DC 供电（5525） | 17   | M.2 B Key 3042 插槽 |
| 2    | 4-Pin 风扇接口（支持 PWM 调速与测速） | 10   | 标准 DP 接口        | 18   | Nano SIM 卡槽       |
| 3    | 40-Pin GPIO 排针                      | 11   | 标准 HDMI 接口      | 19   | 此芯 P1 SoC         |
| 4    | MIPI CSI 接口（4-lane）               | 12   | 2x USB 3.0 Type-A   | 20   | UFS 模块连接座      |
| 5    | LPDDR5                                | 13   | USB 2.0 Type-A      | 21   | RTC 电池接口        |
| 6    | M.2 E Key 2230 插槽                   | 14   | 电源按键            | 22   | 2x 2.5G 以太网      |
| 7    | MIPI CSI 接口（4-lane）               | 15   | 5V / 12V 电源接口   | 23   | 2x USB 2.0 Type-A   |
| 8    | M.2 M Key 2280 插槽                   | 16   | M.2 M Key 2280 插槽 |      |                     |

### 电源接口

板载 12V DC 供电接口（5525 插头）和 5V / 12V 电源接口，为主板提供稳定电源。

- 12V DC 供电接口（推荐使用）：支持外部 12V 直流电源输入
- 5V / 12V 电源接口：支持通过 12V 和 GND 引脚为主板供电，5V 引脚支持电源输出，不支持输入功能

### 电源按键

主要用于控制主板的电源开关。

- 主板系统关闭时，按下电源按键可启动主板
- 主板系统运行时，短按电源按键会触发电源事件，根据操作系统设置，操作可显示电源菜单或进入系统挂起模式。
- 长按电源按键 4 秒会触发强制关机。

### USB Type-C 端口

板载 1 个 USB Type-C 接口，支持 DP 视频输出，最高传输速度可达 10Gbps。

### USB Type-A 端口

板载 3 个 USB 2.0 Type-A 端口、2 个 USB 3.2 Type-A 端口。

- USB 2.0 Type-A：最高传输速率 480Mbps，所有 USB 2.0 端口共享 1.4A 总电流
- USB 3.2 Type-A：最高传输速率 10Gbps，每个端口电流限制为 1A

### HDMI 接口

板载 HDMI A 型接口，最高支持 4K@60Hz，不支持 HDMI CEC 功能。

### DP 接口

板载 DP 接口，最高支持 4K@120Hz，支持多流传输（MST）功能。

### 2.5G 以太网口

板载双 2.5G RJ45 以太网口，支持 10/100/1000/2500 Mbps 自适应速率。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/rj45_led.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

| LED  | 状态 | 描述                                   |
| ---- | ---- | -------------------------------------- |
| 橙色 | 常亮 | 链路已建立（设备已连接到网络）         |
| 绿色 | 闪烁 | 正在进行数据传输（网络活动中）         |
| 关闭 | -    | 未检测到链路（网线未插或存在网络问题） |

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

### 40-Pin GPIO 排针

板载 40-Pin GPIO（通用输入输出）接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 40-Pin GPIO 接口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网（IoT）、机器人控制、工业自动化等领域的原型开发与功能验证。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/pinout_gpio.webp" style={{width: '15%', maxWidth: '1200px', transform: 'rotate(90deg)'}} />
</div>

<TabItem value="Orion O6">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

| Function2 | Function1 |               Pin#               |              Pin#               | Function1 | Function2 |
| --------- | --------- | :------------------------------: | :-----------------------------: | --------- | --------- |
|           | 3.3V      | <div className='yellow'>1</div>  |  <div className='red'>2</div>   | 5V        |           |
| GPIO      | I2C4_SDA  |  <div className='green'>3</div>  |  <div className='red'>4</div>   | 5V        |           |
| GPIO      | I2C4_SCL  |  <div className='green'>5</div>  | <div className='black'>6</div>  | GND       |           |
| GPIO      | GPIO71    |  <div className='green'>7</div>  | <div className='green'>8</div>  | UART2_TX  | GPIO103   |
|           | GND       |  <div className='black'>9</div>  | <div className='green'>10</div> | UART2_RX  | GPIO104   |
| GPIO95    | PWM       | <div className='green'>11</div>  | <div className='green'>12</div> | I2S4_SCLK | GPIO91    |
| GPIO96    | PWM       | <div className='green'>13</div>  | <div className='black'>14</div> | GND       |           |
| GPIO105   | UART3_TXD | <div className='green'>15</div>  | <div className='green'>16</div> | UART3_RXD | GPIO106   |
|           | 3.3V      | <div className='yellow'>17</div> | <div className='green'>18</div> |           | GPIO44    |
| GPIO141   | SPI2_MOSI | <div className='green'>19</div>  | <div className='black'>20</div> | GND       |           |
| GPIO138   | SPI2_MISO | <div className='green'>21</div>  | <div className='green'>22</div> |           | GPIO45    |
| GPIO142   | SPI2_CLK  | <div className='green'>23</div>  | <div className='green'>24</div> | SPI2_CS0  | GPIO139   |
|           | GND       | <div className='black'>25</div>  | <div className='green'>26</div> | SPI2_CS1  | GPIO140   |
| GPIO56    | I2C2_SDA  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | I2C2_SCL  | GPIO55    |
| GPIO76    |           | <div className='green'>29</div>  | <div className='black'>30</div> | GND       |           |
| GPIO78    |           | <div className='green'>31</div>  | <div className='green'>32</div> |           | GPIO46    |
| GPIO79    |           | <div className='green'>33</div>  | <div className='black'>34</div> | GND       |           |
| GPIO92    | I2S4_TWS  | <div className='green'>35</div>  | <div className='green'>36</div> | I2S4_MCLK | GPIO090   |
| GPIO80    |           | <div className='green'>37</div>  | <div className='green'>38</div> | I2S4_SDI  | GPIO93    |
|           | GND       | <div className='black'>39</div>  | <div className='green'>40</div> | I2S4_SDO  | GPIO94    |

   </div>
</TabItem>

### M.2 M Key 插槽

板载 2 个 M.2 M Key 插槽，支持 PCIe Gen4 x4，可安装 2280 尺寸的 M.2 NVMe 固态硬盘，方便用户扩展存储需求。

### M.2 E Key 插槽

板载 1 个 M.2 E Key 插槽，支持 PCIe Gen4 x2，可安装 2230 尺寸的 WiFi/蓝牙网卡，方便用户拓展 WiFi 和蓝牙功能。

### M.2 B Key 插槽

板载 1 个 M.2 B Key 插槽，可安装 3042 尺寸的 4G 模块，搭配 SIM 卡实现移动网络连接功能。

### SIM 卡槽

板载 1 个 SIM 卡槽，支持 nano SIM 卡，用于 4G 网络连接。

说明：其中 SIM 卡检测脚 CD 连接 GND。

### UFS 模块连接座

板载 UFS 模块连接座，用于连接 UFS 存储模块，可拓展系统存储和充当系统启动盘。

### MIPI CSI 接口

板载 2 个 MIPI CSI 4-lane 接口，可用于连接摄像头模块。

### RTC 电池接口

板载 2-Pin 1.25mm RTC 接口，可连接 CR2032 型号的纽扣电池。

说明：RTC 接口的箭头丝印指向负极（GND），VCC 连接 3.3V（示意图中的红线代表 VCC，黑线代表 GND）。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6n/orion-o6n-rtc.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
