---
sidebar_position: 7
---

import PWM from '../../../../common/dev/\_pwm.mdx';
import SPI from '../../../../common/dev/\_spi.mdx';
import UART from '../../../../common/dev/\_uart.mdx';

# 40-PIN Function Test

## GPIO

GPIO Introduction

General-Purpose Input/Output (GPIO) refers to non-specialized digital signal pins on an integrated circuit or electronic circuit board (such as MCU/MPU). These pins can be used as input or output, or simultaneously as input and output, and can be controlled by software.

### Preparation

<ul>
  <li>A ROCK 2A board</li>
  <li>An LED light</li>
</ul>

### Connection

Use Dupont wires to connect the LED light to PIN_3 on the ROCK 2A.

### Test

#### Input Test

Connect ROCK 2A PIN_3 to ground or 3.3V.

```bash
# gpioget $(sudo gpiofind PIN_3)
```

If connected to ground, the command outputs 0; if connected to 3.3V, the command outputs 1.

#### 输出测试

```bash
# sudo gpioset -m signal $(sudo gpiofind PIN_#gpio_pin#)=0 # 输出低电平， Led 灭
# sudo gpioset -m signal $(sudo gpiofind PIN_#gpio_pin#)=1 # 输出高电平， Led 亮
```

## I2C

Introduction to I2C

I2C (Inter-Integrated Circuit; pronounced as "eye-squared-see" or "eye-two-see"), also known as I2C or IIC, is a synchronous, multi-controller/multi-target (historically referred to as master/slave), single-ended, serial communication bus invented by Philips Semiconductors in 1982.

### Preparation

<ul>
  <li>A ROCK 2A board</li>
  <li>An OLED </li>
</ul>

### Enable Overlay

<p>
  Please refer <a href="../../radxa-os/rsetup#overlays"> to the device tree configuration</a>to enable the I2C-related overlay., eg: "Enable I2C0-M1"。
</p>

### Connection

<p>Connect the ROCK 2A and the OLED as follows. </p>

<table>
  <tr>
    <th>ROCK 2A</th>
    <th>\<--\></th>
    <th>OLED</th>
  </tr>
  <tr>
    <td>PIN_5</td>
    <th>\<--\></th>
    <td>SCL</td>
  </tr>
  <tr>
    <td>PIN_5</td>
    <th>\<--\></th>
    <td>SDA</td>
  </tr>
  <tr>
    <td>PIN_1</td>
    <th>\<--\></th>
    <td>VCC</td>
  </tr>
  <tr>
    <td>PIN_9</td>
    <th>\<--\></th>
    <td>GND</td>
  </tr>
</table>

### Test

- Open the terminal and enter the following command to install the python3-periphery Python library.

- Create a new Python file named Oled.py and paste the following code into the file:

<details>
    <summary>Oled.py</summary>

    ```
    #!/usr/bin/env python3
    # -*- encoding: utf-8 -*-

    import time
    from periphery import I2C

    class Oled:
      def __init__(self, bus, dev_addr):
        self.bus = I2C(bus)
        self.dev_addr = dev_addr
        self.size = 16
        self.max_column = 128
        self.oled_data = 0x40
        self.oled_init()

      def oled_write_cmd(self, cmd):
        self.bus.transfer(self.dev_addr, [I2C.Message([0x00, cmd])])

      def oled_init(self):
        print("... init ...")
        time.sleep(1)
        self.oled_write_cmd(0xAE)
        self.oled_write_cmd(0x00)
        self.oled_write_cmd(0x10)
        self.oled_write_cmd(0x40)
        self.oled_write_cmd(0xB0)
        self.oled_write_cmd(0x81)
        self.oled_write_cmd(0xFF)
        self.oled_write_cmd(0xA1)
        self.oled_write_cmd(0xA6)
        self.oled_write_cmd(0xA8)
        self.oled_write_cmd(0x3F)
        self.oled_write_cmd(0xC8)
        self.oled_write_cmd(0xD3)
        self.oled_write_cmd(0x00)
        self.oled_write_cmd(0xD5)
        self.oled_write_cmd(0x80)
        self.oled_write_cmd(0xD9)
        self.oled_write_cmd(0x22)
        self.oled_write_cmd(0xDA)
        self.oled_write_cmd(0x12)
        self.oled_write_cmd(0xDB)
        self.oled_write_cmd(0x20)
        self.oled_write_cmd(0x8D)
        self.oled_write_cmd(0x14)
        self.oled_write_cmd(0xAF)

      def oled_clear(self, clear_data):
        for i in range(8):
          self.oled_write_cmd(0xB0 + i)
          # page0-page1
          self.oled_write_cmd(0x00)
          # low column start address
          self.oled_write_cmd(0x10)
          # high column start address
          for j in range(128):
            self.oled_write_data(clear_data)

      def oled_display_on(self):
        self.oled_write_cmd(0x8D)
        self.oled_write_cmd(0x14)
        self.oled_write_cmd(0xAF)

      def oled_display_off(self):
        self.oled_write_cmd(0x8E)
        self.oled_write_cmd(0x8D)
        self.oled_write_cmd(0x10)

      def oled_set_pos(self, x, y):
        self.oled_write_cmd(0xB0 + y)
        self.oled_write_cmd(x&0x0f)
        self.oled_write_cmd(((x&0xf0)>>4)|0x10)

      def oled_show_char(self, x, y, chr):
        c = chr - ord(' ')
        if x > self.max_column:
          x = 0
          y += 2

        if self.size == 16:
          self.oled_set_pos(x, y)
          for i in range(8):
            self.bus.transfer(self.bus.transfer(self.dev_addr, [self.oled_data, F8X16[c*16+i]]))
          self.oled_set_pos(x, y+1)
          for i in range(8):
            self.bus.transfer(self.bus.transfer(self.dev_addr, [self.oled_data, F8X16[c*16+i+8]]))
        else:
          self.oled_set_pos(x, y)
          for i in range(6):
            self.bus.transfer(self.bus.transfer(self.dev_addr, [self.oled_data, F6x8[c][i]]))

    if __name__ == "main":
      oled = Oled("/dev/i2c-8", 0x3c)
      oled.oled_show_char(0, 0, 'radxa')
      oled.oled_clear()
    ```

</details>

- In the terminal, execute the following command to perform the test.

```
sudo python3 Oled.py
```

After executing the above command, the OLED will display the characters "Hello, Radxa".


## PWM

<PWM product_name="Radxa ROCK 2A" model="rock-2a" pwm_name="PWM0_M0" pwm_pin="PIN_32" chip="0" pwm_connection="/img/rock2a/pwm_connection.webp" />

## SPI

<SPI product_name="Radxa ROCK 2A" model="rock-2a" spi_overlay_name="Enable spidev on SPI0 over CS1" spidev="/dev/spidev0.0" spi_mosi="PIN_19" spi_miso="PIN_21" spi_connection="/img/rock2a/spi_connection.webp" />

## UART

<UART product_name="Radxa ROCK 2A" model="rock-2a" uart1_name="UART1-M0" uart_dev1="ttyS1" tx1_pin="PIN_7" rx1_pin="PIN_40" uart2_name="UART3-M0" uart_dev2="ttyS3" tx2_pin="PIN_18" rx2_pin="PIN_16" uart_connection="/img/rock2a/rock2a-uart-loop.webp" two_uart_connection="/img/rock2a/rock2a-two-uart-connection.webp" />
