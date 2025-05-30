---
sidebar_position: 3
---

# Interface Information

## Chip Block Diagram

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/hardware-rk3576.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## System Block Diagram

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/hardware-rk3576-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Interface Specifications

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description                    | Qty |
| :-: | :----------------------------- | :-: |
|  ①  | USB Type-C Power Port          |  1  |
|  ②  | User LED                       |  1  |
|  ③  | Power LED                      |  1  |
|  ④  | Power Button                   |  1  |
|  ⑤  | FPC Connector                  |  1  |
|  ⑥  | WiFi6 and Bluetooth 5.4        |  1  |
|  ⑦  | External Antenna Connector     |  1  |
|  ⑧  | 40 Pin GPIO                    |  1  |
|  ⑨  | LPDDR5 Memory                  |  1  |
|  ⑩  | PoE Port                       |  1  |
|  ⑪  | Maskrom Button                 |  1  |
|  ⑫  | USB 2.0 Type-A                 |  2  |
|  ⑬  | Rockchip RK3576 (J)            |  1  |
|  ⑭  | USB 3.0 Type-A                 |  2  |
|  ⑮  | SPI NOR Flash                  |  1  |
|  ⑯  | Gigabit Ethernet (PoE Support) |  1  |
|  ⑰  | Fan Connector                  |  1  |
|  ⑱  | Headphone Jack                 |  1  |
|  ⑲  | MIPI CSI Connector             |  1  |
|  ⑳  | HDMI 2.1 Port                  |  1  |
| ㉑  | Recovery Port                  |  1  |
| ㉒  | UFS Module Connector           |  1  |
| ㉓  | RTC Connector                  |  1  |
| ㉔  | eMMC Module Connector          |  1  |
| ㉕  | MIPI CSI Connector             |  1  |
| ㉖  | MicroSD Card Slot              |  1  |
| ㉗  | MIPI DSI Connector             |  1  |

## Interface Usage

Mainly introduce the interfaces that can be expanded on Radxa ROCK 4D.

### 40 Pin GPIO

Support external expansion of the GPIO pins on the board, supporting UART, SPI, I2C, I2S, PWM, CAN, ADC, etc.

| Function7     | Function6    | Function5   | Function4    | Function3   | Function2     | Function1  | Pin | Pin | Function1  | Function2         | Function3      | Function4    | Function5   | Function6    | Function7     |
| ------------- | ------------ | ----------- | ------------ | ----------- | ------------- | ---------- | --- | --- | ---------- | ----------------- | -------------- | ------------ | ----------- | ------------ | ------------- |
|               |              |             |              |             |               | 3V3        | 1   | 2   | 5V         |                   |                |              |             |              |               |
|               | PDM0_SDI1_M2 |             |              | I2C8_SDA_M1 | UART2_RX_M0   | GPIO1_C7_d | 3   | 4   | 5V         |                   |                |              |             |              |               |
|               | PDM0_SDI0_M2 |             |              | I2C8_SCL_M1 | UART2_TX_M0   | GPIO1_C6_d | 5   | 6   | GND        |                   |                |              |             |              |               |
|               |              |             | SPI2_CSN0_M1 | I2C6_SDA_M1 | UART4_CTSN_M1 | GPIO1_C3_u | 7   | 8   | GPIO0_D4_u | UART0_TX_M0_DEBUG |                |              |             |              |               |
|               |              |             |              |             |               | GND        | 9   | 10  | GPIO0_D5_u | UART0_RX_M0_DEBUG |                |              |             |              |               |
| UART2_RTSN_M0 |              |             | SPI2_MOSI_M1 |             | UART4_TX_M1   | GPIO1_C4_d | 11  | 12  | GPIO1_D1_d | UART10_RX_M1      | I3C0_SDA_PU_M1 |              |             | SAI2_SCLK_M0 |               |
|               |              | PWM1_CH0_M2 |              |             |               | GPIO2_C0_d | 13  | 14  | GND        |                   |                |              |             |              |               |
| UART2_CTSN_M0 |              |             | SPI2_MISO_M1 |             | UART4_RX_M1   | GPIO1_C5_d | 15  | 16  | GPIO2_B6_d | UART7_TX_M0       | I2C8_SCL_M2    |              |             |              |               |
|               |              |             |              |             |               | 3V3        | 17  | 18  | GPIO2_B7_d | UART7_RX_M0       | I2C8_SDA_M2    |              |             |              |               |
|               | SAI3_LRCK_M1 | PWM1_CH1_M1 | SPI1_MOSI_M0 | I2C9_SCL_M1 |               | GPIO1_B5_d | 19  | 20  | GND        |                   |                |              |             |              |               |
|               | SAI3_SDO_M1  |             | SPI1_MISO_M0 |             | UART3_CTSN_M2 | GPIO1_B6_d | 21  | 22  | GPIO2_D7_d |                   |                |              | PWM2_CH7_M2 |              |               |
|               | SAI3_SCLK_M1 | PWM1_CH0_M1 | SPI1_CLK_M0  | I2C9_SDA_M1 |               | GPIO1_B4_d | 23  | 24  | GPIO1_B7_d |                   |                | SPI1_CSN0_M0 |             | SAI3_SDI_M1  | UART3_RTSN_M2 |
|               |              |             |              |             |               | GND        | 25  | 26  | GPIO1_C0_d | UART3_TX_M2       |                | SPI1_CSN1_M0 | PWM0_CH0_M1 | PDM0_SDI2_M2 |               |
| CAN1_RX_M1    | SAI4_SCLK_M2 | PWM2_CH3_M1 |              | I2C6_SDA_M3 |               | GPIO4_C7_d | 27  | 28  | GPIO4_C6_d |                   | I2C6_SCL_M3    |              | PWM2_CH2_M1 | SAI4_SDI_M2  | CAN1_TX_M1    |
| CAN1_TX_M3    |              |             |              |             |               | GPIO3_A2_d | 29  | 30  | GND        |                   |                |              |             |              |               |
| PDM0_CLK0_M2  | SAI3_MCLK_M1 |             |              |             | UART3_RX_M2   | GPIO1_C1_d | 31  | 32  | GPIO1_D5_d | UART10_CTSN_M1    | I2C5_SDA_M1    | SPI2_CLK_M1  |             | PDM0_CLK1_M2 |               |
|               |              | PWM1_CH2_M1 | SPI2_CSN1_M1 | I2C6_SCL_M1 | UART4_RTSN_M1 | GPIO1_C2_u | 33  | 34  | GND        |                   |                |              |             |              |               |
|               | SAI2_LRCK_M0 | PWM1_CH3_M1 |              | I3C0_SCL_M1 |               | GPIO1_D2_d | 35  | 36  | GPIO1_D4_d | UART10_RTSN_M1    | I2C5_SCL_M1    |              |             | SAI2_MCLK_M0 | PDM0_SDI3_M2  |
| CAN1_RX_M3    |              |             |              |             |               | GPIO3_A3_d | 37  | 38  | GPIO1_D3_d |                   | I3C0_SDA_M1    |              | PWM1_CH4_M1 | SAI2_SDI_M0  |               |
|               |              |             |              |             |               | GND        | 39  | 40  | GPIO1_D0_d | UART10_TX_M1      |                |              |             | SAI2_SDO_M0  |               |

