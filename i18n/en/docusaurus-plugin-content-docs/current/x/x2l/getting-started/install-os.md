---
sidebar_position: 11
---

# Installing the Operating System

Installing the operating system for the first time

:::warning
The Radxa X2L doesn't come with a CMOS battery. For the first time power on, the BIOS initializes hardware setting, the red light is on. This will last about 1 minute then X2L will reboot, and the white light is on, and the BIOS boots normally. Without CMOS battery(Type: CR1220), the above will repeat.
:::

## Installing the Operating System Using ROOBI OS

If your X2L comes with the ROOBI OS system, you can refer to [this document](https://palmshell.feishu.cn/wiki/EdOYwLvJIi8N63kAkpDcpm9ZnZd) for usage instructions.

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

<Tabs  groupId="to" queryString>
<TabItem value="nvme" label="Install to NVMe" default>
Gently insert the NVMe SSD into the corresponding M.2 M Key slot and secure it in place with M2 x 4 flat head screws.
</TabItem>
<TabItem value="emmc" label="Install to eMMC">

:::tip

We do not recommend installing the system to eMMC. This will render [ROOBI OS](../../roobi) unusable.

:::

</TabItem>
</Tabs>

Insert the USB drive that has been burned into any USB port, preferably a USB 3 port.

Connect the monitor to the motherboard HDMI port using an HDMI cable.

Plug in a mouse and keyboard into any USB port.

### Boot to Installation Media

<Tabs  groupId="to" queryString>
<TabItem value="nvme" label="Install to NVMe" default>
<ul>
<li>Power on your device</li>
</ul>
</TabItem>
<TabItem value="emmc" label="Install to eMMC">

<ul>
<p><li>Power on your device</li> </p>

<li>You can choose to perform any of the following:</li>
<br/>
<p>1. Activate eMMC: Before booting up, hold down the <InlineSuccess>eMMC Recovery button</InlineSuccess> and keep it pressed, simultaneously press and immediately release the <InlineSuccess>Power button</InlineSuccess>, and release the <InlineSuccess>eMMC Recovery button</InlineSuccess> when the display lights up.</p>
<p>2. <a href="../bios/emmc-availability">Set eMMC activation status</a></p>
</ul>

</TabItem>
</Tabs>

- After the display appears, immediately press `F7` to enter the boot selection interface.

![Boot_menu](/img/x/roobi/boot_menu.webp)

- Select your USB device and press `Enter` to choose the corresponding entry to boot the installation image.

- Follow the on-screen prompts to continue with the system installation.

### Driver Installation

After manually installing the image, you'll typically need the corresponding drivers. Please refer to [Driver Installation](../driver).
