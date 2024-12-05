---
sidebar_position: 3
---

# MicroPython

To use MicroPython, you leverage the embedded RP2040 SoC, which communicates with the main core over UART and has access to the [GPIOs](gpio).

## Instructions

- Download [MicroPython](https://micropython.org/download/RPI_PICO) for the Pi Pico,(at the time of writing) v1.22.0 is recommended as we tested.

- Open the RP2040 as a USB device by using the [usb.sh](flash) method.

- Install Thonny IDE

```
sudo apt-get install thonny -y
```

- Open Thonny IDE and writing your MicroPython program, now we have successfully set up the MicroPython environment.

<img src="/img/x/x2l/flash_micro_python.webp" alt="Flash Micro Python" height="350" width="700" />

## Further Examples

Please see [UART](uart)

## Errata

As the RP2040 is acting as if it's a USB and UART attached Pi Pico, you can use it in nearly any way you would normally a Pi Pico, including software/firmware images such as CircuitPython and Arduino code.

If the RP2040 core crashes, you can pull GPIO 60 high for 1 second to reset the SoC:

```
sudo gpioset gpiochip1 60=1
sleep 1
sudo gpioset gpiochip1 60=0
```
