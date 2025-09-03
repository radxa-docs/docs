---
sidebar_position: 3
---

# Using the System

This guide explains how to boot and use the system.

:::tip System Installation
If you haven't installed the system yet, please refer to the [Install System](./install-system) tutorial to install the system based on your boot media.
:::

## Booting the System

Install the boot media in the corresponding slot on the motherboard, then power on the board using the power adapter to start the system.

:::tip Boot Priority
If you have multiple boot media installed on the motherboard, the system will boot in the following priority order (Note: UFS module boot is currently not supported):

MicroSD Card > Onboard eMMC > UFS Module (Not Supported) > NVMe SSD
:::

**Note:** You can remove the higher priority boot media to force the system to boot from a lower priority media.

During normal system boot, the Radxa CM4's LED will light up green when powered on. After the system starts running, it will turn off for a few seconds, then the CM4 IO board's power indicator (red) will light up, and the user LED (green) will blink along with the CM4's LED (green).

## System Information

When using our provided system image, you'll need to log in with the following default credentials on first use:

- Debian Linux

Username: radxa

Password: radxa

## Using the System

This section provides recommendations for both display and headless modes to help you get started with your Radxa CM4.

### Display Mode

Display mode refers to connecting the motherboard to a monitor using an HDMI cable to display the system interface and operate through a graphical user interface.

This method is relatively simple to operate, allowing users to perform graphical operations.

### Headless Mode

Headless mode refers to operating the system without a monitor. It is recommended to use serial debugging or SSH for remote login and control.

- [Serial Debugging](../system-use/uart)

Requires connecting the motherboard to a PC using a USB-to-serial cable or USB-to-TTL module to log in to the system via serial connection.

- [SSH Remote](../system-use/ssh)

Requires configuring the SSH service, connecting the motherboard to a network, and ensuring it's on the same local network as your PC to log in via SSH.
