---
sidebar_position: 1
---

# Product Introduction

## Key Features

<Tabs queryString="model">
    <TabItem value="CM3I Core Board">
        Radxa CM3I is a system-on-module (SoM) based on the Rockchip RK3568(J) system-on-chip (SoC). Radxa CM3I integrates a central processing unit (CPU), power management unit (PMU), DRAM memory, flash storage, and wireless connectivity (WiFi 5 and BT 5.0). With a compact form factor of just 70mm x 40mm, Radxa CM3I offers a cost-effective solution for a wide range of applications.
    </TabItem>
    <TabItem value="CM3I IO Board">
        Radxa CM3I IO Board is designed specifically for the Radxa CM3I (Radxa Compute Module 3 Industrial Edition), aiming to comprehensively validate the functionalities of Radxa CM3I. With Radxa CM3I IO Board, developers can easily verify the processing capabilities, storage expansion options, multimedia support, and various interface functionalities of Radxa CM3I.
    </TabItem>
</Tabs>

### Rich Interface Options

Radxa CM3I IO provides a rich array of interfaces, including multiple USB and HDMI ports, facilitating connections to external devices and expanding functionality. See detailed specifications for more information.

### Open Source Support

Radxa CM3I IO offers complete hardware schematics and software source code, enabling DIY enthusiasts and developers to customize and extend functionalities. This feature attracts a vibrant community of open-source enthusiasts, fostering knowledge sharing and technological innovation.

### Diverse Accessory Ecosystem

Radxa CM3I IO supports a variety of cameras and display screens.

### Powerful Multimedia Processing Capabilities

The CPU adopts the advanced ARM Cortex-A55 architecture, integrating robust graphics processing units (GPU) that support high-definition video decoding and encoding. It can handle various video formats and resolutions. Additionally, the RK3568J is equipped with high-performance DSP and NPU (Neural Processing Unit) for audio processing and AI applications, demonstrating exceptional multimedia processing capabilities.

### Potential for Development

As a robust development platform, Radxa CM3I IO holds significant potential in fields such as artificial intelligence, edge computing, and embedded systems.

## Motherboard Preview

<Tabs queryString="model">
    <TabItem value="CM3I Core Board">
        <img src="/img/cm3i/cm3i-overview.webp" alt="cm3i" style={{ width: "80%" }} />
    </TabItem>
    <TabItem value="CM3I IO Board">
        <img src="/img/cm3i/cm3i-io-overview.webp" alt="cm3i" style={{ width: "80%" }} />
    </TabItem>
</Tabs>

## Parameter Configuration

