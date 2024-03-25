---
sidebar_position: 1
---

# Hardware Overview

We will provide detailed hardware information for the ROCK 5B in this article.

<img src="/img/rock5b/rock-5b-overview.webp" width="800" alt="rock 5b interfaces" />

## Processor (1)

The SoC of the ROCK 5B is the Rockchip RK3588.
The main CPU is a quad-core ARM Cortex-A76 MPCore processor and a quad-core ARM Cortex-A55 MPCore processor,
Both are high-performance, low-power and cached application processors.
The ARM Mali-G610 MP4 3D GPU makes the RK3588 fully compatible with OpenGLES 1.1, 2.0, 3.2, OpenCL 2.2 and Vulkan 1.2.
The special 2D hardware engine with MMU will maximize display performance and provide very smooth operation.
The built-in NPU supports INT4 / INT8 / NT16 / FP16 mixed operations with up to 6 TOPs of computational power.
In addition, network models based on a range of frameworks such as TensorFlow / MXNet / PyTorch / Caffe can be easily implemented due to its strong compatibility.

## Memory (2)

The ROCK 5B's memory is LPDDR 4x, which consists of two 32 bits LPDDR 4x chips making up 64 bits at a frequency of up to 4224 Mhz. The ROCK 5B is available in 4GB, 8GB, and 16GB memory options.

## USB-C Power Supply (3)

The Radxa ROCK 5 Model B is designed as a low power ARM desktop single board computer. It supports the following power inputs:

- Type-C 5V input with a recommended input current of 5A under high load.
- USB PD2.0 power adapter supporting 12V / 15V / 20V with 2A or higher output current.
- Power adapter with fixed 9V to 20V DC voltage and USB-C plugs
- 5V PoE power from GPIO PINs 2 and 4

## HDMI outputs (4 / 5)

## HDMI Input (6)

## USB2.0 (7)

## USB3.0 (8)

## 2.5GbE (9)

## PoE (10)

## M.2 E-KEY (11)

M.2 E key pin signal definition table:

<div className='gpio_style'>

| Pin# | Name                    | Pin# | Name                      | Pin# | Name              | Pin# | Name      |
| :--: | :---------------------- | :--: | :------------------------ | :--: | :---------------- | :--: | :-------- |
|  1   | GND                     |  21  | WIFI_WAKE_HOST_H_GPIO3_D5 |  49  | PCIE20_REFCLKN    |  69  | GND       |
|  2   | VCC3V3_WF               |  22  | UART1_RX_M0               |  50  | WIFIBT_32KIN_1T1R |  70  | BT_WAKE   |
|  3   | USB2_M2_DP              |  23  | WIFI_REG_ON               |  51  | GND               |  71  | NC        |
|  4   | VCC3V3_WF               |  32  | UART1_TX_M0               |  52  | PCIE_PERSTN       |  72  | VCC3V3_WF |
|  5   | USB2_M2_DM              |  33  | GND                       |  53  | PCIE_CLKREQN      |  73  | NC        |
|  6   | WIFI_LED                |  34  | UART1_CTS_M               |  54  | HOST_WAKE_BT_H    |  74  | VCC3V3_WF |
|  7   | GND                     |  35  | PCIE_TXP                  |  55  | PCIE_WAKEN        |  75  | GND       |
|  8   | PCM_CLK/I2S_SCK         |  36  | UART1_RTS_M               |  56  | BT_REG_ON_H       |  76  | GND       |
|  9   | SDIO_CLK                |  37  | PCIE_TXN                  |  57  | GND               |  77  | GND       |
|  10  | PCM_SYNC/I2S_WS         |  38  | NC                        |  58  | I2C4_SDA_M1       |  78  | NC        |
|  11  | SDMMC2_CMD_M0           |  39  | GND                       |  59  | NC                |  79  | NC        |
|  12  | PCM_OUT/I2S SD_OUT      |  40  | NC                        |  60  | I2C4_SCL_M1       |
|  13  | SDMMC2_D0_M0            |  41  | PCIE20_RXP                |  61  | NC                |
|  14  | PCM_IN/I2S SD_IN        |  42  | BT_REG_NO                 |  62  | NC                |
|  15  | SDMMC2_D1_M0            |  43  | PCIE20_RXN                |  63  | GND               |
|  16  | NC                      |  44  | NC                        |  64  | NC                |
|  17  | SDMMC2_D2_M0            |  45  | GND                       |  65  | NC                |
|  18  | GND                     |  46  | NC                        |  66  | NC                |
|  19  | SDMMC2_D3_M0            |  47  | PCIE20_REFC               |  67  | NC                |
|  20  | BT_WAKE_HOST_H_GPIO4_B4 |  48  | NC                        |  68  | NC                |

