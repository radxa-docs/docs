---
sidebar_position: 7
---

# How to Boot from SSD

By default, Raspberry Pi devices do not boot from PCIe storage. To enable booting from PCIe, you need to change the BOOT_ORDER in the Bootloader configuration.

1. First, boot the system from the SD card.

2. Once the system is up, execute the following command:

   ```bash
   sudo rpi-update
   ```

3. Use the following command to edit the EEPROM configuration:

   ```bash
   sudo rpi-eeprom-config --edit
   ```

   Add the following content:

   ```bash
   BOOT_ORDER=0xf416
   PCIE_PROBE=1
   ```

   ![ssd boot](/img/accessories/dual-2.5-route-hat/rpi-ssd-boot.webp)

4. Then run `sudo rpi-eeprom-update -a`

5. Use `sudo reboot` to restart the system and update the EEPROM.

6. After rebooting, power off the device, remove the SD card, and insert the SSD with the installed system into the M.2 M-Key slot on the Radxa Dual 2.5G Router HAT.

7. Power on the device, and the system should boot normally from the SSD.