<Tabs queryString="model">
    <TabItem value="CM3I Core Board">
        <table>
            <tr>
                <td align="center">Model</td>
                <td align="center">CM3I Core Board</td>
            </tr>
            <tr>
                <td align="center">CPU</td>
                <td align="center">Rockchip RK3568(J), Quad core Cortex-A55 (ARM v8) 64-bit SoC @ **2.0GHz**</td>
            </tr>
            <tr>
                <td align="center">GPU</td>
                <td align="center">ARM G52-2EE GPU<br/>OpenGL® ES1.1/2.0/3.0/3.1/3.2<br/>OpenCL® 2.1<br/>Vulkan® 1.1</td>
            </tr>
            <tr>
                <td align="center">NPU</td>
                <td align="center">NPU Supports INT8/INT16/FP16/BFP16, with Compute Capability up to 1TOPs@INT8</td>
            </tr>
            <tr>
                <td align="center">RAM</td>
                <td align="center">1GB、2GB、4GB or 8GB LPDDR4 (depending on model)</td>
            </tr>
            <tr>
                <td align="center">Storage</td>
                <td align="center">Optional memory configurations: 4GB/8GB/16GB/32GB RAM<br/>Up to 256GB onboard eMMC storage, compatible with eMMC 5.1<br/>1x SPI Flash<br/>1x SDMMC0 interface</td>
            </tr>
            <tr>
                <td align="center">Display</td>
                <td align="center">1x HDMI TX up to 4096X2160@60Hz<br/>1x eDP four lanes, 2.7Gps per lane<br/>2x MIPI DSI four lanes, 1.6Gbps per lane<br/>1x LVDS four lanes(muxed with MIPI DSI0)</td>
            </tr>
            <tr>
                <td align="center">Hardware Codecs</td>
                <td align="center">VP9/H.265/H.264 decode 4K@60fps<br/>H.264/H.265 encoder 1080pK@60fps</td>
            </tr>
            <tr>
                <td align="center">Camera Interface</td>
                <td align="center">1x 4-lane MIPI CSI RX or 2x 2-lane MIPI CSI RX<br/>1x 4-lane MIPI_D/C PHY RX</td>
            </tr>
            <tr>
                <td align="center">Audio Interface</td>
                <td align="center">I2S<br/>PDM, supports microphone array<br/>SPDIF_TX</td>
            </tr>
            <tr>
                <td align="center">Input Power</td>
                <td align="center">5V DC</td>
            </tr>
            <tr>
                <td align="center">Connector</td>
                <td align="center">4x 100-pin, 0.4 mm pitch, Board-to-Board (B2B) connectors</td>
            </tr>
            <tr>
                <td align="center">Operating Temperature</td>
                <td align="center">J0 model (RK3568): 0°C to 60°C<br/>J1 model (RK3568J): -40°C to 85°C</td>
            </tr>
            <tr>
                <td align="center">Other Connectivity</td>
                <td align="center">Optional Wireless LAN, 2.4GHz and 5.0GHz IEEE 802.11b/g/n/ac Wi-Fi, Bluetooth 5.0, with external antenna support for BLE<br/>1x Onboard Gigabit Ethernet PHY, 1x Gigabit Ethernet MAC<br/>1x SDMMC2<br/>2× USB 2.0 port (High Speed)<br/>1x USB 3.0 HOST port (5Gbps)1 x USB 3.0 OTG port (5Gbps)<br/>1× PCIe2.0 1-lane Host, Gen 2 (5Gbps)<br/>1x PCIe3.0 2-lane(1x2, 1x1+1x1) Host, Gen 3 (16Gbps)<br/>The device has 3 SATA ports, with the following sharing arrangements: 1 SATA port is shared with the USB 3 HOST interface, 1 SATA port is shared with the PCIe interface, 1 SATA port is shared with the USB 3 OTG interface<br/>Up to 8 x UART<br/>Up to 4x SPI<br/>Up to 2x CAN<br/>Up to 4x I2C<br/></td>
            </tr>
            <tr>
                <td align="center">Security</td>
                <td align="center">OTP<br/>Secure Boot<br/>Arm TrustZone® Security Extensions<br/>Secure Video Path, Secure JTAG Debugging<br/>Encryption (AES/TDES/SM4/SM3/SHA256/SHA512/RSA)</td>
            </tr>
            <tr>
                <td align="center">Size</td>
                <td align="center">70 mm × 40 mm </td>
            </tr>
        </table>
    </TabItem>
    <TabItem value="CM3I IO Board">
        <table>
            <tr>
                <td align="center">Model</td>
                <td align="center">CM3I IO Board</td>
            </tr>
            <tr>
                <td align="center">Fan Socket</td>
                <td align="center">1x fan socket, connects fan for effective cooling</td>
            </tr>
            <tr>
                <td align="center">Camera Interface</td>
                <td align="center">2x MIPI CSI for connecting MIPI CSI cameras for image and video capture</td>
            </tr>
            <tr>
                <td align="center">Display</td>
                <td align="center">1x eDP supports display and touch functionality<br/>1x HDMI port connects HDMI monitors for high-definition output<br/>1x MIPI DSI output for high-definition display on MIPI DSI screens</td>
            </tr>
            <tr>
                <td align="center">PCIe</td>
                <td align="center">1x M.2 M Key supports storage devices like SSDs<br/>1x M.2 B Key supports 4G/5G mobile networks (with SIM card)<br/>1x M.2 E Key supports WiFi and BT wireless modules</td>
            </tr>
            <tr>
                <td align="center">SATA Interface</td>
                <td align="center">1x SATA interface, connects SATA devices like HDD or SSD</td>
            </tr>
            <tr>
                <td align="center">RTC Interface</td>
                <td align="center">1x RTC socket for installing RTC battery, enabling real-time clock function</td>
            </tr>
            <tr>
                <td align="center">Ethernet</td>
                <td align="center">2x Gigabit Ethernet ports for high-speed network connection<br/>1x PoE support enables Ethernet power supply function</td>
            </tr>
            <tr>
                <td align="center">USB</td>
                <td align="center">1x USB 3.0 interface provides high-speed USB connection for fast data transfer<br/>1x USB 2.0 interface standard USB connection for peripheral devices</td>
            </tr>
            <tr>
                <td align="center">Slots</td>
                <td align="center">1x TF card slot allows expansion of storage via TF (microSD) card<br/>1x SIM card slot uses SIM card for mobile network connection</td>
            </tr>
            <tr>
                <td align="center">CAN Interface</td>
                <td align="center">1x CAN interface enables communication using CAN bus protocol</td>
            </tr>
            <tr>
                <td align="center">Serial Ports</td>
                <td align="center">1x RS485 interface supports serial communication commonly used in industrial applications<br/>1x RS232 interface facilitates serial communication with connected devices</td>
            </tr>
            <tr>
                <td align="center">GPIO</td>
                <td align="center">14x GPIO pins provide for custom connections and control</td>
            </tr>
            <tr>
                <td align="center">Power</td>
                <td align="center">1x 12V DC interface provides 12V DC power input option<br/>1x 12V DC pin provides direct 12V power input option<br/>4x pin external power interfaces provide power input to the board<br/>1x power button conveniently powers the IO board</td>
            </tr>
        </table>
    </TabItem>
</Tabs>
