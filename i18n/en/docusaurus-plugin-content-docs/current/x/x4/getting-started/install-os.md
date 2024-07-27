---
sidebar_position: 11
---

# Installing the Operating System

## Manual Operating System Installation

### Creating Installation Media

:::tip
You'll need to operate on another Windows device.
:::

1. Download the image from the official website

   - [Windows 10](https://www.microsoft.com/software-download/windows10)
   - [Windows 11](https://www.microsoft.com/software-download/windows11)
   - [Ubuntu](https://ubuntu.com/download)
   - [Debian](https://www.debian.org/download)
   - [Fedora](https://fedoraproject.org/workstation/download)

2. Write the image to a USB drive.

- You can use [Rufus](https://rufus.ie/) to burn the installation image to the USB drive. After selecting the image you downloaded and the device (your USB drive), click **Start** and patiently wait for the burning process to finish. If all goes well, you have successfully created an installation media.

<img alt="rufus01-en.webp" src="../../../img/x/x2l/rufus01-en.webp" width="320"/>

- Alternatively, you can use [balenaEtcher](https://etcher.balena.io/#download-etcher) to burn the installation image to the USB drive. After selecting the image you downloaded and the target disk (your USB drive), click **Flash!** and patiently wait for the burning process to finish. If all goes well, you have successfully created an installation media.

<img alt="balenaEtcher01-en.webp" src="../../../img/x/x2l/balenaEtcher01-en.webp" width="730"/>

### Pre-Power-On Operations

:::tip
Radxa X4 is equipped with onboard eMMC depends on the specific configuration you purchase.
:::

<Tabs  groupId="to" queryString>
<TabItem value="nvme" label="Install to NVMe" default>
Gently insert the M.2 2230 NVMe SSD into the corresponding M.2 M Key slot and secure it in place with M2 x 4 flat head screws.
</TabItem>
<TabItem value="emmc" label="Install to eMMC">

</TabItem>
</Tabs>

Insert the USB drive that has been burned into any USB port, preferably a USB 3 port.

Connect the monitor to the motherboard HDMI port using an HDMI cable.

Plug in a mouse and keyboard into any USB port.

### Boot to Installation Media

- Power on your Radxa X4 device.

- After the display appears, immediately press `F7` to enter the boot selection interface.

![Boot_menu](/img/roobi/boot_menu.webp)

- Select your USB device and press `Enter` to choose the corresponding entry to boot the installation image.

- Follow the on-screen prompts to continue with the system installation.

### Driver Installation

After manually installing the image, you'll typically need the corresponding drivers. Please refer to [Driver Installation](../driver).
