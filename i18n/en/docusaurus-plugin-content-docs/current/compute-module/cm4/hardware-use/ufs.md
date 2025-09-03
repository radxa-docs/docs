---
sidebar_position: 2
---

# UFS Module Slot

The Radxa CM4 IO Board features an onboard UFS (Universal Flash Storage) module slot, supporting high-capacity storage from 64GB to 1TB. Ideal for users who require fast read/write speeds and convenient installation, it can be used as either a system boot drive or expanded storage.

## Hardware Connection

Install the UFS module into the UFS module slot on the Radxa CM4 IO Board.

Installation steps:

1. Ensure the notch on the UFS module aligns with the UFS module interface on the motherboard.

2. Make sure the connector at the bottom of the UFS module is properly aligned with the motherboard's UFS module interface.

3. Gently press down on one end of the UFS module until you hear a click, indicating successful installation. Repeat the same process for the other end to ensure the UFS module is securely installed.

:::tip Interface Location
You can refer to the [Hardware Information](./hardware_info.md) tutorial to locate the corresponding hardware interface.
:::

## User Guide

The UFS module can be used as either a system boot medium or expanded storage space.

### System Boot Medium

When a bootable system is present on the UFS module and there are no higher-priority boot media, the Radxa CM4 will automatically boot from the UFS module by default.

### Expanded Storage

To use the UFS module as expanded storage, boot the system from another boot medium or lower the boot priority of the UFS module to prevent the system from booting from it.

:::tip Boot Instructions
For some motherboards, you can configure the system boot order through software to set other boot media as the primary boot device.
:::

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Downloads](../download.md) page.
