---
sidebar_position: 3
---

# M.2 M Key 2280 Slot

The Radxa CM4 IO Board features an onboard M.2 M Key 2280 slot, ideal for users who require high read/write speeds and large storage capacity. It can be used either as a system boot drive or for expanded storage.

## Hardware Connection

Install your M.2 M Key 2280 SSD into the M.2 M Key 2280 slot on the Radxa CM4 IO Board.

:::tip Interface Location
Refer to the [Hardware Information](./hardware_info.md) guide to locate the M.2 slot.
:::

## Usage Guide

The M.2 M Key 2280 SSD can be used either as a system boot medium or as expanded storage.

### System Boot Medium

When a bootable system is present on the M.2 M Key 2280 SSD and no higher-priority boot media is detected, the Radxa CM4 will automatically boot from the M.2 M Key 2280 SSD by default.

### Expanded Storage

To use the M.2 SSD as expanded storage, you can either:

1. Boot the system from another boot medium, or
2. Lower the boot priority of the M.2 SSD in the boot order

This will prevent the system from booting from the M.2 SSD while still allowing access to its storage capacity.

:::tip Boot Note
On some motherboards, you can configure the boot order through software to prioritize other boot devices.
:::

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Resource Download](../download.md) page.
