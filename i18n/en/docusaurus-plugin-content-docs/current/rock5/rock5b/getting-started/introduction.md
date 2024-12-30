---
sidebar_position: 1
description: "A brief introduction to the ROCK 5B/5B+"
---

# Product Introduction

## Key Features

The ROCK 5B/5B+ is an elegant single board computer (SBC) based on the RK3588 chipset. Its compact size of 100 x 75 mm encompasses almost all the features of the RK3588, providing excellent flexibility and scalability.The ROCK 5B/5B+ provides users such as geeks, SBC enthusiasts, IoT enthusiasts, and university faculty and students with a solid foundation for turning ideas into reality. It has a wide range of applications in edge computing, artificial intelligence, cloud computing, smart surveillance and other fields.

ROCK 5B/5B+ can be used as:

- Personal desktop computer
- Personal private server
- Android video and audio player
- Robot controller
- Blockchain node

More other usage scenarios are waiting for you to discover!

### Rich Interface

ROCK 5B/5B+ provides rich interfaces, including multiple USB and HDMI ports, which are convenient for connecting external devices and expanding functions. For details, please refer to [Parameter Configuration](#parameter-configuration).

### Accessory Eco-Rich

ROCK 5B/5B+ supports a variety of cameras and displays.

### Powerful multimedia processing capability

Supports 8K video encoding and decoding, as well as advanced graphics processing. Integrates an AI acceleration unit, making it well-suited for high-definition smart TVs and multimedia applications.

### Rich OS support

ROCK 5B/5B+ supports a variety of operating systems, including Debian and Android, as well as third-party operating systems such as FydeOS/Armbian, etc., which are suitable for various application scenarios.

### Potential for development

As a powerful development platform, ROCK 5B/5B+ has great potential for artificial intelligence, edge computing, embedded systems and other fields.

### Open source support

ROCK 5B provides complete hardware design schematics and software source code, a feature that allows most DIY design enthusiasts and developers to make personalized modifications and functionality expansion, and attracts a large number of open source enthusiasts to be active in the community, which is conducive to the promotion of knowledge-sharing and technological innovation.

## Motherboard Preview

<Tabs queryString="versions">
    <TabItem value="ROCK 5B">
        <img src="/img/rock5b/rock-5b-overview-v1-45.webp" alt="rock 5b overview" width="700" />
    </TabItem>
    <TabItem value="ROCK 5B+">
        <img src="/img/rock5b/rock5b-plus-overview.webp" alt="rock 5b+ overview" width="700" />
    </TabItem>
</Tabs>

## Parameter Configuration

<table>
    <tr>
        <td align="center">Model</td>
        <td align="center">ROCK 5B</td>
        <td align="center">ROCK 5B+</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2"  align="center">Rockchip RK3588</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">Quad-core Cortex-A76 up to 2.4GHz<br/>Quad-small-core Cortex-A55 up to 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Mali G610MP4 supports OpenGLES 1.1/2.0/3.2<br />OpenCL 1.1/1.2/2.2 <br/> Vulkan 1.1 and 1.2</td>
    </tr>
    <tr>
    <td align="center">NPU</td>
    <td colspan="2" align="center">NPU supports INT4/INT8/INT16/FP16/BF16 and TF32 acceleration with up to 6TOPs of computation power.</td>
    </tr>
    <tr>
        <td align="center">RAM</td>
        <td align="center">4/8/16 64 bit LPDDR4</td>
        <td align="center">4/8/16/32 64 bit LPDDR5</td>
    </tr>
    <tr>
        <td align="center">Storage</td>
        <td align="center">eMMC Connector<br/>microSD memory card</td>
        <td align="center">Onboard eMMC module: 32/64/128/256 GB<br/>microSD memory card</td>
    </tr>
    <tr>
        <td align="center">Display</td>
        <td align="center">Provides 4 display outputs via two HDMI, one DP (C-Type) and one MIPI DSI<br/>Resolution up to 3x 4K@60FPS + 1x 1080P@60FPS or 1x 8K@60FPS + 1x 4K@60FPS + 1x 1080P@60FPS<br/>1x Micro HDMI input port, supporting up to 4Kp60 display input</td>
        <td align="center">Provides 4 display outputs via two HDMI, one DP (C-Type) and one MIPI DSI<br/>Resolution up to 3x 4K@60FPS + 1x 1080P@60FPS or 1x 8K@60FPS + 1x 4K@60FPS + 1x 1080P@60FPS<br/>1x standard HDMI input port, supports up to 4Kp60 display inputs</td>
    </tr>
    <tr>
        <td align="center">Hardware Codecs</td>
        <td colspan="2" align="center">H.265/H.264/AV1/AVS2 Hardware Decoding up to 8K@60fps<br/>H.265/H.264 hardware encoding up to 8K@30fps</td>
    </tr>
    <tr>
        <td align="center">Ethernet</td>
        <td colspan="2" align="center">2.5G Ethernet with Power over Ethernet (PoE) support<br/>PoE requires additional optional HAT</td>
    </tr>
    <tr>
        <td align="center">On-board WIFI</td>
        <td align="center">No on-board WiFi</td>
        <td align="center">Equipped with on-board WiFi Realtek 8852BE</td>
    </tr>  
    <tr>
        <td align="center">M.2</td>
        <td align="center">M.2 E Key connector providing PCIe 2.1 single channel, USB, SATA, SDIO, PCM, and UART signals supporting industry standard M.2 WiFi 6 modules.<br/>M.2 M Key connector with quad-channel PCIe 3.0 interface. The board has a standard M.2 2280 mounting hole for an M.2 2280 NVMe SSD. Note that M.2 SATA SSDs are not supported.</td>
        <td>M.2 B Key connector that provides USB signaling and supports 4G modules. Easy connection to mobile networks through the use of a SIM card.<br/>The M.2 M Key connector provides a total of two dual-channel PCIe 3.0 ports and standard M.2 2280 mounting holes for M.2 2280 NVMe SSDs. It is worth noting that M.2 SATA SSDs are not supported.</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">2x USB 2 ports<br/>2x USB 3 HOST/OTG ports</td>
    </tr>
    <tr>
        <td align="center">Camera</td>
        <td align="center">1 camera port (1 quad-channel MIPI CSI or 2 dual-channel MIPI CSI)</td>
        <td>2 camera ports (2 quad-channel MIPI CSI or 2 dual-channel MIPI CSI)</td>
    </tr>
    <tr>
        <td align="center">Others</td>
        <td colspan="2" align="center">40-Pin Expansion Block</td>
    </tr>
    <tr>
        <td align="center">Power Supply</td>
        <td colspan="2" align="center">Supports USB Type-C PD 2.0 with 9V/2A, 12V/2A, 15V/2A, and 20V/2A<br/>Power adapter with fixed voltage of 5V to 20V on USB Type-C port<br/>Provides 5V power to GPIO PINs 2 and 4</td>
    </tr>
    <tr>
        <td align="center">Size</td>
        <td colspan="2" align="center">100 x 75 mm</td>
    </tr>
</table>
