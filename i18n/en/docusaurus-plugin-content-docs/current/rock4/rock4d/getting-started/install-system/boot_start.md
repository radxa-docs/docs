---
sidebar_position: 4
---

# Flashing SPI Boot Firmware

You can think of the SPI boot firmware as the **BIOS/UEFI** in your personal computer. Just like how a PC's BIOS/UEFI is responsible for initializing basic hardware (such as memory, hard drives, keyboards, etc.) before the operating system (like Windows or Linux) starts up, the SPI boot firmware on embedded devices serves a similar role.

The core tasks of the SPI boot firmware include **initializing critical hardware** such as:

- **DDR Memory**: Prepares the memory space for the main system operation.
- **Clock Frequencies**: Sets the operating speed for different parts of the chip.
- **Storage Controllers**: Enables the system to access storage devices like Micro SD cards, UFS modules, or M.2 NVMe SSDs.
- **GPIO (General-Purpose Input/Output Pins)**: Configures pin functions for connecting various peripherals.

After completing these initializations, the SPI boot firmware loads the operating system kernel from eMMC/SD card/NVMe SSD/USB drive. This SPI boot firmware is typically stored in a special storage chip on the motherboard called **SPI Nor Flash**, which serves a similar role to the chip on a PC motherboard that stores the BIOS/UEFI.

## When Do You Need to Flash SPI Boot Firmware?

The ROCK 4D comes pre-installed with compatible SPI boot firmware. **If your device is functioning normally or you haven't performed any operations to erase the SPI Nor Flash, this step is usually unnecessary.**

You only need to reflash the SPI boot firmware in the following situations:

- **SPI Flash Content Corruption**: Similar to when a PC's BIOS is corrupted and cannot boot
- **Firmware Version Upgrade Required**: To gain support for new features or fix known issues
- **Specific Development Needs**: Such as starting with a blank SPI Flash or needing to boot an unofficially supported system
- **Educational Purposes**: To gain a deeper understanding of the device's low-level boot mechanisms

This tutorial will guide you through the process of flashing the SPI boot firmware, which is an additional step after the regular system installation for writing the initial bootloader.

## Obtaining the Latest SPI Boot Firmware

You'll need to boot the Radxa ROCK 4D system using a MicroSD card. You can refer to the [Quick Start](../quickly_start) guide to complete this step.

Once the system has successfully booted and you've confirmed the network connection is working, open the Radxa ROCK 4D terminal and use the Rsetup tool to update the system.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo rsetup
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
Rsetup Home Interface
<img src="/img/rock4/4d/rsetup-spi-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
Rsetup Tool Guide: For detailed usage instructions, refer to the [Rsetup Tool](../../system-config/rsetup)

- Select Option: The corresponding option will be highlighted
- Confirm Selection: Press `Enter`
- Cancel Selection: Press `ESC`
- Navigate Options: Use `Up`, `Down`, `Left`, `Right` arrow keys
- Multi-selection Interface: Press `Space` to select, `Enter` to confirm selection
  :::

After entering the Rsetup tool, select `System` → `System Update`:

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Select "yes" to continue, then follow the on-screen prompts to complete the remaining operations:

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After completing all operations, use the following command to reboot the system:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo reboot
```
</NewCodeBlock>

## Flashing the SPI Boot Firmware

After the system reboots, open the Rsetup tool again.

Select `System` → `Bootloader Management` → `Update SPI Bootloader`:

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Select "yes" to continue, then follow the on-screen prompts to complete the remaining operations.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Select the Bootloader file to install: If there are multiple Bootloader options available, prioritize the one with the "spi" suffix.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

The system will automatically download the latest `spi.img` and flash it to the SPI Nor Flash.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/rsetup-spi-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After completing all operations, use the following command to reboot the system:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo reboot
```
</NewCodeBlock>