</div>

## M.2 M-KEY (12)

## eMMC (13)

Onboard Socket Interface Features  
High performance eMMC modules are the best choice for ROCK 5B system storage. eMMC modules are available in 8GB / 16GB / 32GB / 64GB / 128GB.
The eMMC socket pinouts are listed below:

<div className='gpio_style'>

| Name      | Pin# | Pin# | Name       |
| :-------- | :--: | :--: | :--------- |
| GND       |  1   |  34  | GND        |
| EMMC_D5   |  2   |  33  | EMMC_D6    |
| GND       |  3   |  32  | GND        |
| EMMC_D4   |  4   |  31  | EMMC_D7    |
| GND       |  5   |  30  | GND        |
| EMMC_D0   |  6   |  29  | EMMC_D1    |
| GND       |  7   |  28  | GND        |
| EMMC_CLK  |  8   |  27  | EMMC_D2    |
| GND       |  9   |  26  | GND        |
| EMMC_D3   |  10  |  25  | EMMC_CMD   |
| GND       |  11  |  24  | GND        |
| EMMC_RSTN |  12  |  23  | VCC3V3_SYS |
| GND       |  13  |  22  | VCC3V3_SYS |
| GND       |  14  |  21  | VCC_1V8    |
| EMMC_RCLK |  15  |  20  | VCC_1V8    |
| GND       |  16  |  19  | GND        |
| GND       |  17  |  18  | GND        |

</div>

## TF Card Slot (14)

The TF card can be used as system storage or external storage.

When it is used as system storage, you should preferably choose one with more than 8GB of storage space.

When it is used as external storage, you can choose the storage space up to 128GB.

When the TF card is inserted into the TF card slot, the system will automatically recognize the device.

The interface pin specifications of the TF card are shown below:

| Pin# | Name         |
| :--: | :----------- |
|  1   | SDMMC0_D2    |
|  2   | SDMMC0_D3    |
|  3   | SDMMC0_CMD   |
|  4   | VCC3V3_SYS   |
|  5   | SDMMC0_CLK   |
|  6   | GND          |
|  7   | SDMMC0_D0    |
|  8   | SDMMC0_D1    |
|  9   | SDMMC0_DET_L |
|  10  | GND          |
|  11  | GND          |
|  12  | GND          |
|  13  | GND          |

## Earphones (15)

## MIPI CSI (16)

