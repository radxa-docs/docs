---
sidebar_position: 2
---

# microSD Card Slot

The Radxa CM4 IO Board features a built-in microSD card slot that is compatible with microSD, microSDHC, and microSDXC cards. It can be used as a system boot device or for expanded storage.

## Hardware Connection

Insert your microSD card into the microSD card slot on the Radxa CM4 IO Board.

:::tip Interface Location
Refer to the [Hardware Information](./hardware_info.md) guide to locate the microSD card slot.
:::

## Usage Guide

The microSD card can be used either as a system boot medium or as expanded storage.

### System Boot Medium

When a microSD card with a bootable system is inserted, the Radxa CM4 will automatically boot from the microSD card by default.

### Expanded Storage

To use the microSD card as expanded storage, you can either:

1. Boot the system from another boot medium, or
2. Lower the boot priority of the microSD card in the boot order

This will prevent the system from booting from the microSD card while still allowing access to its storage capacity.

:::tip Boot Note
On some motherboards, you can configure the boot order through software to prioritize other boot devices.
:::

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Resource Download](../download.md) page.
