---
sidebar_position: 5
---

# ZERO 3

## Product Description

- The Radxa ZERO 3W/3E is an ultra-small, high-performance single board computer based on the Rockchip RK3566, with a compact form factor and rich interfaces.
- Tailored for a diverse user base including manufacturers, IoT developers, hobbyists, and PC DIY enthusiasts, the Radxa ZERO 3W/3E is an ultra-small, versatile platform that can be used for a wide variety of applications, including IoT devices, machine learning edge computing, home automation, education, and entertainment.
- The ZERO 3W and ZERO 3E are basically the same size and model, but differ only in storage and network interfaces. For details, please refer to the Features section of this article.

### Physical Photos

<Tabs queryString="model">
<TabItem  value="zero-3w" label="ZERO 3W">

- **Radxa ZERO 3W**
  ![ZERO 3W Overview](/img/zero/zero3/radxa_zero_3w.webp)

</TabItem>

<TabItem value="zero-3e" label="ZERO 3E">

- **Radxa ZERO 3E**

  ![ZERO 3E Overview](/img/zero/zero3/radxa_zero_3e.webp)

</TabItem>
</Tabs>
### Chip Block Diagram

![RK3566 block diagram](/img/rock3/rk3566_block_diagram.webp)

### Features

<table>
    <tr>
        <td align="center">Model</td>
        <td align="center">Radxa ZERO 3W</td>
        <td align="center">Radxa ZERO 3E</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Rockchip RK3566</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">Quad-core Cortex-A55, up to 1.6GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Arm Mali™‑G52‑2EE, Supports Arm Mali™‑G52‑2EE, OpenGL® ES1.1/2.0/3.2, Vulkan® 1.1, OpenCL™ 2.0</td>
    </tr>
    <tr>
        <td align="center">RAM</td>
        <td colspan="2" align="center">1/2/4/8 GB LPDDR4</td>
    </tr>
    <tr>
        <td align="center">Storage</td>
        <td align="center">eMMC on Board：0/8/16/32/64 GB<br/>microSD Card</td>
        <td align="center">microSD Card</td>
    </tr>
    <tr>
        <td align="center">Display</td>
        <td colspan="2" align="center">Provide Micro HDMI Interface：Supports 1080p60 output</td>
    </tr>
    <tr>
        <td align="center">Ethernet</td>
        <td align="center">/</td>
        <td align="center">Gigabit Ethernet, Supports POE<br/>PoE requires additional optional HAT</td>
    </tr>
    <tr>
        <td align="center">Wireless</td>
        <td align="center">Wi-Fi 6 (802.11 b/g/n) BT 5.0 with BLE</td>
        <td align="center">/</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">USB 2.0 Type-C OTG x1<br/>USB 3.0 Type-C HOST x1</td>
    </tr>
    <tr>
        <td align="center">Camera</td>
        <td colspan="2" align="center">1x4 lane MIPI CSI</td>
    </tr>
    <tr>
        <td align="center">Others</td>
        <td colspan="2" align="center">40 Pin extends Header</td>
    </tr>
    <tr>
        <td align="center">Power</td>
        <td colspan="2" align="center">Requires 5V/2A power adapter</td>
    </tr>
    <tr>
        <td align="center">Size</td>
        <td colspan="2" align="center">65mm x 30mm</td>
    </tr>
</table>

### System block diagram

<Tabs queryString="model">
<TabItem value="zero-3w" label="ZERO 3W">

- **Radxa ZERO 3W**

![zero-3w-interface-overview](/img/zero/zero3/zero-3w-interface-overview.webp)

</TabItem>

<TabItem value="zero-3e" label="ZERO 3E">

- **Radxa ZERO 3E**

![zero-3e-interface-overview](/img/zero/zero3/zero-3e-interface-overview.webp)

</TabItem>

</Tabs>

### Documentation guidelines

:::tip
Except for the **other systems** directory below, the other contents are based on Radxa OS (Radxa's customized system based on Debian).
:::

### [Getting started](/zero/zero3/getting-started)

By introducing system programming, system login, accessory usage, etc., let user can get started quickly.

### [Radxa OS](/zero/zero3/radxa-os)

Radxa OS is an operating system customized by Radxa based on Debian OS.
This chapter introduces system login, network connection, etc to let user to be familiar with the system quickly.

### [System Configuration](/zero/zero3/os-config)

Introduces how to use tools like rsetup or command line to use devices or function.

### [Application Deployment](/zero/zero3/apps-deployment)

Introduces how to deploy the applications such as Samba, Docker, PVE, OMV, LAMP, Cheese, remote control panel, etc.

### [Application Development](/zero/zero3/app-development)

Introduces upper-layer application development, such as QT, WiringX, Mraa, etc.

### [Hardware Development](/zero/zero3/hardware-design)

Introduces hardware information, such as hardware interfaces, supported accessories, etc.

### [Lower level Development](/zero/zero3/low-level-dev)

Introduces uboot, kernel, debian os compilation and packaging, etc.

### [Other Systems](/zero/zero3/other-os)

Introduces other systems than Radxa OS, such as Android

### [Accessories](/zero/zero3/accessories)

Introduces supported accessory models and instructions for use.