Please refer to MIPI [camera compatibility](../getting-started/accessory-usage#Camera).

## MIPI DSI (17)

Please refer to MIPI [screen compatibility](../getting-started/accessory-usage#Screen).

## 40 PIN GPIO (18)

#### GPIO Voltage

| GPIO       | Voltage | Max.  |
| ---------- | ------- | ----- |
| All GPIOs  | 3.3V    | 3.63V |
| SARADC_IN4 | 3.3V    | 1.98V |

#### GPIO Interface

The ROCK 5B is supplied with a 40pin pin GPIO cradle that is compatible with most sensor applications on the market.

**_Hint:_ Actual compatibility is subject to use. **

- The ROCK5B has a 40-pin expansion connector. Each pin is color coded.

<div className='gpio_style' style={{ overflow :"auto"}}>

| GPIO number |  Function8  |  Function7   |  Function6   |  Function5  |   Function4   |  Function3  | Function2  | Function1 |               Pin#               |              Pin#               | Function1  | Function2  | Function3  |                 Function4                 |  Function5  |  Function6   |  Function7   | Function8 | GPIO number |
| :---------: | :---------: | :----------: | :----------: | :---------: | :-----------: | :---------: | :--------: | :-------: | :------------------------------: | :-----------------------------: | :--------: | :--------: | :--------: | :---------------------------------------: | :---------: | :----------: | :----------: | :-------: | :---------: |
|             |             |              |              |             |               |             |            |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V    |            |            |                                           |             |              |              |           |             |
|     139     |             |              | I2S1_SDO2_M0 | I2C7_SDA_M3 | UART8_CTSN_M0 | PWM15_IR_M1 | CAN1_TX_M1 | GPIO4_B3  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V    |            |            |                                           |             |              |              |           |             |
|     138     |             |              | I2S1_SDO1_M0 | I2C7_SCL_M3 | UART8_RTSN_M0 |  PWM14_M1   | CAN1_RX_M1 | GPIO4_B2  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND     |            |            |                                           |             |              |              |           |             |
|     115     |             | SPI1_CS1_M1  |              | I2C8_SDA_M4 | UART7_CTSN_M1 | PWM15_IR_M0 |            | GPIO3_C3  |  <div className='green'>7</div>  | <div className='green'>8</div>  |  GPIO0_B5  |            |            | <div className='orange'>UART2_TX_M0</div> | I2C1_SCL_M0 | I2S1_MCLK_M1 |              |           |     13      |
|             |             |              |              |             |               |             |            |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> |  GPIO0_B6  |            |            | <div className='orange'>UART2_RX_M0</div> | I2C1_SDA_M0 | I2S1_SCLK_M1 |              |           |     14      |
|     113     |             | SPI1_CLK_M1  |              |             |  UART7_RX_M1  |             |            | GPIO3_C1  | <div className='green'>11</div>  | <div className='green'>12</div> |  GPIO3_B5  | CAN1_RX_M0 |  PWM12_M0  |                UART3_TX_M1                |             | I2S2_SCLK_M1 |              |           |     109     |
|     111     |             | SPI1_MOSI_M1 |              | I2C3_SCL_M1 |               |             |            | GPIO3_B7  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND     |            |            |                                           |             |              |              |           |             |
|     112     |             | SPI1_MISO_M1 |              | I2C3_SDA_M1 |  UART7_TX_M1  |             |            | GPIO3_C0  | <div className='green'>15</div>  | <div className='green'>16</div> |  GPIO3_A4  |            |            |                                           |             |              |              |           |     100     |
|             |             |              |              |             |               |             |            |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> |  GPIO4_C4  |            |  PWM5_M2   |                                           |             |              | SPI3_MISO_M0 |           |     148     |
|     42      |             | SPI0_MOSI_M2 |              |             |  UART4_RX_M2  |             |            | GPIO1_B2  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND     |            |            |                                           |             |              |              |           |             |
|     41      |             | SPI0_MISO_M2 |              |             |               |             |            | GPIO1_B1  | <div className='green'>21</div>  | <div className='green'>22</div> | SARADC_IN4 |            |            |                                           |             |              |              |           |             |
|     43      |             | SPI0_CLK_M2  |              |             |  UART4_TX_M2  |             |            | GPIO1_B3  | <div className='green'>23</div>  | <div className='green'>24</div> |  GPIO1_B4  |            |            |                UART7_RX_M2                |             |              | SPI0_CS0_M2  |           |     44      |
|             |             |              |              |             |               |             |            |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> |  GPIO1_B5  |            |            |                UART7_TX_M2                |             |              | SPI0_CS1_M2  |           |     45      |
|     150     |             | SPI3_CLK_M0  |              | I2C0_SDA_M1 |               | PWM7_IR_M3  |            | GPIO4_C6  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  |  GPIO4_C5  |            |  PWM6_M2   |                                           | I2C0_SCL_M1 |              | SPI3_MOSI_M0 |           |     149     |
|     63      |             |              |              |             | UART1_CTSN_M1 | PWM15_IR_M3 |            | GPIO1_D7  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND     |            |            |                                           |             |              |              |           |             |
|     47      | SPDIF_TX_M0 |              |              |             |  UART1_RX_M1  |  PWM13_M2   |            | GPIO1_B7  | <div className='green'>31</div>  | <div className='green'>32</div> |  GPIO3_C2  |            |  PWM14_M0  |               UART7_RTSN_M1               | I2C8_SCL_M4 |              | SPI1_CS0_M1  |           |     114     |
|     103     |             |              |              |             |               |   PWM8_M0   |            | GPIO3_A7  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND     |            |            |                                           |             |              |              |           |             |
|     110     |             |              | I2S2_LRCK_M1 |             |  UART3_RX_M1  |  PWM13_M0   | CAN1_TX_M0 | GPIO3_B6  | <div className='green'>35</div>  | <div className='green'>36</div> |  GPIO3_B1  |            |  PWM2_M1   |                UART2_TX_M2                |             |              |              |           |     105     |
|             |             |              |              |             |               |             |            | GPIO0_A0  | <div className='green'>37</div>  | <div className='green'>38</div> |  GPIO3_B2  |            | PWM3_IR_M1 |                UART2_RX_M2                |             | I2S2_SDI_M1  |              |           |     106     |
|             |             |              |              |             |               |             |            |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> |  GPIO3_B3  |            |            |                UART2_RTSN                 |             | I2S2_SDO_M1  |              |           |     107     |

</div>

## SPI NOR Flash (19)

## RTC Batteries (20)

The RTC connectors are designed to follow standard connector types.

You can tell '+3.3V' and '-' from the silkscreen on the board.

| Pin# | Name  |
| :--: | :---- |
|  1   | GND   |
|  2   | +3.3V |

## Recovery button (21)

The ROCK 5B supports loader mode, which is a special operation mode in which the CPU waits for commands from the USB OTG port.

The Recovery button is used to upgrade the image of SPI NOR Flash or eMMC on the board.

The following are the steps to boot the device into loader mode.

- Ensure that the U-Boot image has been pre-installed on the SPI NOR Flash or eMMC.
- Press and hold the Recovery button
- Plug the USB-A to C cable into the Type-C port of the ROCK 5B and the other end into your computer.
- Wait for about 5 seconds
- Make sure the ROCK 5B is in loader mode.

```bash
#For macOS host:
	lsusb result
Output:Bus 000 Device 004: ID 2207:350b Fuzhou Rockchip Electronics Co., Ltd. Composite Device

#For Linux host:
	lsusb result
Output：Bus 001 Device 030: ID 2207:350b Fuzhou Rockchip Electronics Company

#For Windows host:
Open RKDevTool and you would see the device is in Found One MASKROM Device.
```

## Power button (22)

The power button is used to turn the device on or off.
A short press on the power button turns the power of the device on/off. This is what we call power on/off via software.
The power button also provides hardware power on/off of the device.
You can turn off the device in this way when the system crashes.
Press and hold the power button for at least 6 seconds. Then release the power button.
After that, a short press on the power button will power on the device.

## RGB LED (23)

Consult [LED Guidelines] (../os-config/rsetup#leds).

## Fan (24)

You can check [rsetup: thermal-governor](../os-config/rsetup#thermal-governor) for fan settings.
Definition table (top to bottom in the image):

| Pin# | Name  |
| :--: | :---- |
|  1   | +5.0V |
|  2   | GND   |

## Maskrom Button (25)

The ROCK 5B supports Maskrom mode, a special mode of operation in which the CPU waits for commands from the USB OTG port.

When you need to write an image to the SPI NOR Flash or eMMC board, you need to use the Maskrom button to enter the Maskrom mode.

## WIFI

[Please refer to the supported WIFI models](../accessories/wifi_bt_access)
