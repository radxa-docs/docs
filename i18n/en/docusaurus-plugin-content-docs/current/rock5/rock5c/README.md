---
sidebar_position: 5
---

# ROCK 5C

## Product Description

Radxa ROCK 5C is a compact single-board computer (SBC) that offers a range of cutting-edge features, characteristics, and expansion options. It is the ideal choice for makers, IoT enthusiasts, hobbyists, gamers, PC users, and anyone in need of a high-spec platform with excellent performance and reliability. Radxa ROCK 5C comes in two versions: a standard version based on RK3588S2 and a Lite version based on RK3582. The standard version and Lite version share most of the features, the only difference lies in the SoC (System-on-Chip). In the following documentation, unless otherwise specified, 'ROCK 5C' refers to both the ROCK 5C standard version and 5C Lite version.

ROCK 5C can be used as:

- Personal desktop computer
- Personal private server
- Android video and audio player
- Robot controller
- Blockchain node

More usage scenarios are waiting for you to discover!

### Physical Photos

<Tabs queryString="target">

  <TabItem value="rock-5c" label="ROCK 5C">
  <img src="/img/rock5c/rock-5c-overview.webp" alt="rock 5c overview" width="700" />
  </TabItem>

  <TabItem value="rock-5c-lite" label="ROCK 5C Lite">
  <img src="/img/rock5c/rock-5c-lite-overview.webp" alt="rock 5c lite overview" width="700" />
  </TabItem>

</Tabs>

### Chip block diagram

<Tabs queryString="target">

  <TabItem value="rk3588s2" label="RK3588S2">
  <img src="/img/rock5c/rk3588s2_blockdiagram.webp" alt="rock 5c overview" width="700" />
  </TabItem>

  <TabItem value="rk3582" label="RK3582">
  <img src="/img/rock5c/rk3582_blockdiagram.webp" alt="rock 5c lite overview" width="700" />
  </TabItem>

</Tabs>

### Features

<table>
    <tr>
        <td align="center">Model</td>
        <td align="center">ROCK 5C</td>
        <td align="center">ROCK 5C Lite</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td align="center">Rockchip RK3588S2</td>
        <td align="center">Rockchip RK3582</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td align="center">Quad-core Cortex-A76 with up to 2.4 GHz<br/>Quad-core Cortex-A55 at up to 1.8GHz</td>
        <td align="center">Dual-core Cortex-A76 with up to 2.4 GHz<br/>Quad-core Cortex-A55 at up to 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td align="center"> Arm Mali‑G610MC4 </td>
        <td align="center"> N/A </td>
    </tr>
    <tr>
        <td align="center">RAM</td>
        <td align="center">2/4/8/16/32GB 64 Bits LPDDR4x</td>
        <td align="center">1/2/4/8/16GB 64 Bits LPDDR4x</td>
    </tr>
    <tr>
        <td align="center">Storage</td>
        <td align="center" colspan="2"> 1x eMMC Connector <br/> 1x microSD Card <br/> No SPI Flash </td>
    </tr>
    <tr>
        <td align="center">Video Output</td>
        <td align="center" colspan="2">1x HDMI 2.1 supporting up to 8K<br/>1x MIPI DSI supporting up 2K</td>
    </tr>
    <tr>
        <td align="center">Multimedia</td>
        <td align="center">H.265 and VP9 decoder by 8K@60fps<br/>H.264 decoder by 8K@30fps<br/>AV1 decoder by 4K@60fps<br/>H.264 and H.265 encoder by 8K@30fps</td>
        <td align="center">H.264 and H.265 encoder by 4K@60fps</td>
    </tr>
    <tr>
        <td align="center">Ethernet</td>
        <td align="center" colspan="2">Gigabit Ethernet with Power over Ethernet (PoE) support<br/>PoE requires additional optional HAT</td>
    </tr>
    <tr>
        <td align="center">Wireless</td>
        <td align="center" colspan="2">1x WiFi 6 and BT 5.4 with External Antenna Connector</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td align="center" colspan="2">2x USB 2 port<br/>1x USB 3 HOST port, 1x USB3 OTG port</td>
    </tr>
    <tr>
        <td align="center">Camera</td>
        <td align="center" colspan="2">1x4 lane MIPI CSI</td>
    </tr>
    <tr>
        <td align="center">Others</td>
        <td align="center" colspan="2">40 Pin Header</td>
    </tr>
        <tr>
        <td align="center">Power</td>
        <td align="center" colspan="2">Supports 5V</td>
    </tr>
        <tr>
        <td align="center">Size</td>
        <td align="center" colspan="2">86 x 56 mm</td>
    </tr>
</table>

## Documentation guidelines

:::tip
With the exception of the **Other Systems** directory below, everything is centered around Radxa OS (Radxa's customized system based on Debian).
:::

### [Getting Started](/rock5/rock5c/getting-started)

Introduces system burn-in, system login, accessory use, etc. for users to get started quickly.

### [Radxa OS](/rock5/rock5c/radxa-os)

Radxa OS is a customized operating system based on Debian OS. Here we introduce the system login, network connection and other contents.
This is a quick guide for users to familiarize themselves with the system.

### [System configuration](/rock5/rock5c/os-config)

This section describes how to utilize a device or feature with a tool (e.g. rsetup) or command.

### [Application Deployment](/rock5/rock5c/apps-deployment)

This section introduces the configuration and use of common applications such as Samba, Docker, PVE, OMV, LAMP, Cheese, and Remote Control.

### [Application Development](/rock5/rock5c/app-development)

Introduces upper level application development, such as QT, WiringX, Mraa, etc.

### [Hardware development](/rock5/rock5c/hardware-design)

Introduces hardware information, such as hardware interfaces, supported accessories, and so on.

### [Lower-level development](/rock5/rock5c/low-level-dev)

Introduces uboot, kernel, debian os compilation and packaging.

### [Other systems](/rock5/rock5c/other-os)

Introduces other systems than Radxa OS, such as Android.

### [Accessory list](/rock5/rock5c/accessories)

This section describes the supported accessory models and describes how to use them.
