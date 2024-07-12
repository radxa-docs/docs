---
sidebar_position: 7
---

import PWM from '../../../../common/dev/\_pwm.mdx';
import SPI from '../../../../common/dev/\_spi.mdx';
import UART from '../../../../common/dev/\_uart.mdx';

# 40-PIN 功能测试

## GPIO

GPIO 简介

通用输入/输出（GPIO）是集成电路或电子电路（如 MCU/MPU）电路板上的非专用数字信号引脚，可用作输入或输出，或同时用作输入和输出，并可由软件控制。

### 准备

<ul>
  <li>一块 ROCK 2A</li>
  <li>一个 LED 灯</li>
</ul>

### 连接

使用杜邦线将 LED 灯和 ROCK 2A PIN_3 相连。

### 测试

#### 输入测试

将 ROCK 2A PIN_3 接地或者接 3.3V，

```bash
# gpioget $(sudo gpiofind PIN_3)
```

如果接的是地，该命令输出 0，如果接的是 3.3V，该命令输出 1。

#### 输出测试

```bash
# sudo gpioset -m signal $(sudo gpiofind PIN_#gpio_pin#)=0 # 输出低电平， Led 灭
# sudo gpioset -m signal $(sudo gpiofind PIN_#gpio_pin#)=1 # 输出高电平， Led 亮
```

## I2C

I2C 简介

I2C（Inter-Integrated Circuit；发音为 "eye-squared-see "或 "eye-two-see"），又称 I2C 或 IIC，是飞利浦半导体公司于 1982 年发明的一种同步、多控制器/多目标（历史上称为主/从）、单端、串行通信总线。

### 准备

<ul>
  <li>一块 ROCK 2A</li>
  <li>一个 OLED </li>
</ul>

### 开启 Overlay

<p>
  请参照<a href="../../radxa-os/rsetup#overlays">设备树配置</a>启用 I2C 相关
  Overlay, eg: "Enable I2C0-M1"。
</p>

### 连接

<p>按照以下方式连接 ROCK 2A 和 OLED </p>

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

### 测试

- 打开终端，在终端中输入以下命令安装 python3-periphery 的 Python 库

- 新建一个名为 Oled.py Python 文件，并将以下代码粘贴到该文件中：

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

- 在终端中，执行以下命令进行测试

```
sudo python3 Oled.py
```

执行完以上命令后，Oled 会显示 "Hello, Radxa" 的字符


## PWM

<PWM product_name="Radxa ROCK 2A" model="rock-2a" pwm_name="PWM0_M0" pwm_pin="PIN_32" chip="0" pwm_connection="/img/rock2a/pwm_connection.webp" />

## SPI

<SPI product_name="Radxa ROCK 2A" model="rock-2a" spi_overlay_name="Enable spidev on SPI0 over CS1" spidev="/dev/spidev0.0" spi_mosi="PIN_19" spi_miso="PIN_21" spi_connection="/img/rock2a/spi_connection.webp" />

## UART

<UART product_name="Radxa ROCK 2A" model="rock-2a" uart1_name="UART1-M0" uart_dev1="ttyS1" tx1_pin="PIN_7" rx1_pin="PIN_40" uart2_name="UART3-M0" uart_dev2="ttyS3" tx2_pin="PIN_18" rx2_pin="PIN_16" uart_connection="/img/rock2a/rock2a-uart-loop.webp" two_uart_connection="/img/rock2a/rock2a-two-uart-connection.webp" />
