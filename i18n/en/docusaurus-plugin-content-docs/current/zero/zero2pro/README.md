---
sidebar_position: 40
---

# ZERO 2 PRO

## Product Description

- The Radxa ZERO 2 PRO is a small form factor single board computer designed to be used in conjunction with other peripherals.
- It is equipped with the powerful Amlogic A311D processor as a development platform, providing users with excellent computing performance. The multi-core architecture and high-frequency operation enable it to excel in a wide range of complex tasks, including multimedia processing, image processing, artificial intelligence, and data analysis.
- In addition, it integrates highly efficient image and multimedia processing units to support decoding and encoding of high-definition video, as well as smooth image rendering.

## Photograph of sth.

**Radxa ZERO 2 PRO**
![ZERO 2 PRO Overview](/img/zero/zero2pro/zero2pro-mark.webp)

In order to maximize the performance of the Radxa ZERO 2 PRO, it is equipped with a customized cooling module. The cooling module is made of aluminum and is designed with multiple fins to effectively increase the surface area for heat dissipation. It also features a programmable controlled cooling fan that dynamically adjusts its speed according to the current load and temperature demand of the device to avoid unnecessary energy consumption and increase energy efficiency, thus reducing power consumption and heat generation. This enables the Radxa ZERO 2 PRO to maintain stable performance under high load conditions, providing a superior user experience.

<div className='img' style={{ transform: 'scale(.6)' }}>

![ZERO 2 PRO Overview](/img/zero/zero2pro/zero2pro-heatsink.webp)

</div>

### Chip block diagram

![A311D block diagram](/img/zero/zero2pro/A311D-block-digram.webp)

### Features

<table>
    <tr>
        <td align="center">models</td>
        <td align="center">Radxa ZERO 2 PRO</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Amlogic A311D</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">Quad-core Cortex-A73 @ 2.2GHz + Dual-core Cortex-A53 @ 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Arm G52 MP4 GPU, supports OpenGL ES1.1/2.0/3.2, Vulkan 1.1, OpenCL 2.0</td>
    </tr>
    <tr>
        <td align="center">RAM</td>
        <td colspan="2" align="center">4GB LPDDR4</td>
    </tr>
    <tr>
        <td align="center">Storage</td>
        <td align="center">Optional onboard eMMC module: 16/32/64 GB<br/>MicroSD memory card</td>
    </tr>
    <tr>
        <td align="center">Displays</td>
        <td colspan="2" align="center">Micro HDMI x 1, 4K60p<br/>4-channel MIPI DSI interface x 1</td>
    </tr>
    <tr>
        <td align="center">Wireless</td>
        <td align="center">Wi-Fi 5 (802.11 b/g/n/ac)<br/>BT 5.0 with BLE<br/>Equipped with external antenna</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">USB 2.0 Type-C OTG x1<br/>USB 3.0 Type-C HOST x1</td>
    </tr>
    <tr>
        <td align="center">Other</td>
        <td colspan="2" align="center">40-Pin Header</td>
    </tr>
    <tr>
        <td align="center">Power supply</td>
        <td colspan="2" align="center">Supports 5V power adapter, recommended to use a power adapter rated for a maximum current of more than 2A</td>
    </tr>
    <tr>
        <td align="center">Sizes</td>
        <td colspan="2" align="center">65mm x 37mm</td>
    </tr>
</table>

### System block diagram

- **Radxa ZERO 2 PRO**

![zero2pro-interface-overview](/img/zero/zero2pro/zero2pro-block-digram.webp)

## Documentation Guidelines

:::tip
With the exception of the **Other Systems** directory below, everything revolves around Radxa OS (Radxa's customized system based on Debian).
:::.

### [Getting Started](/zero/zero/getting-started)

Introduces system flash, system login, accessory use and other content to enable users to quickly get started.

### [Radxa OS](/zero/zero/radxa-os)

Radxa OS is a customized operating system based on Debian OS. Here is the main introduction of the system login, network connection, etc. It is easy for users to get familiar with the system and use it quickly.
It is easy for users to familiarize themselves with the system and use it quickly.

### [OS Config](/zero/zero/os-config)

Describes how to use a device or feature with a tool (such as rsetup) or command.

### [Applications Deployment](/zero/zero/apps-deployment)

Introduces the configuration and use of common applications like Samba, Docker, PVE, OMV, LAMP, Cheese, Remote Control, and more.

### [Applications Development](/zero/zero/app-development)

Introduction to upper level application development such as QT, WiringX, Mraa, etc.

### [Hardware Design](/zero/zero/hardware-design)

Introduces hardware information, such as hardware interfaces, supported accessories, etc.

### [Low Level Development](/zero/zero/low-level-dev)

Introduction to uboot, kernel, debian os compilation and packaging.

### [Other OS](/zero/zero/other-os)

Introduces other systems that are not Radxa OS, such as Android.

### [Accessories](/zero/zero/accessories)

Introduces supported accessory models and instructions for use.
