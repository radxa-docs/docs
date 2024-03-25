---
sidebar_position: 40
---

# ZERO

## Product Description

- Radxa Zero is a small form factor high performance single board computer based on the Amlogic S905Y2, which runs Android and Linux!
- Radxa Zero has a 4-core 64-bit processor, up to 4GB (32bit) LPDDR4 memory, 4k@60 HDMI output support, WiFi and Bluetooth support, and onboard USB3.0, 40-pin GPIO interface.
- The onboard USB2.0 OTG interface supports power supply and data transfer.

## Physical photos

**Radxa ZERO**
![Radxa ZERO](/img/zero/zero/Zero_ports.webp)

### Chip block diagram

![S905Y2 block diagram](/img/zero/zero/S905Y2-block-digram.webp)

### Features

<table>
    <tr>
        <td align="center">Model</td>
        <td align="center">Radxa ZERO</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Amlogic S905Y2</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">Quad-core Cortex-A53, up to 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Arm Mali G31 MP2 GPU, supports OpenGL ES 3.2, Vulkan 1.0, and OpenCL 2.0.</td>
    </tr>
    <tr>
        <td align="center">RAM</td>
        <td colspan="2" align="center">512 MB，1/2/4 GB LPDDR4</td>
    </tr>
    <tr>
        <td align="center">ROM</td>
        <td align="center">Onboard eMMC Module: 0/8/16/32/64/128 GB<br/>microSD card</td>
    </tr>
    <tr>
        <td align="center">Display</td>
        <td colspan="2" align="center">Micro HDMI x 1，4K60p</td>
    </tr>
    <tr>
        <td align="center">Wireless</td>
        <td align="center">ap6212/ap6256/aw-cm256sm WIFI/BT module</td>
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
        <td colspan="2" align="center">Requires 5V power adapter, recommended to use a power adapter with a rated maximum current greater than 2A</td>
    </tr>
    <tr>
        <td align="center">Size</td>
        <td colspan="2" align="center">65mm x 30mm</td>
    </tr>
</table>

### System Block Diagrams

- **Radxa ZERO**

![zero-interface-overview](/img/zero/zero/zero-block-digram.webp)

### Documentation guidelines

:::tip
Except for the **other systems** directory below, the other contents are based on Radxa OS (Radxa's customized system based on Debian).
:::

### [Getting started](/zero/zero/getting-started)

By introducing system programming, system login, accessory usage, etc., let user can get started quickly.

### [Radxa OS](/zero/zero/radxa-os)

Radxa OS is an operating system customized by Radxa based on Debian OS.
This chapter introduces system login, network connection, etc to let user to be familiar with the system quickly.

### [System Configuration](/zero/zero/os-config)

Introduces how to use tools like rsetup or command line to use devices or function.

### [Application Deployment](/zero/zero/apps-deployment)

Introduces how to deploy the applications such as Samba, Docker, PVE, OMV, LAMP, Cheese, remote control panel, etc.

### [Application Development](/zero/zero/app-development)

Introduces upper-layer application development, such as QT, WiringX, Mraa, etc.

### [Hardware Development](/zero/zero/hardware-design)

Introduces hardware information, such as hardware interfaces, supported accessories, etc.

### [Lower level Development](/zero/zero/low-level-dev)

Introduces uboot, kernel, debian os compilation and packaging, etc.

### [Other Systems](/zero/zero/other-os)

Introduces other systems than Radxa OS, such as Android

### [Accessories](/zero/zero/accessories)

Introduces supported accessory models and instructions for use.
