---
sidebar_position: 3
---

import GPIO from "../../../common/dev/\_micropython-gpio.mdx"
import I2C from "../../../common/dev/\_micropython-i2c.mdx"
import PWM from "../../../common/dev/\_micropython-pwm.mdx"

# MicroPython

To use MicroPython, you leverage the embedded RP2040 SoC, which communicates with the main core over UART and has access to the [GPIOs](gpio).

## Instructions

- Download [MicroPython](https://micropython.org/download/RPI_PICO) for the Pi Pico,(at the time of writing) v1.22.0 is recommended as we tested.

- Open the RP2040 as a USB device by using the [usb.sh](flash) method.

- Install Thonny IDE

```
sudo apt-get install thonny -y
```

- Copy the micropython firmware into the RP2040 as shown below

<img src="/img/x/x2l/flash_micro_python.webp" alt="Flash Micro Python" height="350" width="700" />

- Open the Thonny IDE, set up the micropython interpreter and the port

  - Click the "Tools" button above and select "Options".

    <img src="/img/x/x4/options.webp" style={{ width: "80%" }} alt="thonny tools" />

  - Click on "Interpreter" and select "MicroPython (Raspberry Pi Pico)".

    <img src="/img/x/x4/interpreter.webp" style={{ width: "80%" }} alt="thonny tools interpreter" />

    :::tip
    If you don't find the MicroPython interpreter, please download and install [the latest version of Thonny](https://github.com/thonny/thonny/releases)
    :::

  - Click "Port" and select "Board in FS mode - Board CDC (/dev/ttyACM0)".

    <img src="/img/x/x4/port.webp" style={{ width: "80%" }} alt="thonny tools port" />

## Examples

### GPIO

<GPIO product_name="Radxa X4" gpio="28" gpio_pin="3" time="1" />

### I2C

<I2C product_name="Radxa X4" sda_gpio="28" scl_gpio="29" />

### PWM

<PWM product_name="Radxa X4" pwm_pin="3" gpio_pin="28" />

## FAQ

- Q1: RP2040 has crashed.

  A1: Refer to [Burn Program to RP2040](. /flash) to reset RP2040.

- Q2: After burning micropython firmware, there are still other programs running.

  A2: Burn flash_nuke.uf2 to RP2040 to clear RP2040

- Q3: ImportError: no module named `<module-name>`

  A2: Thonny tools column select "Manage Packages", then install the Package you need.

## Reference

- [MicroPython Official Page](https://micropython.org/download/?mcu=rp2040)
- [Pico MicroPython Examples](https://github.com/raspberrypi/pico-micropython-examples.git)
- [How to use the Radxa X4's embedded RP2040 microcontroller](https://www.youtube.com/watch?v=rUkpIG_3D9k)
