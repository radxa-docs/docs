---
sidebar_position: 3
---

# Power supply selection

The Radxa Dual 2.5G Router HAT is equipped with a DC interface (socket specification with an outer diameter of 5.5mm, inner diameter of 2.5mm, and center positive). When used with the Raspberry Pi 5, it supports two power supply modes.

- Use a Type-C adapter to power the Raspberry Pi 5 and the HAT is powered from the Raspberry Pi 5 GPIO
- Use a DC 12V adapter to power the Dual 2.5G Router HAT itself, NVMe SSD and Raspberry Pi 5 from the GPIO

:::tip
When powering the Dual 2.5G Router HAT with SSD installed using a Type-C adapter(5V/5A) from the Raspberry Pi 5, there may be insufficient power supply issues that can prevent the system from starting up properly under full load.

It is recommended to power the Dual 2.5G Router HAT with a DC 12V/3A or higher adapter when used with the Raspberry Pi 5.
:::
