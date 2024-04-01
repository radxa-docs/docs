---
sidebar_position: 4
---

# 硬件接口说明

## Interfaces Overview

- **ZERO 2 PRO**
  ![ZERO 2 PRO Overview](/img/zero/zero2pro/zero2pro-mark.webp)

## USB OTG（Power Connection）

The ZERO 2 PRO is powered by a Type-C connector with an input voltage of 5V, and it is recommended to use a power adapter with a rated maximum current of more than 2A.  
The official [Radxa Power PD 30W] is recommended (... /accessories/pd-30w). <img src="/img/accessories/pd-30w.webp" alt="Radxa Power PD 30W" width="300" />  
This interface can be used to connect peripherals such as keyboard, mouse, and USB flash drive.

## TYPE-c USB3.0

This interface can be used to connect peripherals such as keyboards, mice, and USB flash drives.

## 40 PIN GPIO

#### GPIO voltage

| GPIO        | Voltage | Max voltage |
| ----------- | ------- | ----------- |
| 所有的 GPIO | 3.3V    | 3.3V        |

#### GPIO Interface

The ZERO 2 PRO provides a 40 pin GPIO socket that is compatible with most SBC accessories on the market.

**Hint: Actual compatibility is subject to usage. \*\*\*\***

<div className='gpio_style'>

|   Function5   | Function4 | Function3  |   Function2   | Function1 |               Pin#               |              Pin#               | Function1  |                  Function2                  | Function3 | Function4 |   Function5   |
| :-----------: | :-------: | :--------: | :-----------: | :-------: | :------------------------------: | :-----------------------------: | :--------: | :-----------------------------------------: | :-------: | :-------: | :-----------: |
|               |           |            |               |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V    |                                             |           |           |               |
|               |           |            | I2C_EE_M3_SDA | GPIOA_14  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V    |                                             |           |           |               |
|               |           |            | I2C_EE_M3_SCL | GPIOA_15  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND     |                                             |           |           |               |
|               |           |   PWM_D    | I2C_AO_M0_SDA |  GPIO_Z2  |  <div className='green'>7</div>  | <div className='green'>8</div>  |  GPIOAO_0  | <div className='orange'>UART_AO_A_TXD</div> |           |           |               |
|               |           |            |               |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> |  GPIOAO_1  | <div className='orange'>UART_AO_A_RXD</div> |           |           |               |
|               |           |            |               |  GPIO_Z3  | <div className='green'>11</div>  | <div className='green'>12</div> |  GPIOA_1   |                                             |           |           |               |
|               |           |            |               |  GPIO_Z4  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND     |                                             |           |           |               |
|               |           |            |               |  GPIO_Z5  | <div className='green'>15</div>  | <div className='green'>16</div> |  GPIOZ_8   |                                             |           |           |               |
|               |           |            |               |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> |  GPIOZ_6   |                                             |           |           |               |
|               |           | SPI_B_MOSI | UART_EE_C_RTS |  GPIOH_4  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND     |                                             |           |           |               |
|               |   PWM_F   | SPI_B_MISO | UART_EE_C_CTS |  GPIOH_5  | <div className='green'>21</div>  | <div className='green'>22</div> |  GPIOZ_9   |                                             |           |           |               |
| I2C_EE_M1_SCL |   PWM_B   | SPI_B_SCLK | UART_EE_C_TX  |  GPIOH_7  | <div className='green'>23</div>  | <div className='green'>24</div> |  GPIOH_6   |                UART_EE_C_RX                 | SPI_B_SS0 |           | I2C_EE_M1_SDA |
|               |           |            |               |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> | SARADC_CH2 |                                             |           |           |               |
|               |           |   PWM_B    | I2C_EE_M0_SDA |  GPIOZ_0  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  |  GPIOZ_1   |                I2C_EE_M0_SCL                |   PWM_C   |           |               |
|               |           |            |               | GPIOAO_7  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND     |                                             |           |           |               |
|               |           |            |     PWM_D     |  GPIOA_4  | <div className='green'>31</div>  | <div className='green'>32</div> |  GPIOA_0   |                                             |           |           |               |
|               |           |            | UART_AO_B_TX  | GPIOAO_8  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND     |                                             |           |           |               |
|               |           |            |               |  GPIOA_2  | <div className='green'>35</div>  | <div className='green'>36</div> |  GPIOA_3   |                                             |           |           |               |
|               |           |            | UART_AO_B_RX  | GPIOAO_9  | <div className='green'>37</div>  | <div className='green'>38</div> |  GPIOA_5   |                                             |           |           |               |
|               |           |            |               |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> |  GPIOZ_7   |                I2C_EE_M0_SDA                |           |           |               |

</div>

## MIPI DSI

| PIN | PIN definition |
| :-: | :------------: |
|  1  |    LCD_VCC     |
|  2  |   VDDIO_AO18   |
|  3  |       NC       |
|  4  |    TDMB_D2     |
|  5  |       NC       |
|  6  |      GND       |
|  7  |   MIPI_D0_N    |
|  8  |   MIPI_D0_P    |
|  9  |      GND       |
| 10  |   MIPI_D1_N    |
| 11  |   MIPI_D1_P    |
| 12  |      GND       |
| 13  |   MIPI_CLK_N   |
| 14  |   MIPI_CLK_P   |
| 15  |      GND       |
| 16  |   MIPI_D2_N    |
| 17  |   MIPI_D2_P    |
| 18  |      GND       |
| 19  |   MIPI_D3_N    |
| 20  |   MIPI_D3_P    |
| 21  |      GND       |
| 22  |      GND       |
| 23  |    TP_RESET    |
| 24  |    VCC3.3V     |
| 25  |   TOUCH_INT    |
| 26  | TOUCH_I2C_SDA  |
| 27  | TOUCH_I2C_SCL  |
| 28  |      GND       |
| 29  |      GND       |
| 30  |    LCD_VCC     |
| 31  |    LCD_VCC     |
| 32  |      GND       |
| 33  |      GND       |
| 34  |    VCC_LEDK    |
| 35  |    VCC_LEDK    |
| 36  |       NC       |
| 37  |       NC       |
| 38  |    VCC_LEDA    |
| 39  |    VCC_LEDA    |

## MIPI CSI

| PIN | PIN definition |
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

The Radxa ZERO 2 PRO has a micro HDMI video output port on board, which requires a micro HDMI to standard HDMI cable to connect to the monitor.  
The resolution of the HDMI output depends on the monitor, and the Radxa ZERO 2 PRO will adjust to the optimal display resolution according to the monitor.

## eMMC

On-board [eMMC on the back of the development board] (../hardware-design/hardware-interfaceInterfaces-Overview) for eMMC booting or data storage.

## WIFI/BT

ZERO 2 PRO has a Wi-Fi 5 (802.11 b/g/n/ac) & BT 5.0 with BLE wireless module on board.

## MicroSD card slot

For MicroSD card boot or data storage.

## Power button

For switching on/off

## Maskrom Button

The ZERO 2 PRO supports Maskrom mode, which is a special mode of operation in which the CPU waits for commands from the USB OTG port.
When you need to write image to eMMC, you need to use Maskrom button to enter Maskrom mode.

## Fan Socket

| PIN | PIN definition |
| :-: | :------------: |
|  1  |      GND       |
|  2  |   GPIOAO-11    |
|  3  |     VCC5V      |
