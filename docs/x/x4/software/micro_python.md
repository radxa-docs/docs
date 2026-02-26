---
sidebar_position: 3
---

import GPIO from "../../../common/dev/\_micropython-gpio.mdx"
import I2C from "../../../common/dev/\_micropython-i2c.mdx"
import PWM from "../../../common/dev/\_micropython-pwm.mdx"

# MicroPython

我们可以使用 MicroPython 通过 RP2040 来控制 GPIO，主 CPU 通过 UART 与 RP2040 通信，然后通过 RP2040 访问 [GPIO](./gpio)。

## 搭建环境

- 下载 [Micro Python](https://micropython.org/download/RPI_PICO/) (推荐使用我们验证过的v1.22.0版本), 保存为 .uf2 后缀的文件。

- 参考 [烧录程序到 RP2040](./flash) 打开 RP2040 设备

- 安装 Thonny IDE

  ```
  sudo apt-get install thonny -y
  ```

- 如下图所示将 micropython 固件拷贝到 RP2040 中

<img src="/img/x/x2l/flash_micro_python.webp" alt="Flash Micro Python" style={{ width: "80%" }} />

- 打开 Thonny IDE， 设置 micropython 解释器以及端口

  - 点击上方 "Tools" 按钮，选择 "Options"

    <img src="/img/x/x4/options.webp" style={{ width: "80%" }} alt="thonny tools" />

  - 点击 "Interpreter" 选择 "MicroPython (Raspberry Pi Pico)"

    <img src="/img/x/x4/interpreter.webp" style={{ width: "80%" }} alt="thonny tools interpreter" />

    :::tip
    如果没有找到 MicroPython 解释器, 请下载安装[最新版本的 Thonny](https://github.com/thonny/thonny/releases)
    :::

  - 点击 "Port" 选择 "Board in FS mode - Board CDC (/dev/ttyACM0)"

    <img src="/img/x/x4/port.webp" style={{ width: "80%" }} alt="thonny tools port" />

## 示例

### GPIO

<GPIO product_name="Radxa X4" gpio="28" gpio_pin="3" time="1" />

### I2C

<I2C product_name="Radxa X4" sda_gpio="28" scl_gpio="29" />

### PWM

<PWM product_name="Radxa X4" pwm_pin="3" gpio_pin="28" />

## FAQ

- Q1: RP2040 崩溃了

  A1: 参考 [烧录程序到 RP2040](./flash) 重置 RP2040

- Q2: 烧录 micropython 固件后，仍然有其他程序在跑

  A2： 将 flash_nuke.uf2 烧录到 RP2040 中，以清除 RP2040

- Q3: ImportError: no module named `<module-name>`

  A2: Thonny tools 栏选择 "Manage Packages"， 然后安装你所需要的 Package

## 参考资料

- [MicroPython Official Page](https://micropython.org/download/?mcu=rp2040)
- [Pico MicroPython Examples](https://github.com/raspberrypi/pico-micropython-examples.git)
- [How to use the Radxa X4's embedded RP2040 microcontroller](https://www.youtube.com/watch?v=rUkpIG_3D9k)
