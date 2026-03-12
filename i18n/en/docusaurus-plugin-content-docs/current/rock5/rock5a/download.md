---
sidebar_position: 2
---

import Images from "./\_image.mdx"

# Resource Downloads Summary

## Hardware Design

Radxa ROCK 5A Version V1.1

[v1.1 2D dxf](https://dl.radxa.com/rock5/5a/docs/hw/radxa_rock5a_X1.11_2D.dxf)  
[v1.1 3D stp](https://dl.radxa.com/rock5/5a/docs/hw/rock_5a_3d_pcba.rar)  
[v1.1 Schematic pdf](https://dl.radxa.com/rock5/5a/docs/hw/radxa_rock5a_V1.1_sch.pdf)  
[v1.1 components placement map pdf](https://dl.radxa.com/rock5/5a/docs/hw/radxa_rock5a_V1.1_smd.pdf)

## System Image

### Loader/SPI Image

<Images loader={true} system_img={false} android_img={false} spi_img={true} miniloader={true} dietpi={false} />

### Linux/Android System Image

<Images loader={false} system_img={true} android_img={true} spi_img={false} miniloader={false} dietpi={true} />

:::caution

These images are not maintained by Radxa officially. Radxa cannot guarantee full functionality. If you encounter any problems, please seek help from the corresponding community.

:::

More releases: [Radxa ROCK 5A Release](https://github.com/radxa-build/rock-5a/releases)

### OpenWRT

OpenWRT officially supports Radxa ROCK 5A devices. You can get related firmware and resources from the following link:

[OpenWRT Technical Data Page: Radxa Rock 5A](https://openwrt.org/toh/hwdata/radxa/radxa_rock_5a)

- [Radxa ROCK 5A OpenWRT ext4 sysupgrade image](https://downloads.openwrt.org/releases/25.12.0/targets/rockchip/armv8/openwrt-25.12.0-rockchip-armv8-radxa_rock-5a-ext4-sysupgrade.img.gz)
- [Radxa ROCK 5A OpenWRT squashfs sysupgrade image](https://downloads.openwrt.org/releases/25.12.0/targets/rockchip/armv8/openwrt-25.12.0-rockchip-armv8-radxa_rock-5a-squashfs-sysupgrade.img.gz)

:::caution

OpenWRT is not maintained by Radxa officially. Radxa cannot guarantee full functionality. If you encounter any problems, please seek help from the OpenWRT community.

:::

## Compliance Documents

| Document                           | Download                                                                                                   |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| CE-EMC Test Report                 | [Download](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_CE-EMC_Report.pdf)        |
| CE-EMC Declaration of Conformity   | [Download](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_CE-EMC_Declaration.pdf)   |
| CE-EMC Certificate                 | [Download](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_CE-EMC_Certificate.pdf)   |
| FCC sDoC Test Report               | [Download](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_FCC_sDoC_Report.pdf)      |
| FCC sDoC Declaration of Conformity | [Download](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_FCC_sDoC_Declaration.pdf) |
| FCC sDoC Certificate               | [Download](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_FCC_sDoC_Certificate.pdf) |

If you require compliance documentation for additional regulations or regions, please contact the Radxa sales team. We can arrange new certifications based on bulk order requirements.

## Reference Documentation
