---
sidebar_position: 7
---

# Power Supply Selection

ROCK 5 ITX supports three power supply methods to adapt to different usage scenarios:

- **DC 12V Adapter**
- **PC Case Power Supply**
- **PoE Switch**

**Note**: ROCK 5 ITX does not support the simultaneous use of two or more power supply methods, as this may cause damage to the motherboard or power supply.

**Note**: Regardless of the power supply method used, ROCK 5 ITX will automatically turn on.

## Overview of Motherboard Power Consumption

- **Typical Power Consumption**: 15W
- **Maximum Power Consumption**: 25W (with USB, M.2 SSD, WiFi, and other peripherals fully loaded, excluding power supply to SATA hard drives)

## DC Adapter Power Supply

The motherboard is equipped with a DC interface (outer diameter 5.5mm, inner diameter 2.5mm, center positive). Please use a 12V input adapter, as exceeding this voltage may damage the motherboard.

## Selecting the Adapter Power

The adapter power selection depends on the peripherals that need to be connected. ROCK 5 ITX motherboard supports directly powering 2.5/3.5-inch solid-state or mechanical hard drives. The typical power consumption of hard drives is as follows:

| Hard Drive Type | Power Consumption |
| --------------- | ----------------- |
| SSD Solid State | less than 3W      |
| 2.5-inch HDD    | 3-5W              |
| 3.5-inch HDD    | 5-10W             |

Based on the type and number of external hard drives, choose an appropriate adapter. For example, if you are connecting 4 x 3.5-inch mechanical hard drives and powering them from the motherboard, you need to consider a 65W adapter for the motherboard's maximum load of 25W + 4 x 10W = 65W. You will need an adapter of at least 12V/5.5A.

## Using PC Case Power Supply

PC case power supplies usually provide higher power, sufficient to meet the requirements of ROCK 5 ITX. Hard drives can be powered directly from the PC case power supply or the motherboard's SATA power connector. Refer to the assembly guide's power installation section for using the PC case power supply.

## Using Network Switch Power Supply

ROCK 5 ITX is equipped with dual 2.5G Ethernet interfaces, supporting PoE power supply. To use PoE power supply, you need to install the following module:

## \*\*Radxa 25W PoE+ Module

For instructions on using and installing this module, please refer to the accessory's [Radxa 25W PoE+ Module]. This module provides a maximum power of 25W, which is sufficient to support basic system requirements. It is not recommended to use the Radxa 25W PoE+ module to power high-power 3.5-inch mechanical hard drives.
