---
sidebar_position: 3
---

# M.2 M Key 2230 Slot

The Radxa Cubie A5E features an onboard M.2 M Key 2230 slot, ideal for users who require high-speed read/write performance and large storage capacity. It can be used as either a system boot drive or expanded storage.

## Hardware Connection

Install the M.2 M Key 2230 SSD into the M.2 M Key 2230 slot on the Radxa Cubie A5E.

:::tip Interface Location
You can refer to the [Hardware Information](./hardware-info.md) tutorial to locate the corresponding hardware interface.
:::

## Usage Guide

An NVMe SSD can be used as either a system boot medium or expanded storage.

### System Boot Medium

When the NVMe SSD contains a bootable system and there are no higher-priority boot media present, the Radxa Cubie A5E will boot from the NVMe SSD by default.

### Expanded Storage

When booting from other system media or when the NVMe SSD doesn't contain a bootable system, the system will recognize the NVMe SSD as expanded storage.

:::tip Boot Note
For certain boards, you can configure the system boot order through software to set other bootable media as the startup disk.
:::

## Interface Pin Definition

For the hardware schematic, please refer to the [Resource Downloads](../download.md) page.
