---
sidebar_position: 4
---

# 硬件接口说明

## 接口总览

- **ZERO 2 PRO**
  ![ZERO 2 PRO Overview](/img/zero/zero2pro/zero2pro-mark.webp)

## USB OTG（电源接口）

ZERO 2 PRO 采用 Type-C 接口供电，输入电压为 5V，建议使用额定最大电流大于 2A 的电源适配器。  
推荐使用官方的 [Radxa Power PD 30W](../accessories/power/pd_30w) 。<img src="/img/accessories/power/power-pd-30w.webp" alt="Radxa Power PD 30W" width="300" />  
此接口可用于连接键盘、鼠标、U 盘等外设。

## TYPE-c USB3.0

此接口可用于连接键盘、鼠标、U 盘等外设。

## 40 PIN GPIO

#### GPIO 电压

| GPIO        | 电压 | 最高 |
| ----------- | ---- | ---- |
| 所有的 GPIO | 3.3V | 3.3V |

#### GPIO 接口

ZERO 2 PRO 提供了一个 40 pin 针脚的 GPIO 座子，与市场上大多数的 SBC 配件兼容。

**提示：实际兼容情况以使用情况为准。**

<TabItem value="Zero 2 Pro">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

| GPIO number | Function6 |   Function5   |   Function4   |   Function3   |   Function2   | Function1 |               Pin#               |              Pin#               | Function1  |                  Function2                  |   Function3   |   Function4   |   Function5   |   Function5   | GPIO number |
| :---------: | :-------: | :-----------: | :-----------: | :-----------: | :-----------: | :-------: | :------------------------------: | :-----------------------------: | :--------: | :-----------------------------------------: | :-----------: | :-----------: | :-----------: | :-----------: | :---------: |
|             |           |               |               |               |               |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V    |                                             |               |               |               |               |             |
|     490     |           |               |               | I2C_EE_M3_SDA |  WORLD_SYNC   | GPIOA_14  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V    |                                             |               |               |               |               |             |
|     491     |           |               |               | I2C_EE_M3_SCL | IR_REMOTE_IN  | GPIOA_15  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND     |                                             |               |               |               |               |             |
|     429     |           |   TDMC_DIN0   |    TDMC_D0    | TSIN_B_VALID  |     PWM_D     |  GPIO_Z2  |  <div className='green'>7</div>  | <div className='green'>8</div>  |  GPIOAO_0  | <div className='orange'>UART_AO_A_TXD</div> |               |               |               |               |     412     |
|             |           |               |               |               |               |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> |  GPIOAO_1  | <div className='orange'>UART_AO_A_RXD</div> |               |               |               |               |     413     |
|     430     |           |               |   TDMC_DIN1   |    TDMC_D1    |  TSIN_B_SOP   |  GPIO_Z3  | <div className='green'>11</div>  | <div className='green'>12</div> |  GPIOA_1   |                  TDMB_SCLK                  | TDMB_SLV_SCLK |               |               |               |     477     |
|     431     |           |               |   TDMC_DIN2   |    TDMC_D2    |  TSIN_B_DIN0  |  GPIO_Z4  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND     |                                             |               |               |               |               |             |
|     432     |           |               |   TDMC_DIN3   |    TDMC_D3    |  TSIN_B_CLK   |  GPIO_Z5  | <div className='green'>15</div>  | <div className='green'>16</div> |  GPIOZ_8   |              ETH_RGMII_TX_CLK               | BT656_A_DIN4  |  TSIN_B_DIN2  |    MCLK_1     | I2C_EE_M0_SCL |     435     |
|             |           |               |               |               |               |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> |  GPIOZ_6   |                 TSIN_B_FAIL                 |    TDMC_FS    |  TDMC_SLV_FS  |               |               |     433     |
|     447     |           |               |               |  SPI_B_MOSI   | UART_EE_C_RTS |  GPIOH_4  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND     |                                             |               |               |               |               |             |
|     448     | TDMB_DIN3 |    TDMB_D3    |     PWM_F     |  SPI_B_MISO   | UART_EE_C_CTS |  GPIOH_5  | <div className='green'>21</div>  | <div className='green'>22</div> |  GPIOZ_9   |                  ETH_TXEN                   | BT656_A_DIN5  |  TSIN_B_DIN3  |               |               |     436     |
|     450     |           |     PWM_B     | I2C_EE_M1_SCL |  SPI_B_SCLK   | UART_EE_C_TX  |  GPIOH_7  | <div className='green'>23</div>  | <div className='green'>24</div> |  GPIOH_6   |                UART_EE_C_RX                 |   SPI_B_SS0   | I2C_EE_M1_SDA | IR_REMOTE_OUT |               |     449     |
|             |           |               |               |               |               |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> | SARADC_CH2 |                                             |               |               |               |               |             |
|     427     |           |               |               |     PWM_B     | I2C_EE_M0_SDA |  GPIOZ_0  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  |  GPIOZ_1   |                I2C_EE_M0_SCL                |     PWM_C     |               |               |               |     428     |
|     419     |           |               |  TDMB_SLV_FS  |    TDMB_FS    |  TSIN_A_DIN0  | GPIOAO_7  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND     |                                             |               |               |               |               |             |
|     480     |           |               |     PWM_D     |   TDMB_DIN1   |    TDMB_D1    |  GPIOA_4  | <div className='green'>31</div>  | <div className='green'>32</div> |  GPIOA_0   |                   MCLK_0                    |               |               |               |               |     476     |
|     420     |           | TDMB_SLV_SCLK |   TDMB_SCLK   |  TSIN_A_CLK   | UART_AO_B_TX  | GPIOAO_8  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND     |                                             |               |               |               |               |             |
|     478     |           |               |               |  TDMB_SLV_FS  |    TDMB_FS    |  GPIOA_2  | <div className='green'>35</div>  | <div className='green'>36</div> |  GPIOA_3   |                   TDMB_D0                   |   TDMB_DIN0   |               |               |               |     479     |
|     421     |           |    MCLK_0     | TSIN_A_VALID  | UART_AO_B_RX  | IR_REMOTE_OUT | GPIOAO_9  | <div className='green'>37</div>  | <div className='green'>38</div> |  GPIOA_5   |                  PDM_DIN3                   |   TDMB_DIN2   |    TDMB_D2    |               |               |     481     |
|             |           |               |               |               |               |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> |  GPIOZ_7   |                I2C_EE_M0_SDA                |  TSIN_B_DIN1  |   TDMC_SCLK   | TDMC_SLV_SCLK |               |     434     |

   </div>
