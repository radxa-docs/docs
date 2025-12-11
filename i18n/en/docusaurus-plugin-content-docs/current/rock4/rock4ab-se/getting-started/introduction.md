---
sidebar_position: 1
---

# Introduction

## Key Features

ROCK 4A/4A+/4B/4B+/4SE is an ultra-compact single-board computer (SBC) with leading performance and excellent mechanical compatibility. provides makers, IoT enthusiasts, hobbyists, PC DIY enthusiasts, and others with a reliable and powerful platform to build and refine their ideas, turning them into reality.

### Rich Interface Options

ROCK 4A/4A+/4B/4B+/4SE offers a wealth of interfaces, including multiple USB ports, HDMI, and more, making it easy to connect external devices and expand functionality. For details, see [Specifications](#specifications).

### Extensive Accessory Ecosystem

ROCK 4A/4A+/4B/4B+/4SE supports multiple cameras and displays, and its 40-PIN header is compatible with most sensor modules on the market.

### Powerful Multimedia Processing

- The GPU integrates an Arm Mali™ T860MP4, supporting multiple graphics interfaces including OpenGL® ES 1.1/2.0/3.0/3.1/3.2, Vulkan® 1.0, Open CL® 1.1/1.2, and DirectX® 11.1, delivering efficient and smooth graphics processing.

### Extensive OS Support

Supports multiple operating systems, including Radxa's official Debian and Android systems, as well as various third-party operating systems suitable for different application scenarios.

### Open Source Support

ROCK 4A/4A+/4B/4B+/4SE provides complete hardware design schematics and software source code. This feature enables DIY enthusiasts and developers to make personalized modifications and functional expansions, attracting open-source enthusiasts to actively participate in the community and promoting knowledge sharing and technological innovation.

### Long-term Availability

The Radxa team provides support for all ROCK 4 models until at least 2029.

## Board Preview

<Tabs queryString="model">

    <TabItem value="ROCK 4A">
        <img src="/img/rock4/rock4a-interfaces.webp" width="800" alt="rock4a real" />
    </TabItem>

    <TabItem value="ROCK 4B">
        <img src="/img/rock4/rock4b-interfaces.webp" width="800" alt="rock4b real" />
    </TabItem>

    <TabItem value="ROCK 4A+">
        <img src="/img/rock4/rock4ap-interfaces.webp" width="800" alt="rock4ap real" />
    </TabItem>

    <TabItem value="ROCK 4B+">
        <img src="/img/rock4/rock4bp-interfaces.webp" width="800" alt="rock4bp real" />
    </TabItem>

    <TabItem value="ROCK 4SE">
        <img src="/img/rock4/rock4se-interfaces.webp" width="800" alt="rock4se real" />
    </TabItem>

</Tabs>

## Specifications

<table class="wikitable">

    <tbody>
        <tr>
            <th colspan="1" width="9%">Model</th>
            <th colspan="1" width="13%"> ROCK 4A </th>
            <th colspan="1" width="13%"> ROCK 4B </th>
            <th colspan="1" width="13%">ROCK 4A+</th>
            <th colspan="1" width="13%">ROCK 4B+</th>
            <th colspan="1" width="13%">ROCK 4SE</th>
        </tr>

        <tr>
            <th>CPU</th>
            <td align="center" colspan="2">64-bit hexa-core processor<br/>Rockchip RK3399 SoC<br/>Dual Cortex-A72 @ 1.8 GHz, up to 2.0 GHz with quad Cortex-A53 @ 1.4 GHz</td>
            <td align="center" colspan="2">64-bit hexa-core processor<br/>Rockchip OP1 SoC<br/>Dual Cortex-72 @ 2.0 GHz, up to 2.2/2.4 GHz with quad Cortex-A53 @ 1.5 GHz</td>
            <td align="center" colspan="1">64-bit hexa-core processor<br/>Rockchip RK3399-T SoC<br/>Dual Cortex-A72 @ 1.5 GHz, up to 1.8 GHz with quad Cortex-A53 @ 1.4 GHz</td>
        </tr>

        <tr>
            <th>GPU</th>
            <td align="center" colspan="5">Integrated Arm Mali™ T860MP4 GPU, supporting:<br/>OpenGL® ES 1.1/2.0/3.0/3.1/3.2<br/>Vulkan® 1.0<br/>Open CL® 1.1/1.2<br/>DirectX® 11.1</td>
        </tr>

        <tr>
            <th>Memory</th>
            <td align="center" colspan="2">64-bit dual-channel LPDDR4@3200Mb/s<br/>2GB/4GB options</td>
            <td align="center" colspan="2">64-bit dual-channel LPDDR4@3200Mb/s<br/>1GB/2GB/4GB options</td>
            <td align="center" colspan="1">64-bit dual-channel LPDDR4@3200Mb/s<br/>4GB</td>
        </tr>

        <tr>
            <th>Storage</th>
            <td align="center" colspan="2">eMMC connector<br/>micro SDcard (up to 256GB)<br/>M.2 SSD (supports up to 2TB NVMe SSD)<br/>M.2 SATA SSDs not supported</td>
            <td align="center" colspan="2">Onboard eMMC (up to 128GB option)<br/>micro SDcard (up to 256GB)<br/>M.2 SSD (supports up to 2TB NVMe SSD)</td>
            <td align="center" colspan="1">eMMC connector<br/>micro SDcard (up to 256GB)<br/>M.2 SSD (supports up to 2TB NVMe SSD)<br/>M.2 SATA SSDs not supported</td>
        </tr>

        <tr>
            <th>Display</th>
            <td align="center" colspan="5">Standard HDMI 2.0, up to 4k@60<br/>2-lane MIPI DSI via FPC connector<br/>HDMI and MIPI DSI can work simultaneously in mirror or extended mode</td>
        </tr>

        <tr>
            <th>Audio</th>
            <td align="center" colspan="5">3.5mm jack with microphone<br/>ES8316 HD codec supporting up to 24-bit/96KHz audio</td>
        </tr>

        <tr>
            <th>Camera</th>
            <td align="center" colspan="5">2-lane MIPI CSI via FPC connector, supports up to 8MP camera (1mm pitch connector)</td>
        </tr>

        <tr>
            <th>Hardware Codec</th>
            <td align="center" colspan="5">H.265/VP9 (HEVC) hardware decoding (up to 4Kp60)<br/>H.264 hardware decoding (up to 1080p60)</td>
        </tr>

        <tr>
            <th>USB</th>
            <td align="center" colspan="5">USB2 HOST ports x2<br/>USB3 HOST port x1<br/>USB3 OTG port x1</td>
        </tr>

        <tr>
            <th>Ethernet</th>
            <td>GbE LAN</td>
            <td align="center" colspan="1">Gigabit Ethernet with PoE support<br/>Compatible with Radxa 23W PoE HAT</td>
            <td align="center" colspan="1">GbE LAN</td>
            <td align="center" colspan="2">Gigabit Ethernet with PoE support<br/>Compatible with Radxa 23W PoE HAT</td>
        </tr>

        <tr>
            <th>Wireless</th>
            <td align="center" colspan="1">N/A</td>
            <td align="center" colspan="1">WiFi5/BT5 (AP6256 module), onboard or external antenna</td>
            <td align="center" colspan="1">N/A</td>
            <td align="center" colspan="1">WiFi5/BT5 (AP6256 module), onboard or external antenna</td>
            <td align="center" colspan="1">WiFi5/BT5 (AW-CM256 module), onboard antenna (external antenna optional)</td>
        </tr>

        <tr>
            <th>40-PIN</th>
            <td align="center" colspan="5">40-pin expansion header<br/>2 x UART<br/>2 x SPI bus<br/>3 x I2C bus<br/>1 x PCM/I2S<br/>1 x SPDIF<br/>2 x PWM<br/>1 x ADC<br/>27 x GPIO<br/>2 x 5V DC power in<br/>2 x 3.3V DC power in</td>
        </tr>

        <tr>
            <th>SPI Flash</th>
            <td align="center" colspan="2">4M</td>
            <td align="center" colspan="3">None</td>
        </tr>

        <tr>
            <th>Other</th>
            <td align="center" colspan="5">RTC<br/>RTC battery connector for time backup (optional)</td>
        </tr>

        <tr>
            <th>Size</th>
            <td align="center" colspan="7">85 mm x 56 mm</td>
        </tr>

    </tbody>

</table>
