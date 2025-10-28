---
sidebar_position: 2
---

# eMMC / UFS Module Interface

The Radxa Cubie A7A features an onboard eMMC/UFS combo module interface that supports installing either eMMC or UFS modules, which can be used as a system boot drive or for expanded storage.

## User Guide

eMMC modules are suitable for smaller capacity storage (8-128GB), while UFS modules are ideal for larger capacity storage (64GB-1TB).

- **Expanding Storage**

You can directly install an eMMC or UFS module into the eMMC/UFS combo module interface, then boot the system and use the `lsblk` command to verify if the module is recognized.

- **As a System Boot Drive**

To use an eMMC module as a system boot drive: Refer to the [Installing System to eMMC Module](../getting-started/install-system/emmc-system/) guide.

To use a UFS module as a system boot drive: Refer to the [Installing System to UFS Module](../getting-started/install-system/ufs-system/) guide.

<Tabs queryString="boot_system">

<TabItem value="eMMC Module">

Insert the eMMC module into the eMMC/UFS combo module interface of the Cubie A7A.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-emmc-single.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="UFS Module">

Insert the UFS module into the eMMC/UFS combo module interface of the Cubie A7A.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-ufs-single.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>
</Tabs>

:::caution
eMMC/UFS Module Installation Steps:

1. Ensure the notch on the eMMC/UFS module aligns with the orientation of the Cubie A7A's eMMC/UFS module interface
2. Make sure the bottom edge connector of the eMMC/UFS module is properly aligned with the Cubie A7A's eMMC/UFS module interface
3. Gently press down on one end of the module until you hear a "click" sound, then repeat for the other end to ensure the module is securely installed.
   :::

## Interface Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematics](../download) document in the download section.
:::
