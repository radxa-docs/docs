---
sidebar_position: 5
---

# eMMC/UFS Module Combination Interface

The Radxa Dragon Q6A features an onboard eMMC/UFS module combination interface, supporting both eMMC and UFS modules.

:::danger
Do not use untested third-party UFS or eMMC modules. Some third-party modules may short the SBC and cause permanent hardware damage, and such damage is not covered by warranty.
:::

## Hardware Connection

Install the eMMC module or UFS module into the eMMC/UFS module combination interface on the Radxa Dragon Q6A.

**eMMC/UFS Module Installation Steps:**

1. Ensure that the notched corners of the eMMC/UFS module align with the notched corners of the eMMC/UFS module combo interface on the motherboard.
2. Ensure that the bottom slot interface of the eMMC/UFS module aligns with the eMMC/UFS module combo interface on the motherboard.
3. Gently press the interface at one end of the eMMC/UFS module. If you hear a click, the installation is successful. Use the same method to press the interface at the other end to ensure that the eMMC/UFS module is installed successfully.

:::tip Interface Location  
You can refer to the [Hardware Information](./hardware-info) tutorial to find the corresponding hardware interface location.  
:::

## Usage Guide

The eMMC module or UFS module can be used as a system boot medium or as expanded storage space.

For system installation, refer to the following tutorials:

- [Install System to eMMC](../getting-started/install-system/emmc-system)

- [Install System to UFS](../getting-started/install-system/ufs-system)

## UFS Performance Reference

The following table shows measured read/write performance of the Radxa UFS Module on the Dragon Q6A, tested using the `dd` command. Data is for reference only.

| Product Name       | Capacity | Read Speed | Write Speed | Test Environment   |
| ------------------ | -------- | ---------- | ----------- | ------------------ |
| Radxa UFS Module   | 128GB    | 1703 MB/s  | 388 MB/s    | Radxa OS (Linux)   |
| Radxa UFS Module   | 256GB    | 1811 MB/s  | 557 MB/s    | Radxa OS (Linux)   |

> Note: Actual read/write speeds may vary depending on the UFS module brand, capacity, firmware version, and test environment. The above data are measured reference values.

## Interface Pin Definition

Refer to the hardware schematic diagram on the [Resource Summary Download](../download) page.
