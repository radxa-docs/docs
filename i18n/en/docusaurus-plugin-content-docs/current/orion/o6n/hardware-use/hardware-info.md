---
sidebar_position: 10
---

# Hardware Information

## Chip Block Diagram

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-p1-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## System Block Diagram

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Interface Description

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description                                 | No. | Description         | No. | Description           |
| --- | ------------------------------------------- | --- | ------------------- | --- | --------------------- |
| 1   | USB Type-C Port (Supports DP Video Output)  | 9   | 12V DC Power (5525) | 17  | M.2 B Key 3042 Slot   |
| 2   | 4-Pin Fan Header (PWM Speed Control & Tach) | 10  | Standard DP Port    | 18  | Nano SIM Card Slot    |
| 3   | 40-Pin GPIO Header                          | 11  | Standard HDMI Port  | 19  | ZX P1 SoC             |
| 4   | MIPI CSI Interface (4-lane)                 | 12  | 2x USB 3.0 Type-A   | 20  | UFS Module Connector  |
| 5   | LPDDR5                                      | 13  | USB 2.0 Type-A      | 21  | RTC Battery Connector |
| 6   | M.2 E Key 2230 Slot                         | 14  | Power Button        | 22  | 2x 2.5G Ethernet      |
| 7   | MIPI CSI Interface (4-lane)                 | 15  | 5V / 12V Power Port | 23  | 2x USB 2.0 Type-A     |
| 8   | M.2 M Key 2280 Slot                         | 16  | M.2 M Key 2280 Slot |     |                       |

### Power Interface

Onboard 12V DC power interface (5525 plug) and 5V / 12V power port provide stable power supply to the motherboard.

- 12V DC Power Interface (Recommended): Supports external 12V DC power input
- 5V / 12V Power Port: Supports powering the motherboard through 12V and GND pins. The 5V pin supports power output only, not input.

### Power Button

Mainly used to control the power switch of the motherboard.

- When the motherboard is powered off, press the power button to start the motherboard
- When the motherboard is running, a short press of the power button will trigger a power event, which may display the power menu or put the system into suspend mode, depending on the operating system settings
- Press and hold the power button for 4 seconds to force shutdown

### USB Type-C Port

Onboard 1x USB Type-C port supporting DP video output, with maximum transfer speed up to 10Gbps.

### USB Type-A Ports

Onboard 3x USB 2.0 Type-A ports and 2x USB 3.2 Type-A ports.

- USB 2.0 Type-A: Maximum transfer rate 480Mbps, all USB 2.0 ports share 1.4A total current
- USB 3.2 Type-A: Maximum transfer rate 10Gbps, each port current limited to 1A

### HDMI Port

Onboard HDMI Type-A port, supporting up to 4K@60Hz, does not support HDMI CEC function.

### DisplayPort

Onboard DP port, supporting up to 4K@120Hz, with Multi-Stream Transport (MST) support.

### 2.5G Ethernet Ports

Onboard dual 2.5G RJ45 Ethernet ports, supporting 10/100/1000/2500 Mbps auto-negotiation.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6/rj45_led.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

| LED    | Status   | Description                                         |
| ------ | -------- | --------------------------------------------------- |
| Orange | Solid    | Link established (device connected to network)      |
| Green  | Blinking | Data transmission in progress (network activity)    |
| Off    | -        | No link detected (cable unplugged or network issue) |

### Fan Interface

Onboard standard ATX 4-Pin fan header, supporting PWM control and tachometer.

Note: The motherboard has silk-screen labels for easy identification and connection.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6/pinout_fan.webp" style={{width: '20%', maxWidth: '1200px'}} />
</div>

| Pin | Name | Description               | Pin | Name   | Description | Pin | Name | Description                            |
| --- | ---- | ------------------------- | --- | ------ | ----------- | --- | ---- | -------------------------------------- |
| 1   | GND  | Ground connection         | 2   | VCC12V | Power (12V) | 3   | TACH | Tachometer signal (fan speed feedback) |
| 4   | PWM  | PWM control signal (3.3V) |     |        |             |     |      |                                        |

### 40-Pin GPIO Header

