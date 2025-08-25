---
sidebar_position: 1
---

# FEL Mode Description

FEL is a low-level boot and flashing mode in Allwinner chips, mainly used for system recovery or debugging when the device cannot boot from regular storage media.

:::tip
Reference: [FEL Mode](https://linux-sunxi.org/FEL)
:::

## Entering FEL Mode

Before powering on the board, press and hold the UBOOT key on the Cubie A7A. After powering on, release the UBOOT key to enter FEL mode.

:::tip
For the exact location of the UBOOT key, please refer to the interface description section in the [Hardware Interfaces](../../../download) guide!
:::

① : Press and hold the UBOOT key on the Cubie A7A

② : Use a USB Type-A to Type-C data cable to connect the Cubie A7A's USB Type-C port to the PC's USB Type-A port

③ : Release the UBOOT key on the Cubie A7A

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-write-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Installing System Image

After Cubie A7A enters FEL mode, you can install a system image to the eMMC / UFS module in this mode.

For instructions on installing the system image, refer to:

- [Install System to eMMC Module](./emmc_system)
- [Install System to UFS Module](./ufs_system)
