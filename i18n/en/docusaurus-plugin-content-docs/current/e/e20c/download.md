---
sidebar_position: 2
---

import Images from "./\_image.mdx"

# Summary of resource downloads

## OS image

istoreos:

[istoreos-22.03.6-2024062810-e20c-squashfs.img.gz](https://dl.radxa.com/rock2/images/istoreos/istoreos-22.03.6-2024062810-e20c-squashfs.img.gz)

debian xfce:

[https://github.com/radxa-build/rock-2/releases/download/b1/rock-2_bullseye_xfce_b1.output.img.xz](https://github.com/radxa-build/rock-2/releases/download/b1/rock-2_bullseye_xfce_b1.output.img.xz)

OpenWrt:

[Radxa E20C OpenWrt](https://dl.radxa.com/e/e20c/image/openwrt_rk3528_e20c_R24.07.07_k5.10.160-rk35xx-flippy-2407a.7z)

:::tip
This image is fully compatible with E20C, ROCK 2A, and ROCK 2F devices, all incorporating the RK3528 chip. The compatible method is as follow:

- Each of these three products employs distinct pull-down resistors on a shared ADC pin.
- Each device comes with a predefined ADC range value.
- During the u-boot initialization phase, the appropriate device tree is dynamically selected based on the read ADC value, thereby achieving seamless compatibility across these platforms.
  :::

## Loader

[rk3528_spl_loader_v1.07.104.bin](https://dl.radxa.com/rock2/images/loader/rk3528_spl_loader_v1.07.104.bin)

## Hardware Design

Radxa E20C Version V1.1

[V1.1 Components_Placement_map_pdf](https://dl.radxa.com/e/e20c/v1.10/radxa_e20c_v1100_Components_Placement_map.pdf)  
[V1.1 Schematic pdf](https://dl.radxa.com/e/e20c/v1.10/radxa_e20c_v1100_schematic.pdf)

## Quality Certification

## Reference Documentation

## 3D Design

### Third Party Enclosure

- [E20C Enclosure with fan support](https://makerworld.com/en/models/519794#profileId-436182) by [JasonYANG17](https://makerworld.com/en/@Jasonyang170)
- [Radxa E20C Box](https://www.printables.com/model/931601-radxa-e20c-box) by [cclll](https://www.printables.com/@cclll_947574)