</TabItem>

## MIPI DSI

| PIN |   PIN 定义    |
| :-: | :-----------: |
|  1  |    LCD_VCC    |
|  2  |  VDDIO_AO18   |
|  3  |      NC       |
|  4  |    TDMB_D2    |
|  5  |      NC       |
|  6  |      GND      |
|  7  |   MIPI_D0_N   |
|  8  |   MIPI_D0_P   |
|  9  |      GND      |
| 10  |   MIPI_D1_N   |
| 11  |   MIPI_D1_P   |
| 12  |      GND      |
| 13  |  MIPI_CLK_N   |
| 14  |  MIPI_CLK_P   |
| 15  |      GND      |
| 16  |   MIPI_D2_N   |
| 17  |   MIPI_D2_P   |
| 18  |      GND      |
| 19  |   MIPI_D3_N   |
| 20  |   MIPI_D3_P   |
| 21  |      GND      |
| 22  |      GND      |
| 23  |   TP_RESET    |
| 24  |    VCC3.3V    |
| 25  |   TOUCH_INT   |
| 26  | TOUCH_I2C_SDA |
| 27  | TOUCH_I2C_SCL |
| 28  |      GND      |
| 29  |      GND      |
| 30  |    LCD_VCC    |
| 31  |    LCD_VCC    |
| 32  |      GND      |
| 33  |      GND      |
| 34  |   VCC_LEDK    |
| 35  |   VCC_LEDK    |
| 36  |      NC       |
| 37  |      NC       |
| 38  |   VCC_LEDA    |
| 39  |   VCC_LEDA    |

## MIPI CSI

| PIN |    PIN 定义    |
| :-: | :------------: |
|  1  |      GND       |
|  2  |  MIPI_CSI_D3N  |
|  3  |  MIPI_CSI_D3P  |
|  4  |      GND       |
|  5  |  MIPI_CSI_D2N  |
|  6  |  MIPI_CSI_D2P  |
|  7  |      GND       |
|  8  | MIPI_CSI_CLKBN |
|  9  | MIPI_CSI_CLKBP |
| 10  |      GND       |
| 11  |  MIPI_CSI_D1N  |
| 12  |  MIPI_CSI_D1P  |
| 13  |      GND       |
| 14  |  MIPI_CSI_D0N  |
| 15  |  MIPI_CSI_D0P  |
| 16  |      GND       |
| 17  | MIPI_CSI_CLKAN |
| 18  | MIPI_CSI_CLKAP |
| 19  |      GND       |
| 20  |    CM_MCLK     |
| 21  |      GND       |
| 22  |    CM_MCLK     |
| 23  |   CM_PWRDN_1   |
| 24  |   CM_I2C_SCL   |
| 25  |   CM_I2C_SDA   |
| 26  |     CM_FS      |
| 27  |    CM_RST_L    |
| 28  |    VCC3.3V     |
| 29  |    VCC3.3V     |
| 30  |     VCC5V      |
| 31  |     VCC5V      |

## Micro HDMI

Radxa ZERO 2 PRO 板载一个 micro HDMI 的视频输出接口，需要使用 micro HDMI 转标准 HDMI 线连接显示器。  
HDMI 的输出分辨率取决于显示器，Radxa ZERO 2 PRO 会根据显示器调整到最佳的显示分辨率。

## eMMC

板载的 [eMMC 位于开发板背面](../hardware-design/hardware-interface#接口总览)，用于 eMMC 启动或数据存储。我们提供从无到 128GB 的选项。

## WIFI/BT

ZERO 2 PRO 板载一个 Wi-Fi 5 (802.11 b/g/n/ac) & BT 5.0 with BLE 无线模块。

## MicroSD 卡槽

用于 MicroSD 卡启动或数据存储。

## Power 按钮

用于开关机

## Maskrom 按钮

ZERO 2 PRO 支持 Maskrom 模式，这是 CPU 等待 USB OTG 端口命令的一种特殊操作模式。
当需要把镜像写到 eMMC 上时，需要使用 Maskrom 按钮进入 Maskrom 模式。

## Fan 插座

| PIN | PIN 定义  |
| :-: | :-------: |
|  1  |    GND    |
|  2  | GPIOAO-11 |
|  3  |   VCC5V   |
