---
sidebar_position: 3
---

# GPIO Pin Selection Guidelines

Taking Radxa ZERO as an example, here are some things to consider when you need to pick a GPIO pin:

1. If you plan to use a pin as another hardware feature (i.e. SPI/I2C/PWM/etc), then it CANNOT be used as GPIO.
2. Generally, ADC pins CANNOT be used as GPIO (pin 15 & 26). Not the output at least.
3. Avoid pin 8 & 10, since they are the default debug console, and many software parts assume they are available.
4. Avoid pins that are only available on a specific hardware revision (pin 35 & 38) to allow more sourcing flexibility.
5. Avoid OD pins (pin 22 & 36) since they require additional circuit to function like a normal GPIO.

Now almost every guideline above can be violated given enough development resources, and they are ordered by the effort required from the most to the least. But if you are already considering to go against #4 due to the lack of available GPIOs, you might want to include an I2C/SPI GPIO expander and save the headache.

:::info
This page takes Radxa ZERO as an example. For other products, please refer to the pin functions listed in the corresponding [hardware interface](../hardware-design/hardware-interface) page.
:::
