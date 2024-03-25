---
sidebar_position: 5
---

# ROCK 5B

## Product Description

The ROCK 5B is an elegant single board computer (SBC) based on the RK3588 chipset. Its compact size of 100 x 75 mm encompasses almost all the features of the RK3588, providing excellent flexibility and scalability. the ROCK 5B provides a solid foundation for users such as geeks, SBC enthusiasts, IoT enthusiasts, and university students and faculty to turn their ideas into realities. It has a wide range of applications in edge computing, artificial intelligence, cloud computing, smart surveillance and other fields.

ROCK 5B can be used as:

- Personal desktop computer
- Personal private server
- Android video and audio player
- Robot controller
- Blockchain node

More usage scenarios are waiting for you to discover!

### Physical Photos

<img src="/img/rock5b/rock-5b-overview.webp" alt="rock 5b overview" width="700" />

### Chip block diagram

<img src="/img/rock5b/rk3588-block-diagram.webp" alt="rk3588 system diagram" width="700" />

### Features

<table>
    <tr>
        <td align="center">Model</td>
        <td align="center">ROCK 5B</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Rockchip rk3588</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">Quad-core Cortex-A76 with up to 2.4 GHz<br/>Quad-core Cortex-A55 at up to 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Mali G610MP4 GPU with support for OpenGLES 1.1, 2.0 and 3.2, OpenCL up to 2.2 and Vulkan 1.2</td>
    </tr>
    <tr>
        <td align="center">RAM</td>
        <td colspan="2" align="center">4/8/16 64 Bits LPDDR4x</td>
    </tr>
    <tr>
        <td align="center">Storage</td>
        <td align="center">On board eMMC module：0/8/16/32/64 GB<br/>microSD Card</td>
    </tr>
    <tr>
        <td align="center">Display</td>
        <td colspan="2" align="center">Up to four display devices via two HDMI, one DP (type C), one MIPI DSI<br/>Resolution up to 3x 4K@60FPS + 1x 1080P@60FPS or 1x 8K@60FPS + 1x 4K@60FPS + 1x 1080P@60FPS</td>
    </tr>
    <tr>
        <td align="center">Hardware codec</td>
        <td colspan="2" align="center">H.265/VP9 (HEVC)/AVS2 Hardware Decoding (up to 8Kp60)<br/>H.264 Hardware Decoding (up to 8Kp30<br/>H.265/H.264 Hardware Encoding (up to 8Kp30))</td>
    </tr>
    <tr>
        <td align="center">Ethernet</td>
        <td align="center">Gigabit Ethernet with Power over Ethernet (PoE) support<br/>PoE requires additional optional HAT</td>
    </tr>
    <tr>
        <td align="center">Wireless</td>
        <td align="center">Wi-Fi 6 (802.11 b/g/n) BT 5.0 with BLE</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">2x USB 2 port<br/>1x USB 3 HOST port, 1x USB3 OTG port</td>
    </tr>
    <tr>
        <td align="center">Camera</td>
        <td colspan="2" align="center">1x4 lane MIPI CSI</td>
    </tr>
    <tr>
        <td align="center">Others</td>
        <td colspan="2" align="center">40 Pin Header</td>
    </tr>
    <tr>
        <td align="center">Power</td>
        <td colspan="2" align="center">Supports USB Type-C PD 2.0 at 9V/2A, 12V/2A, 15V/2A and 20V/2A.</td>
    </tr>
    <tr>
        <td align="center">Size</td>
        <td colspan="2" align="center">100 x 75 mm</td>
    </tr>
</table>

### System block diagram

<img src="/img/rock5b/rock-5b-block-digram.webp" alt="rock 5b system diagram" width="700" />

## Documentation guidelines

:::tip
With the exception of the **Other Systems** directory below, everything is centered around Radxa OS (Radxa's customized system based on Debian).
:::

### [Getting Started](/rock5/rock5b/getting-started)

Introduces system burn-in, system login, accessory use, etc. for users to get started quickly.

### [Radxa OS](/rock5/rock5b/radxa-os)

Radxa OS is a customized operating system based on Debian OS. Here we introduce the system login, network connection and other contents.
This is a quick guide for users to familiarize themselves with the system.

### [System configuration](/rock5/rock5b/os-config)

This section describes how to utilize a device or feature with a tool (e.g. rsetup) or command.

### [Application Deployment](/rock5/rock5b/apps-deployment)

This section introduces the configuration and use of common applications such as Samba, Docker, PVE, OMV, LAMP, Cheese, and Remote Control.

### [Application Development](/rock5/rock5b/app-development)

Introduces upper level application development, such as QT, WiringX, Mraa, etc.

### [Hardware development](/rock5/rock5b/hardware-design)

Introduces hardware information, such as hardware interfaces, supported accessories, and so on.

### [Lower-level development](/rock5/rock5b/low-level-dev)

Introduces uboot, kernel, debian os compilation and packaging.

### [Other systems](/rock5/rock5b/other-os)

Introduces other systems than Radxa OS, such as Android.

### [Accessory list](/rock5/rock5b/accessories)

This section describes the supported accessory models and describes how to use them.
