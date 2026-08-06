---
sidebar_position: 17
---

# Boot Options

The Dragon Q6A boots from the SPI NOR Flash by default and comes with a pre-installed BIOS.

To change the boot medium to boot directly from UFS, adjust the onboard resistors as follows:

1. Remove the resistor at R137.
2. Solder a 10 kΩ resistor at R207.

:::warning
This operation involves hardware soldering and may cause device damage or affect the warranty. After the modification, the Dragon Q6A will no longer be able to boot the system from a microSD card, eMMC module, or NVMe SSD. Disconnect the device from power before performing the operation, and have it done by personnel with soldering experience.
:::
