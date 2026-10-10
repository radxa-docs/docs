---
sidebar_position: 13
---

# Update BIOS Firmware from the System

You can update the Dragon Q8B BIOS firmware using `Rsetup` in Radxa OS. This method requires a bootable system and a network connection. If the system cannot boot, use [EDL to flash the BIOS firmware](../low-level-dev/spi-fw); EDL flashing does not depend on the OS booting.

1. Open a terminal in Radxa OS on the Dragon Q8B and run:

   ```bash
   sudo rsetup
   ```

2. In `Rsetup`, select `System` -> `Bootloader Management` -> `Update SPI Bootloader`.
3. Select `radxa-dragon-q8b`, follow the on-screen prompts to confirm, and wait for the update to finish. Keep the power supply stable and do not interrupt the update.
4. Restart the device when the update finishes. See [Check the BIOS Version](./check-bios-version) to verify the result.

:::tip Update SPI Bootloader not shown?
In `Rsetup`, select `System` -> `System Update` and follow the prompts to update the system. Restart, then open `Rsetup` and try again. See [System Update](./system-update).
:::
