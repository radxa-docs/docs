---
sidebar_position: 3
---

# ROCK 3C

## Product Description

ROCK 3C is an SBC developed based on RK3566 SoC. Equipped with a quad-core Cortex-A55 ARM processor, onboard 32-bit LPDDR4 memory, onboard Radxa D8 WiFi module (V1.3 onboard AP6256), supports 1080P@60 HDMI, MIPI DSI, MIPI CSI, and supports microphone 3.5 mm audio jack, USB port, Gigabit Ethernet, PCIe 2.0, 40-pin IO expansion header.

### Physical Photos

<Tabs queryString="Overview">
<TabItem value="V1.4">

![ROCK 3C V1.4 Overview](/img/rock3/3c/rock3c-overview-v1.4.webp)

</TabItem>
<TabItem value="V1.3">

![ROCK 3C V1.4 Overview](/img/rock3/3c/rock3c-overview-v1.3.webp)

</TabItem>
</Tabs>

### Chip Block Diagram

![rk3566 block diagram](/img/rock3/rk3566_block_diagram.webp)

### Features

<table>
    <tr>
        <td align="center">Model</td>
        <td align="center">Radxa ROCK 3C</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Rockchip rk3566</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">Quad-core Cortex-A55, up to 1.6GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Arm Mali™‑G52‑2EE, Arm Mali™‑G52‑2EE, OpenGL® ES1.1/2.0/3.2, Vulkan® 1.1, OpenCL™ 2.0</td>
    </tr>
    <tr>
        <td align="center">RAM</td>
        <td colspan="2" align="center">1/2/4 GB LPDDR4</td>
    </tr>
    <tr>
        <td align="center">Storage</td>
        <td align="center">eMMC Module<br/>microSD Storage card</td>
    </tr>
    <tr>
        <td align="center">Display</td>
        <td colspan="2" align="center">1080P@60 HDMI<br/>2-lane MIPI DSI</td>
    </tr>
    <tr>
        <td align="center">Ethernet</td>
        <td align="center">Gigabit Ethernet, Supports POE<br/>PoE requires additional optional HAT</td>
    </tr>
    <tr>
        <td align="center">Wireless</td>
        <td align="center">Wi-Fi 6 & BT 5.4(V1.4)<br/>Wi-Fi 5 & BT 5.0(V1.3)</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">USB 2.0 OTG x1<br/>USB 2.0 HOST x2<br/>USB 3.0 HOST x1</td>
    </tr>
    <tr>
        <td align="center">Camera</td>
        <td colspan="2" align="center">2-lane MIPI CSI x1</td>
    </tr>
    <tr>
        <td align="center">Others</td>
        <td colspan="2" align="center">40 PIN GPIO extends Header</td>
    </tr>
    <tr>
        <td align="center">Power</td>
        <td colspan="2" align="center"> 5V/2A Adapter</td>
    </tr>
    <tr>
        <td align="center">Size</td>
        <td colspan="2" align="center">85mm x 56mm</td>
    </tr>
</table>

### System block diagram

![ROCK 3C system block diagram](/img/rock3/3c/rock3c-system-diagram.webp)

## Documentation guidelines

### [Getting started](/rock3/rock3c/getting-started)

By introducing system programming, system login, accessory usage, etc., let user can get started quickly.

### [Radxa OS](/rock3/rock3c/radxa-os)

Radxa OS is an operating system customized by Radxa based on Debian OS. This chapter introduces system login, network connection, etc to let user to be familiar with the system quickly.

### [System Configuration](/rock3/rock3c/system-config)

Introduces how to use tools like rsetup or command line to use devices or function.

### [Application Deployment](/rock3/rock3c/apps-deployment)

Introduces the configuration and use of common applications such as Samba and Docker.

### [Accrssories Guides](/rock3/rock3c/accessories)

Introduces supported accessory models and instructions for use.

### [Hardware Development](/rock3/rock3c/hardware-design)

Introduces hardware information, such as hardware interfaces, supported accessories, etc.

### [Lower level Development](/rock3/rock3c/low-level-dev)

Introduces uboot, kernel, debian os compilation and packaging, etc.
