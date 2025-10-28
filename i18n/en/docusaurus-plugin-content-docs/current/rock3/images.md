---
sidebar_position: 7
---

# Images Download

The Radxa team developed RadxaOS as the official operating system based on Debian.

If you want to try other images, please check [Third-party images](#third-party-images).

:::note
Note: Many third-party images have not been officially tested and may have some problems.
:::

:::tip
Tip: We will publish relevant information about each version release in [Raxa Forum](https://forum.radxa.com/).
:::

## Official Images

<Tabs queryString="model">
<TabItem value="ROCK 3A">

## ROCK 3A

### Official image

The following systems have been officially tested and verified by Radxa:

ROCK 3A: [Build 25](https://github.com/radxa-build/rock-3a/releases/download/b25/rock-3a_debian_bullseye_xfce_b25.img.xz)

For more images, please check: [ROCK 3A radxa-build](https://github.com/radxa-build/rock-3a/releases/latest)

### release notes

### Other alternative systems

#### Android

ROCK 3A is currently using Android 11, you can download the image from the following link:

[ROCK 3A Android 11](https://dl.radxa.com/rock3/images/android/rock3a-android11-20220408_1204-gpt.img.xz)

Additional information:

[Radxa Android Manifests](https://github.com/radxa/manifests)

[ROCK 3A Android 11 Installation Guide](https://wiki.radxa.com/Rock3/install/usb-install)

## Third-party Images

| System                                                                                                                                        | Download                                                                                                                                                                                                                                                         | Version Information                                                                                                                                                                |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [![Armbian](/img/third-party-images-pic/Armbian.webp)](https://discord.com/channels/855634073376260096/888960277788393553/912495051010084895) | [Armbian](https://www.armbian.com/rock-3a/)                                                                                                                                                                                                                      | Build 2021-11-23.<br/>User_name : pi , passward : armbian<br/>[Discord Discussion Group](https://discord.com/channels/855634073376260096/888960277788393553/912495237748899851)    |
| [![Crux](/img/third-party-images-pic/Crux-logo.webp)](http://dl.slarm64.org/crux/images/rock_3/)                                              | [CRUX-ARM](https://dl.slarm64.org/crux/images/rock_3/crux-arm-3.6-aarch64-core-rock_3-6.0.6-build-20221029.img.zst)                                                                                                                                              | Build 2022-10-29.<br/>[README.TXT](http://dl.slarm64.org/slackware/images/rock_3a/README.TXT)<br/>[Forum Discussion Group](https://forum.radxa.com/t/rock-3-crux-arm-aarch64/7183) |
| [![Manjaro](/img/third-party-images-pic/Manjaro-Logo.webp)](https://manjaro.org/download)                                                     | [Manjaro Software Release](https://github.com/manjaro-arm/rock3-a-images/releases)                                                                                                                                                                               | Manjaro Product [Installation Guide](https://manjaro.org/)<br/>[Discord Discussion Group](https://discord.com/channels/855634073376260096/866316562520473600/916175047390003270)   |
| Ubuntu 22.04                                                                                                                                  | ROCK 3A: [ubuntu22.04_rk3568_rock3a_kernel5.10.66-20220523_beta3.zip](https://github.com/qxhome/rk3568-kernel5.10-alldrivers/releases/download/ubuntu22.04-kernel5.10-rk3568-rock3a-alldrivers-beta3/ubuntu22.04_rk3568_rock3a_kernel5.10.66-20220523_beta3.zip) | Contributor： [QXhome](https://forum.radxa.com/t/image-rock3a-kernel-5-10-66/10061)                                                                                                |
| OpenWrt                                                                                                                                       | ROCK 3A: [openwrt-rockchip-armv8-radxa_rock-3a-squashfs-sysupgrade.img.gz](https://github.com/mj22226/openwrt/releases/latest/)                                                                                                                                  | Contributor： [Marty Jones](https://github.com/mj22226)                                                                                                                            |

</TabItem>
<TabItem value="ROCK 3B">

## ROCK 3B

### Official image

The following systems have been officially tested and verified by Radxa:

ROCK 3B: [Build 18](https://github.com/radxa-build/rock-3b/releases/download/b18/rock-3b_debian_bullseye_xfce_b18.img.xz)

- [Rock3B-An11-r12-sd-or-emmc-boot-20240619-gpt.img](https://github.com/radxa/manifests/releases/download/Rock-android11-20240619/Rock3B-An11-r12-sd-or-emmc-boot-20240619-gpt.zip)(Used to flash the system into EMMC and SD card using a card reader)

- [Rock3B-An11-r12-spi_nvme-boot-20240619-update.img](https://github.com/radxa/manifests/releases/download/Rock-android11-20240619/Rock3B-An11-r12-spi_nvme-boot-20240619-update.zip)(Used to flash the system into SSD)

For more images, please check: [ROCK 3B radxa-build](https://github.com/radxa-build/rock-3b/releases/latest)

</TabItem>
<TabItem value="ROCK 3C">

## ROCK 3C

### Official image

The following systems have been officially tested and verified by Radxa:

ROCK 3C: [Build 43](https://github.com/radxa-build/rock-3c/releases/download/b43/rock-3c_debian_bullseye_xfce_b43.img.xz)

- [Rock3C-Android11_r12-20240806-gpt.img](https://github.com/radxa/manifests/releases/download/android11-radxa-20240806/Rock3C-Android11_r12-20240806-gpt.zip)(Used to flash the system into EMMC and SD card using a card reader)

- [Rock3C-Android14-20250718-HDMI-gpt.img](https://github.com/radxa/manifests/releases/download/Android14-rkr6-ROCK3c/ROCK3C-Android14-20250718-HDMI-gpt.zip)(Used to flash the system into EMMC and SD card using a card reader)

:::tip
The usage method of Rock 3C's Android 11 image is the same as Rock 3A, and can be referred to for use
:::

</TabItem>
<TabItem value="E25">

## Radxa E25

### Official image

The following systems have been officially tested and verified by Radxa:

Radxa E25: [Build 21](https://github.com/radxa-build/radxa-e25/releases/download/b21/radxa-e25_debian_bullseye_cli_b21.img.xz)

### Third-party Images

| System  | Download                                                                                                                                                                                                          | introduction                                                                                                                                                                                    |
| ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| OpenWrt | [OpenWRT Technical Data Page: Radxa E25](https://openwrt.org/toh/hwdata/radxa/radxa_e25)<br/>[Flippy OpenWrt Radxa E25](https://dl.radxa.com/cm3i/e25/openwrt/openwrt_rk3568_e25_R24.01.26_k6.1.75-flippy-87+.7z) | OpenWRT officially supports this device. If you encounter any problems, please seek help from the [OpenWRT Forum](https://forum.openwrt.org/)<br/> Login account: root <br/> Password: password |

</TabItem>
</Tabs>
