---
sidebar_position: 2
---

# MicroSD Card Slot

The Radxa CM4 IO Board features a built-in MicroSD card slot that is compatible with MicroSD, MicroSDHC, and MicroSDXC cards. It can be used as a system boot device or for expanded storage.

## Hardware Connection

Insert your MicroSD card into the MicroSD card slot on the Radxa CM4 IO Board.

:::tip Interface Location
Refer to the [Hardware Information](./hardware_info.md) guide to locate the MicroSD card slot.
:::

## Usage Guide

The MicroSD card can be used either as a system boot medium or as expanded storage.

### System Boot Medium

When a MicroSD card with a bootable system is inserted, the Radxa CM4 will automatically boot from the MicroSD card by default.

### Expanded Storage

To use the MicroSD card as expanded storage, you can either:

1. Boot the system from another boot medium, or
2. Lower the boot priority of the MicroSD card in the boot order

This will prevent the system from booting from the MicroSD card while still allowing access to its storage capacity.

:::tip Boot Note
On some motherboards, you can configure the boot order through software to prioritize other boot devices.
:::

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Resource Download](../download.md) page.
