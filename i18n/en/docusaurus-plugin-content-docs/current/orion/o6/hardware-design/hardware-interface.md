---
sidebar_position: 6
---

# Hardware Interface Description

## SoC Block Diagram

<img src="/img/o6/cd8180-block-diagram.webp" alt="cd8180 system diagram" width="700" />

## System Block Diagram

<img src="/img/o6/o6-system-block-diagram.webp" alt="o6 system diagram" width="700" />

# Board Layout

The detailed <span id="o6-layout">layout of the O6 motherboard</span>, with numbered labels, is as follows:

![Orion O6 Motherboard layout and component labels](/img/o6/rs600_layout.webp)

| No. | Description                      | No. | Description                        | No. | Description                       |
| --- | -------------------------------- | --- | ---------------------------------- | --- | --------------------------------- |
| ①   | [PCIe X16 Slot](#circle-1)       | ⑩   | [Double USB 3.2](#circle-10)       | ⑲   | [ATX Power Connector](#circle-19) |
| ②   | [M.2 M Key](#circle-2)           | ⑪   | [Double USB 2.0](#circle-11)       | ⑳   | [F_USB Connector](#circle-20)     |
| ③   | [M.2 E Key](#circle-3)           | ⑫   | [USB-C Ports](#circle-12)          | ㉑  | [F_Audio Connector](#circle-21)   |
| ④   | [On board Status LED](#circle-4) | ⑬   | [Power Button](#circle-13)         | ㉒  | [TP Connector](#circle-22)        |
| ⑤   | [Reset Button](#circle-5)        | ⑭   | [FAN Connector](#circle-14)        | ㉓  | [F_Panel Connector](#circle-23)   |
| ⑥   | [Headphone Jack](#circle-6)      | ⑮   | [BIOS Flash Holder](#circle-15)    | ㉔  | [Debug Connector](#circle-24)     |
| ⑦   | [RJ45 Ethernets](#circle-7)      | ⑯   | [40Pin GPIO Connector](#circle-16) | ㉕  | [eDP Connector](#circle-25)       |
| ⑧   | [DP Port](#circle-8)             | ⑰   | [CPU Cix CD8180](#circle-17)       | ㉖  | [RTC Battery Holder](#circle-26)  |
| ⑨   | [HDMI Port](#circle-9)           | ⑱   | [LPDDR5 RAM](#circle-18)           |     |                                   |

**Component List**

## Back Panel

### <span id="circle-13">Power Button</span> <span id="#o6-layout">⑬</span>

The O6 board includes a dedicated power button for manual power control.

- **When the OS is running**: Short press the power button to trigger a power event. Depending on the OS settings, this action may display the power menu, initiate a shutdown, or put the system into suspend mode.
- **When the OS is powered of**: Short press the power button to power on the board.
- **Long press (4 seconds)**: Forces the board to power off.

### <span id="circle-12">USB-C Ports</span> [⑫](#o6-layout)

The dual USB‑C ports on the O6 support **USB 3.2 Gen 2 (10Gbps)**, **DP Alt Mode (4K@60Hz)**, and **Power Delivery (PD)**.

- A **65W PD power supply(20V / 3.25A)** is recommended for powering the O6 from the USB‑C port.

- Either USB‑C port can power the board. If two power sources are connected simultaneously (e.g., when using two USB‑C monitors with PD capability), the first plugged‑in PD source will supply power to the board.

- Each USB‑C port can deliver up to **3A** to power external USB‑C devices.

### <span id="circle-11">Double USB 2.0</span> [⑪](#o6-layout)

The double‑layer USB 2.0 host ports provide standard USB support. The combined current limit for the two ports is **1.4A**.

### <span id="circle-10">Double USB 3.2</span> [⑩](#o6-layout)

The dual USB 3.2 host ports on the O6 provide **SuperSpeed USB (10Gbps)**. Each port has a current limit of **1A**.

### <span id="circle-9">HDMI</span> [⑨](#o6-layout)

The HDMI Type‑A port on the O6 supports a maximum resolution of **4K@60Hz**. Note that **HDMI CEC** is not supported.

### <span id="circle-8">DP</span> [⑧](#o6-layout)

The DisplayPort (DP) on the O6 supports a maximum resolution of **4K@120Hz** and offers **2x MST (Multi‑Stream Transport)** capability.

### <span id="circle-7">Double 5GbE</span> [⑦](#o6-layout)

The dual Ethernet ports provide a wired connection with speeds up to **5Gbps**. The LED indicators for these ports are described below:

<table>
  <tr>
    <td>
      <img src="/img/o6/rj45_led.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>LED</th>
            <th>State</th>
            <th>Meaning</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Orange</td>
            <td>Solid</td>
            <td>Link established (device is connected to the network)</td>
          </tr>
          <tr>
            <td>Green</td>
            <td>Blinking</td>
            <td>Data transmission occurring (network activity)</td>
          </tr>
          <tr>
            <td>Off</td>
            <td>-</td>
            <td>No link detected (cable unplugged or network issue)</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

### <span id="circle-6">Headphone Jack</span> [⑥](#o6-layout)

The **3.5mm headphone jack** on the O6 supports both audio input and output. It can drive standard headphones and is compatible with commonly used ring configurations.

### <span id="circle-5">Reset Button</span> [⑤](#o6-layout)

The O6 is equipped with a reset button for system resets. A short press will reboot the system.

## Internal Components

### <span id="circle-17">CPU - Cix CD8180</span> [⑰](#o6-layout)

The CPU on the O6 board, the Cix CD8180, is soldered directly onto the board and is non‑replaceable.

### <span id="circle-18">DRAM</span> [⑱](#o6-layout)

The DRAM on the O6 is soldered onto the board and is non‑replaceable. It consists of four 32‑bit LPDDR5 chips combined into a 128‑bit memory bus, achieving speeds of up to **5500 MT/s**, with a total bandwidth of **0 GB/s**.

### <span id="circle-1">PCIe X16 Slot</span> [①](#o6-layout)

The O6 features a **full‑size PCIe X16 slot**, supporting **PCIe Gen4 x8** signals. PCIe bifurcation is not supported for this port.

- Power supply:
  - **With ATX power**: Maximum power from the PCIe slot is **60W**.
  - **With USB－C PD power**: Maximum power from the PCIe slot is **15W**.

### <span id="circle-2">M.2 M Key</span> [②](#o6-layout)

An M.2 M Key connector is provided on the O6, supporting **2230**, **2242**, **2260**, and **2280** SSD types. The connector offers **PCIe Gen4 x4 signals**.

- Power supply:
  - **Constant power**: **15W**
  - **Peak power**: **28W**

### <span id="circle-3">M.2 E Key</span> [③](#o6-layout)

A M.2 E Key connector is provided on O6, with 2230 WiFi / BT card support. PCIe Gen4 x2 and USB 2.0 signal is available from the connector. Constant 15W peak 28W powed is supplied from this connector.

### <span id="circle-4">on board LED</span> [④](#o6-layout)

Two LEDs are included on the O6 board:

- **Green LED**：Indicates power status.
- **Blue LED**：Indicates system status.
  - When the BIOS is running, the Blue LED remains on.
  - When the OS is running, the Blue LED blinks to represent the system heartbeat.

### <span id="circle-14">Fan Connector</span> [⑭](#o6-layout)

The O6 features a standard ATX fan connector. The pinout is defined as follows:

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_fan.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>Pin.</th>
            <th>Name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>2</td>
            <td>VCC12V</td>
            <td>Power supply (12V)</td>
          </tr>
          <tr>
            <td>3</td>
            <td>TACH</td>
            <td>Tachometer signal (fan speed feedback)</td>
          </tr>
          <tr>
            <td>4</td>
            <td>PWM</td>
            <td>Pulse Width Modulation control signal (3.3V)</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**F_Panel Connector Pinout**

### <span id="circle-15">BIOS Flash chip Holder</span> [⑮](#o6-layout)

The O6 board includes a BIOS flash chip holder designed for developers to easily remove or replace the BIOS chip.

- **Chip compatibility**:Supports SOP8 footprint flash chips.
- **Chip capacity**:8MB（64Mbit）。
- **Voltage level**:1.8V。

This feature facilitates firmware development and debugging by allowing convenient BIOS chip replacement.

### <span id="circle-16">40Pin GPIO Connector</span> [⑯](#o6-layout)

A 40‑pin GPIO connector is included on the O6 board, designed for low‑speed bus connections and general‑purpose input/output (GPIO) functionality.

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_gpio.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>Pin.</th>
            <th>Name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>3.3 V</td>
            <td>Power supply(3.3V)</td>
          </tr>
          <tr>
            <td>2</td>
            <td>5V</td>
            <td>Power supply(5V)</td>
          </tr>
          <tr>
            <td>3</td>
            <td>SDA</td>
            <td>I2C data line (3.3V)</td>
          </tr>
          <tr>
            <td>4</td>
            <td>5V</td>
            <td>Power supply(5V)</td>
          </tr>
          <tr>
            <td>5</td>
            <td>SCL</td>
            <td>I2C clock line (3.3V)</td>
          </tr>
          <tr>
            <td>6</td>
            <td>UART3_TXD</td>
            <td>UART3 transmit signal (3.3V)</td>
          </tr>
          <tr>
            <td>7</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>8</td>
            <td>UART3_RXD</td>
            <td>UART3 receive signal(3.3V)</td>
          </tr>
          <tr>
            <td>9</td>
            <td>GND</td>
            <td>Ground</td>
          </tr>
          <tr>
            <td>10</td>
            <td>I2S4_SCK</td>
            <td>I2S4 serial clock (3.3V)</td>
          </tr>
          <tr>
            <td>11</td>
            <td>GPIO_PWM</td>
            <td>GPIO with PWM capability (3.3V)</td>
          </tr>
          <tr>
            <td>12</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>13</td>
            <td>GPIO_PWM</td>
            <td>GPIO with PWM capability (3.3V)</td>
          </tr>
          <tr>
            <td>14</td>
            <td>GND</td>
            <td>Ground</td>
          </tr>
          <tr>
            <td>15</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>16</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>17</td>
            <td>3.3 V</td>
            <td>Power supply (3.3V)</td>
          </tr>
          <tr>
            <td>18</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>19</td>
            <td>SPI2_MOSI</td>
            <td>SPI2 master‑out/slave‑in signal (3.3V)</td>
          </tr>
          <tr>
            <td>20</td>
            <td>GND</td>
            <td>Ground</td>
          </tr>
          <tr>
            <td>21</td>
            <td>SPI2_MISO</td>
            <td>SPI2 master-in/slave-out signal (3.3V)</td>
          </tr>
          <tr>
            <td>22</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>23</td>
            <td>SPI2_CLK</td>
            <td>SPI2 clock signal (3.3V)</td>
          </tr>
          <tr>
            <td>24</td>
            <td>SPI2_CS0</td>
            <td>SPI2 chip select 0 (3.3V)</td>
          </tr>
          <tr>
            <td>25</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>26</td>
            <td>SPI2_CS1</td>
            <td>SPI2 chip select 1 (3.3V)</td>
          </tr>
          <tr>
            <td>27</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>28</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>29</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>30</td>
            <td>GND</td>
            <td>Ground</td>
          </tr>
          <tr>
            <td>31</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>32</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>33</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>34</td>
            <td>GND</td>
            <td>Ground</td>
          </tr>
          <tr>
            <td>35</td>
            <td>I2S4_TWS</td>
            <td>I2S4 word select (3.3V)</td>
          </tr>
          <tr>
            <td>36</td>
            <td>I2S4_MCLK</td>
            <td>I2S4 master clock (3.3V)</td>
          </tr>
          <tr>
            <td>37</td>
            <td>GPIO</td>
            <td>General-purpose I/O (3.3V)</td>
          </tr>
          <tr>
            <td>38</td>
            <td>I2S4_DATA_IN</td>
            <td>I2S4 data input (3.3V)</td>
          </tr>
          <tr>
            <td>39</td>
            <td>GND</td>
            <td>Ground</td>
          </tr>
          <tr>
            <td>40</td>
            <td>I2S4_DATA_OUT</td>
            <td>I2S4 data output (3.3V)</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**40Pin GPIO Pinout**

### <span id="circle-19">ATX Power Connector</span> [⑲](#o6-layout)

An ATX‑compatible 24‑pin power connector is included on the O6 board for standard ATX power supply compatibility.

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_atx_power.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>Pin.</th>
            <th>Name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>3</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>5</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>7</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>8</td>
            <td>PWR_OK</td>
            <td>Power good signal (logic high: 3.3V or 5V)</td>
          </tr>
          <tr>
            <td>9</td>
            <td>5VSB</td>
            <td>Standby power supply (+5V, always on)</td>
          </tr>
          <tr>
            <td>10</td>
            <td>12V</td>
            <td>Power supply (+12V)</td>
          </tr>
          <tr>
            <td>11</td>
            <td>12V</td>
            <td>Power supply (+12V)</td>
          </tr>
          <tr>
            <td>13</td>
            <td>NC</td>
            <td>Not connected</td>
          </tr>
          <tr>
            <td>14</td>
            <td>NC</td>
            <td>Not connected</td>
          </tr>
          <tr>
            <td>15</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>16</td>
            <td>PS_ON</td>
            <td>Power supply on (active low signal)</td>
          </tr>
          <tr>
            <td>17</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>18</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>19</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>20</td>
            <td>NC</td>
            <td>Not connected</td>
          </tr>
          <tr>
            <td>21</td>
            <td>NC</td>
          <td>Not connected</td>
        </tr>
        <tr>
          <td>22</td>
          <td>NC</td>
          <td>Not connected</td>
        </tr>
        <tr>
          <td>23</td>
          <td>NC</td>
          <td>Not connected</td>
        </tr>
        <tr>
          <td>24</td>
          <td>GND</td>
          <td>Ground connection</td>
        </tr>
      </tbody>
    </table>
  </td>
</tr>
</table>

**ATX Power Connector Pinout**

### <span id="circle-20">F_USB Connector</span> [⑳](#o6-layout)

The F_USB connector is designed to support the front panel USB functionality of a PC enclosure. The pinout configuration is as follows:

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_f_usb.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>Pin.</th>
            <th>Name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>5V_1</td>
            <td>Power supply (+5V)</td>
          </tr>
          <tr>
            <td>2</td>
            <td>5V_2</td>
            <td>Power supply (+5V)</td>
          </tr>
          <tr>
            <td>3</td>
            <td>USB_DM_1</td>
            <td>USB data negative signal</td>
          </tr>
          <tr>
            <td>4</td>
            <td>USB_DM_2</td>
            <td>USB data negative signal</td>
          </tr>
          <tr>
            <td>5</td>
            <td>USB_DP_1</td>
            <td>USB data positive signal</td>
          </tr>
          <tr>
            <td>6</td>
            <td>USB_DP_2</td>
            <td>USB data positive signal</td>
          </tr>
          <tr>
            <td>7</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>8</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>9</td>
            <td>/</td>
            <td>Reserved or not connected</td>
          </tr>
          <tr>
            <td>10</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**F_USB Connector Pinout**

### <span id="circle-21">F_Audio Connector</span> [㉑](#o6-layout)

The F_Audio connector is designed to support the front panel audio functionality of a PC enclosure. The pinout configuration is as follows:

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_f_audio.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>Pin.</th>
            <th>Name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>MIC_INL</td>
            <td>Microphone input (Left)</td>
          </tr>
          <tr>
            <td>2</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>3</td>
            <td>MIC_INR</td>
            <td>Microphone input (Right)</td>
          </tr>
          <tr>
            <td>4</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>5</td>
            <td>HP_OUT_R</td>
            <td>Headphone output (Right)</td>
          </tr>
          <tr>
            <td>6</td>
            <td>FRONT_MIC_JD</td>
            <td>Front microphone jack detection</td>
          </tr>
          <tr>
            <td>7</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>8</td>
            <td>/</td>
            <td>Reserved or not connected</td>
          </tr>
          <tr>
            <td>9</td>
            <td>HP_OUT_L</td>
            <td>Headphone output (Left)</td>
          </tr>
          <tr>
            <td>10</td>
            <td>FRONT_HP_JD</td>
            <td>Front headphone jack detection</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**F_Audio Connector Pinout**

### <span id="circle-22">TP Connector</span> [㉒](#o6-layout)

A touch panel connector is included on the O6 board to enable touch panel integration. Combined with the eDP connector, it provides a direct interface for connecting a touchscreen.

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_tp.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>Pin.</th>
            <th>Name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Reset</td>
            <td>Reset signal for touch controller (3.3V)</td>
          </tr>
          <tr>
            <td>2</td>
            <td>VCC</td>
            <td>Power supply for touch panel (3.3V)</td>
          </tr>
          <tr>
            <td>3</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>4</td>
            <td>EINT</td>
            <td>External interrupt signal (3.3V)</td>
          </tr>
          <tr>
            <td>5</td>
            <td>SDA</td>
            <td>I2C data line for touch communication (3.3V)</td>
          </tr>
          <tr>
            <td>6</td>
            <td>SCL</td>
            <td>I2C clock line for touch communication (3.3V)</td>
          </tr>
          <tr>
            <td>7</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>8</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**Touch Panel Connector Pinout**

### <span id="circle-23">F_Panel Connector</span> [㉓](#o6-layout)

The F_Panel connector is designed to support the front panel power button, reset button, and LED functionality of a PC enclosure. The pinout configuration is as follows:

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_f_panel.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>Pin.</th>
            <th>Name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>SSD_LED+</td>
            <td>Solid State Drive (SSD) activity LED (+)</td>
          </tr>
          <tr>
            <td>2</td>
            <td>PWR_LED+</td>
            <td>Power LED (+)</td>
          </tr>
          <tr>
            <td>3</td>
            <td>SSD_LED-</td>
            <td>SSD activity LED (‑)</td>
          </tr>
          <tr>
            <td>4</td>
            <td>PWR_LED-</td>
            <td>Power LED (‑)</td>
          </tr>
          <tr>
            <td>5</td>
            <td>RESET-</td>
            <td>Reset switch (‑)</td>
          </tr>
          <tr>
            <td>6</td>
            <td>PWR_ON</td>
            <td>Power switch ON signal</td>
          </tr>
          <tr>
            <td>7</td>
            <td>RESET+</td>
            <td>Reset switch (+)</td>
          </tr>
          <tr>
            <td>8</td>
            <td>PWR_GND</td>
            <td>Power ground</td>
          </tr>
          <tr>
            <td>9</td>
            <td>RSV(5V)</td>
            <td>Reserved pin (5V power supply)</td>
          </tr>
          <tr>
            <td>10</td>
            <td>NC</td>
            <td>Not connected</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**F_Panel Connector Pinout**

### <span id="circle-24">Debug Connectors</span> [㉔](#o6-layout)

Four dedicated UART interfaces are included on the O6 board for various debugging purposes. Additionally, an EC UART is provided for the EC serial console.

- **UART2**：BIOS and OS debug logs
- **UART4**：Power management, voltage, and frequency monitoring
- **UART5**：Secure BootROM debug logs
- **EC UART**：On board Embedded Controller debug logs

The UART pinout configuration is as follows:

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_uart.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th colspan="3">UART_x Pinout</th>
          </tr>
          <tr>
            <th>Pin.</th>
            <th>Name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>2</td>
            <td>UART_TX</td>
            <td>UART transmit signal(3.3V)</td>
          </tr>
          <tr>
            <td>3</td>
            <td>UART_RX</td>
            <td>UART receive signal(3.3V)</td>
          </tr>
        </tbody>
      </table>
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th colspan="3">BOOT Pinout</th>
          </tr>
          <tr>
            <th>Pin.</th>
            <th>Name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>BOOT_STRAP</td>
            <td>Boot Strap Pin</td>
          </tr>
          <tr>
            <td>2</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**Debug Connector Pinout**

### <span id="circle-25">eDP Connector</span> [㉕](#o6-layout)

A 40‑pin eDP connector is included on the O6 board to enable direct connection to eDP panels, supporting resolutions up to **4K@60Hz**. The connector uses an **IPEX 40‑pin, 0.5mm pitch** design. The eDP connector provides a maximum power output of **12V / 2A**.

<table>
  <tr>
    <td>
      <img src="/img/o6/pinout_eDP.webp" width="100%" height="auto" />
    </td>
    <td>
      <table>
        <thead>
          <tr>
            <th>Pin.</th>
            <th>Name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>NC</td>
            <td>Not Connected</td>
          </tr>
          <tr>
            <td>2</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>3</td>
            <td>3N</td>
            <td>eDP Lane 3 Negative Signal</td>
          </tr>
          <tr>
            <td>4</td>
            <td>3P</td>
            <td>eDP Lane 3 Positive Signal</td>
          </tr>
          <tr>
            <td>5</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>6</td>
            <td>2N</td>
            <td>eDP Lane 2 Negative Signal</td>
          </tr>
          <tr>
            <td>7</td>
            <td>2P</td>
            <td>eDP Lane 2 Positive Signal</td>
          </tr>
          <tr>
            <td>8</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>9</td>
            <td>1N</td>
            <td>eDP Lane 1 Negative Signal</td>
          </tr>
          <tr>
            <td>10</td>
            <td>1P</td>
            <td>eDP Lane 1 Positive Signal</td>
          </tr>
          <tr>
            <td>11</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>12</td>
            <td>0N</td>
            <td>eDP Lane 0 Negative Signal</td>
          </tr>
          <tr>
            <td>13</td>
            <td>0P</td>
            <td>eDP Lane 0 Positive Signal</td>
          </tr>
          <tr>
            <td>14</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>15</td>
            <td>AUXP</td>
            <td>eDP Auxiliary Channel Positive</td>
          </tr>
          <tr>
            <td>16</td>
            <td>AUXN</td>
            <td>eDP Auxiliary Channel Negative</td>
          </tr>
          <tr>
            <td>17</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>18</td>
            <td>VDD1</td>
            <td>Power Supply (+3.3V)</td>
          </tr>
          <tr>
            <td>19</td>
            <td>VDD2</td>
            <td>Power Supply (+3.3V)</td>
          </tr>
          <tr>
            <td>20</td>
            <td>VDD3</td>
            <td>Power Supply (+3.3V)</td>
          </tr>
          <tr>
            <td>21</td>
            <td>VDD4</td>
            <td>Power Supply (+3.3V)</td>
          </tr>
          <tr>
            <td>22</td>
            <td>NC</td>
            <td>Not Connected</td>
          </tr>
          <tr>
            <td>23</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>24</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>25</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>26</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>27</td>
            <td>NC</td>
            <td>Not Connected</td>
          </tr>
          <tr>
            <td>28</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>29</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>30</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>31</td>
            <td>GND</td>
            <td>Ground connection</td>
          </tr>
          <tr>
            <td>32</td>
            <td>BL_EN</td>
            <td>Backlight Enable Signal</td>
          </tr>
          <tr>
            <td>33</td>
            <td>PWM</td>
            <td>PWM Signal for Backlight Control</td>
          </tr>
          <tr>
            <td>34</td>
            <td>NC</td>
            <td>Not Connected</td>
          </tr>
          <tr>
            <td>35</td>
            <td>NC</td>
            <td>Not Connected</td>
          </tr>
          <tr>
            <td>36</td>
            <td>VBL1</td>
            <td>Backlight Power Supply</td>
          </tr>
          <tr>
            <td>37</td>
            <td>VBL2</td>
            <td>Backlight Power Supply</td>
          </tr>
          <tr>
            <td>38</td>
            <td>VBL3</td>
            <td>Backlight Power Supply</td>
          </tr>
          <tr>
            <td>39</td>
            <td>VBL4</td>
            <td>Backlight Power Supply</td>
          </tr>
          <tr>
            <td>40</td>
            <td>NC</td>
            <td>Not Connected</td>
          </tr>
          <tr>
            <td>41</td>
            <td>NC</td>
            <td>Not Connected</td>
          </tr>
          <tr>
            <td>42</td>
            <td>NC</td>
            <td>Not Connected</td>
          </tr>
          <tr>
            <td>43</td>
            <td>GND</td>
            <td>Ground Connection</td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

**eDP Connector Pinout**

### <span id="circle-26">RTC Battery Holder</span> [㉖](#o6-layout)

The RTC battery holder on the O6 is designed for a **CR1220 battery**, which provides timekeeping functionality. Note that removing the RTC battery will not clear the BIOS settings.