Onboard 40-Pin GPIO (General Purpose Input/Output) interface, providing highly flexible interface support for hardware expansion.

Users can connect various sensors, actuators, communication modules, displays, and other embedded peripherals through the 40-Pin GPIO interface, enabling rapid prototyping and functional verification in fields such as IoT, robotics control, and industrial automation.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6/pinout_gpio.webp" style={{width: '15%', maxWidth: '1200px', transform: 'rotate(90deg)'}} />
</div>

<TabItem value="Orion O6">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

| Function3 | Function2 | Function1 |               Pin#               |              Pin#               | Function1 |   Function2   |
| :-------: | :-------: | :-------: | :------------------------------: | :-----------------------------: | :-------: | :-----------: |
|           |           |   3.3V    | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |    5V     |               |
|           | I2C4_SDA  |  GPIO062  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |    5V     |               |
|           | I2C4_SCL  |  GPIO061  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |               |
|           |           |  GPIO071  |  <div className='green'>7</div>  | <div className='green'>8</div>  |  GPIO103  |   UART2_TX    |
|           |           |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> |  GPIO104  |   UART2_RX    |
| UART0_TXD |   PWM0    |  GPIO095  | <div className='green'>11</div>  | <div className='green'>12</div> |  GPIO091  |   I2S4_SCLK   |
| UART0_RXD |   PWM1    |  GPIO096  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |               |
|           | UART3_TXD |  GPIO105  | <div className='green'>15</div>  | <div className='green'>16</div> |  GPIO106  |   UART3_RXD   |
|           |           |   3.3V    | <div className='yellow'>17</div> | <div className='green'>18</div> |  GPIO044  |               |
|           | SPI2_MOSI |  GPIO141  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |               |
|           | SPI2_MISO |  GPIO138  | <div className='green'>21</div>  | <div className='green'>22</div> |  GPIO045  |               |
|           | SPI2_CLK  |  GPIO142  | <div className='green'>23</div>  | <div className='green'>24</div> |  GPIO139  |   SPI2_CS0    |
|           |           |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> |  GPIO140  |   SPI2_CS1    |
|           | I2C2_SDA  |  GPIO056  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  |  GPIO055  |   I2C2_SCL    |
|           |           |  GPIO076  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |      GND      |
|           |           |  GPIO078  | <div className='green'>31</div>  | <div className='green'>32</div> |  GPIO046  |               |
|           |           |  GPIO079  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |               |
|           | I2S4_TWS  |  GPIO092  | <div className='green'>35</div>  | <div className='green'>36</div> |  GPIO090  |   I2S4_MCLK   |
|           |           |  GPIO080  | <div className='green'>37</div>  | <div className='green'>38</div> |  GPIO093  | I2S4_DATA_IN  |
|           |           |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> |  GPIO094  | I2S4_DATA_OUT |

   </div>
</TabItem>

### M.2 M Key Slots

Onboard 2x M.2 M Key slots, supporting PCIe Gen4 x4, compatible with 2280-sized M.2 NVMe SSDs for expanding storage needs.

### M.2 E Key Slot

Onboard 1x M.2 E Key slot, supporting PCIe Gen4 x2, compatible with 2230-sized WiFi/Bluetooth modules for wireless connectivity.

### M.2 B Key Slot

Onboard 1x M.2 B Key slot, compatible with 3042-sized 4G modules for mobile network connectivity when used with a SIM card.

### SIM Card Slot

Onboard 1x nano SIM card slot for 4G network connectivity.

Note: The SIM card detection pin (CD) is connected to GND.

### UFS Module Connector

Onboard UFS module connector for connecting UFS storage modules, which can be used to expand system storage or as a boot device.

### MIPI CSI Interfaces

Onboard 2x MIPI CSI 4-lane interfaces for connecting camera modules.

### RTC Battery Interface

Onboard 2-Pin 1.25mm RTC interface for connecting a CR2032 coin cell battery.

Note: The silkscreen arrow on the RTC interface points to the negative pole (GND), with VCC connected to 3.3V (red wire represents VCC, black wire represents GND in the diagram).

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-rtc.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