### USB Type-C Power Port

Radxa ROCK 4D supports Type-C and GPIO power supply. We recommend using a Type-C power adapter to power it. Please ensure that the power adapter can provide 5V power input and be compatible with PD protocol.

:::tip
Radxa ROCK 4D only supports 5V power input, it is recommended to use a current of 2A or more to ensure stable operation of all peripherals.

Reference power:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)

- Standard Type-C power adapter (5V power input, PD protocol supported, recommended current 2A or more)
  :::

### Power Button

Short press to trigger power-on or power menu, long press to power off.

### FPC Connector

Support FPC PCIe expansion interface, can be used to connect expansion accessories.

### External Antenna Connector

Support external antenna connection for the board's WiFi6 and Bluetooth 5.4 chips.

### PoE Port

Support external PoE power connection for the board's PoE interface.

### Maskrom Button

Press the Maskrom button before power-on, and release it after power-on to enter Maskrom mode.

### USB 2.0 Type-A

Support two USB 2.0 interfaces, used to connect external devices such as keyboards, mice, storage devices, etc.

### USB 3.0 Type-A

Support high-speed USB 3.0 interface, used to connect external devices such as storage devices, network adapters, etc.

:::tip

1. You can check if the USB device is recognized by repeatedly plugging and unplugging the USB device, and then inputting the `lsusb` command in the system command line.
2. The upper layer Type-A interface of USB 3.0 supports OTG function.
   :::

### Gigabit Ethernet Port

Support 1Gbps Ethernet port (support PoE, need to connect HAT).

### Fan Connector

Support 1× 2-pin 1.25mm PWM control fan interface.

### Headphone Jack

Support 3.5mm four-segment headphone jack, supporting microphone input.

### MIPI CSI Connector

Support MIPI CSI interface, used to connect high-definition cameras.

### HDMI 2.1 Port

Support HDMI 2.1 interface, supports high-definition video output, up to 4K@120fps.

### Recovery Connector

Short-circuit the Recovery connector to enter Recovery mode.

### UFS Module Connector

Support UFS 2.0 interface, used to connect expansion storage devices and boot systems.

### RTC Connector

Support RTC real-time clock module interface, can connect RTC module to maintain system time.

### eMMC 5.1 Connector

Support eMMC 5.1 interface, used to connect expansion storage devices and boot systems.

### MIPI CSI Connector

Support MIPI CSI interface, used to connect high-definition cameras.

### MicroSD Card Slot

Support MicroSD card slot, used to connect expansion storage devices and boot systems.

### MIPI DSI Connector

Support MIPI DSI interface, used to connect high-definition displays.
