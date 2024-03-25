---
sidebar_position: 2
---

# Install Yocto System

## Environment configuration

[Linux environment](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/env-setup/flash-env-linux.html)

[Windows environment](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/env-setup/flash-env-windows.html)

## Installation Steps

:::tip
Before installing the system to the UFS, the UFS needs to be [formatted](https://www.ipi.wiki/pages/1200-docs?page=UfsFormat.html).
:::

1. Download the image and unzip it, enter the image folder

- Download address:https://github.com/radxa-build/radxa-nio-12l/releases

2. run genio-flash

- Enable overlay need add --load-dtbo parameter, For example: genio-flash --load-dtbo palmshell-nio12-radxa-display-8hd.dtbo
  ![install-yocto](/img/nio/nio12l/install-yocto-system.webp)

3. Press and hold download key,Use the TYPE C data cable to connect the TYPE-C OTG port and your PC,after starting to download,
   you can release the download key.

:::tip
Step 2 must be performed first, and then step 3.
:::

# Reference

[MT8395(G1200) Dev Guide](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/hw/mt8395-soc.html)
