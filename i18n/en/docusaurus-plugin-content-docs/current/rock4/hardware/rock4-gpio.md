---
sidebar_position: 50
---

# ROCK 4 Series GPIO Definition

## GPIO Voltage

RK3399 and OP1 have three IO voltages, 1.8V/3.0V/3.3V. Below is the default voltage:

| GPIO       | Voltage Level | Tolerance |
| ---------- | ------------- | --------- |
| GPIO3_C0   | 3.3V          | 3.465V    |
| ADC_IN0    | 1.8V          | 1.98V     |
| Other GPIO | 3.0V          | 3.14V     |

## GPIO Interface

ROCK 4 series has a 40-pin expansion header. Each pin is distinguished by color.  
The following pin-out is applicable for all products of ROCK 4 series.

<div className='gpio_style'>

:::caution
Not all functions can be turned on at the same time. Only one function can be assigned to a pin at a time.
:::

| GPIO number | Function2 |               Function1                |   GPIO   |               Pin#               |              Pin#               |   GPIO   |                Function1                | Function2  | GPIO number |
| :---------: | :-------: | :------------------------------------: | :------: | :------------------------------: | :-----------------------------: | :------: | :-------------------------------------: | :--------: | :---------: |
|             |           |                 +3.3V                  |          | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |          |                  +5.0V                  |            |             |
|     71      |           |                I2C7_SDA                | GPIO2_A7 |  <div className='green'>3</div>  |  <div className='red'>4</div>   |          |                  +5.0V                  |            |             |
|     72      |           |                I2C7_SCL                | GPIO2_B0 |  <div className='green'>5</div>  | <div className='black'>6</div>  |          |                   GND                   |            |             |
|     75      |           |                SPI2_CLK                | GPIO2_B3 |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO4_C4 | <div className='orange'>UART2_TXD</div> |            |     148     |
|             |           |                  GND                   |          |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO4_C3 | <div className='orange'>UART2_RXD</div> |            |     147     |
|     146     |           |                  PWM0                  | GPIO4_C2 | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO4_A3 |                I2S1_SCLK                |            |     131     |
|     150     |           |                  PWM1                  | GPIO4_C6 | <div className='green'>13</div>  | <div className='black'>14</div> |          |                   GND                   |            |             |
|     149     |           |                SPDIF_TX                | GPIO4_C5 | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO4_D2 |                                         |            |     154     |
|             |           |                 +3.3V                  |          | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO4_D4 |                                         |            |     156     |
|     40      | UART4_TXD | <div className='orange'>SPI1_TXD</div> | GPIO1_B0 | <div className='green'>19</div>  | <div className='black'>20</div> |          |                   GND                   |            |             |
|     39      | UART4_RXD | <div className='orange'>SPI1_RXD</div> | GPIO1_A7 | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO4_D5 |                                         |            |     157     |
|     41      |           | <div className='orange'>SPI1_CLK</div> | GPIO1_B1 | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO1_B2 | <div className='orange'>SPI1_CSn</div>  |            |     42      |
|             |           |                  GND                   |          | <div className='black'>25</div>  | <div className='green'>26</div> |          |                 ADC_IN0                 |            |             |
|     64      |           |                I2C2_SDA                | GPIO2_A0 |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO2_A1 |                I2C2_CLK                 |            |     65      |
|     74      | I2C6_SCL  |                SPI2_TXD                | GPIO2_B2 | <div className='green'>29</div>  | <div className='black'>30</div> |          |                   GND                   |            |             |
|     73      | I2C6_SDA  |                SPI2_RXD                | GPIO2_B1 | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO3_C0 |                SPDIF_TX                 | UART3_CTSn |     112     |
|     76      |           |                SPI2_CSn                | GPIO2_B4 | <div className='green'>33</div>  | <div className='black'>34</div> |          |                   GND                   |            |             |
|     133     |           |              I2S1_LRCK_TX              | GPIO4_A5 | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO4_A4 |              I2S1_LRCK_RX               |            |     132     |
|     158     |           |                                        | GPIO4_D6 | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO4_A6 |                I2S1_SDI                 |            |     134     |
|             |           |                  GND                   |          | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO4_A7 |                I2S1_SDO                 |            |     135     |

</div>

## Notes about 40-pin Header

- Function marked with color orange is the default function of this pin.
- Except Pins for power supply, all pins are routed directly to SoC.
- For pin 3, 5, 27, 28, 29 and 31, each pin is connected to the 3.0V supply through a 4.7K pull-up resistor.
- Pin 7 is routed directly to the pin of MIPI CSI on board.
- SPI
  - Pin 19, 21, 23, 24 also route to the pins of SPI flash on board. If the ROCK 4 model has SPI flash soldered on board, the SPI function is not available on GPIO header.
- UART
  - UART2 is enabled as U-boot and Linux serial console by default. Check Rockpi4/dev/serial-console to use. Check Rockpi4/hardware/devtree_overlays to disable serial console on UART2.
  - UART2 & UART4 support a wide range of baud rate. It includes but not is not limited to the following baud rates. For instance, 115200bps. 500000bps, 1500000bps and so on.
  - For v1.4 and later hardware, on board SPI flash is soldered, UART4 PINs are used as SPI function.
- For I2C-2 and I2C-7
  - We have do the test using the i2c device e2prom. We need to open the i2c device file, and then do the read or write operation.
