---
sidebar_position: 1
description: "A brief introduction to the CM3/CM3 IO Board"
---

# Product Introduction

## Key Features

<Tabs queryString="model">
    <TabItem value="CM3 Core Board">
        Radxa CM3 is a system-on-module (SoM) based on the Rockchip RK3566 system-on-chip (SoC). CM3 integrates a central processing unit (CPU), power management unit (PMU), DRAM memory, flash storage, and wireless connectivity (WiFi 5 and BT 5.0). It features a compact form factor measuring just 55mm x 40mm.
        Radxa CM3 Core Board uses 3x 100P 0.4mm pitch B2B connectors, providing robust functionality support to integrate with customers' baseboards for accelerated product development processes.
    </TabItem>
    <TabItem value="CM3 IO Board">
        We offer [Radxa CM3 IO Board](/accessories/cm3-io-board), compatible with Radxa CM3, allowing you to develop the products you envision, such as HMI, robots, intercoms, smart homes, and more.
    </TabItem>
</Tabs>

<Tabs queryString="model">
    <TabItem value="CM3 Core Board">

    ### Powerful Multimedia Processing Capability

    The CPU adopts a quad-core A55 (ARM v8) architecture running at 1.8 GHz, providing robust computing power and multitasking capabilities. The GPU integrates Mali G52-2EE, supporting Arm Mali™-G52-2EE, OpenGL® ES1.1/2.0/3.0/3.1/3.2, Vulkan® 1.1, OpenCL™ 2.1, ensuring efficient and smooth graphics processing.

    ### Potential for Development

    As a powerful development platform, Radxa CM3 holds great potential in artificial intelligence, edge computing, embedded systems, and more.

    ### Strong Compatibility

    It is compatible not only with Radxa CM3 IO Board but also with [Raspberry Pi CM4 IO Board](https://www.raspberrypi.com/products/compute-module-4-io-board/), [Seeed Studio Dual Gigabit Ethernet Carrier Board](https://www.seeedstudio.com/Dual-GbE-Carrier-Board-with-4GB-RAM-32GB-eMMC-RPi-CM4-Case-p-5029.html), [Waveshare CM4 IO Base](https://www.waveshare.com/wiki/CM4-IO-BASE-B), [Mcuzone CM4 Mini](https://www.aliexpress.com/item/1005001972265702.html), and [Mcuzone CM4 Tiny](https://www.aliexpress.com/item/1005002206178734.html).
    </TabItem>
    <TabItem value="CM3 IO Board">
    ### Rich Interface Options

    Radxa CM3 IO offers a rich array of interfaces including multiple USB ports, HDMI, and more, facilitating easy connectivity with external devices and expansion capabilities. See detailed specifications for more information.

    ### Open Source Support

    Radxa CM3 IO provides complete hardware schematics and software source code, attracting DIY enthusiasts and developers for personalization and feature enhancements. This openness fosters community engagement, promoting knowledge sharing and technological innovation.

    ### Rich Accessory Ecosystem

    Radxa CM3 IO supports a variety of cameras and display screens, enhancing its versatility in different applications.

    </TabItem>

</Tabs>

## Motherboard Preview

<Tabs queryString="model">
    <TabItem value="Radxa CM3 Core Board">
        <img src="/img/cm3/cm3-package.webp" alt="Radxa CM3 Core Board" style={{ width: "60%" }} />
    </TabItem>
    <TabItem value="Radxa CM3 IO Board">
        <img src="/img/cm3/cm3-io-package.webp" alt="Radxa CM3 IO Board" style={{ width: "60%" }} />
    </TabItem>
</Tabs>

## Parameter Configuration

<Tabs queryString="model">
    <TabItem value="Radxa CM3 Core Board">
    <table>
        <tr>
        <td>Model</td>
        <td>Radxa CM3 Core Board</td>
        </tr>
        <tr>
            <td>CPU</td>
            <td>Based on a Rockchip RK3566 SoC with 64-bit Quad Core low power cores up to 1.8GHz</td>
        </tr>
        <tr>
            <td>GPU</td>
            <td>Arm Mali™-G52-2EE Supports：OpenGL®ES1.1/2.0/3.0/3.1/3.2<br/>Vulkan®1.1<br/>OpenCL™2.1</td>
        </tr>
        <tr>
            <td>NPU</td>
            <td>1 TOPs@INT8, support INT8, INT16, FP16, BFP16, support deep learning frameworks such as TensorFlow, Caffe, Tflite, Pytorch, Onnx, Android™ NN, etc</td>
        </tr>
        <tr>
            <td>Memory</td>
            <td> 32bit LPDDR4X up to 8GB</td>
        </tr>
        <tr>
            <td>Storage</td>
            <td> eMMC 5.1 up to 512GB</td>
        </tr>
        <tr>
            <td>Display</td>
            <td>Single display engine, HDMI2.0, eDP 1.3, Dual MIPI-DSI, combo with single LVDS, 24bit RGB/BT1120 and EBC interface</td>
        </tr>
        <tr>
            <td>Hardware Codecs</td>
            <td>4K H.265/H.264/VP9 video decoder and 1080p@60fps H.264/H.265 video encoder</td>
        </tr>
        <tr>
            <td>Audio interface</td>
            <td>I2S0/I2S1 with 8 channels, (IS2/I2S3 with 2 channels, SPDIF0, PDM0 with 8 channels, TDM) with 8 channels and Voice Activity Detection (VAD)</td>
        </tr>
        <tr>
            <td>High Speed Interface</td>
            <td> One USB 3.0 host, two SATA 3.0, one PCIe 2.1, two SerDes (serialiser / deserialiser)lanes, dual USB 2.0 host and one USB 2.0 OTG</td>
        </tr>
        <tr>
            <td>Ethernet</td>
            <td> 1000M ethernet phy(RTL8211F)</td>
        </tr>
        <tr>
            <td>Security</td>
            <td>Arm TrustZone® security extension<br/>Secure Video Path<br/>Secure JTAG to debug<br/>Secure boot<br/>OTP and Crypto (AES/TDES/SM4/SM3/SHA256/SHA512/RSA)</td>
        </tr>
        <tr>
            <td>Size</td>
            <td>55.0 x 40.1 mm</td>
        </tr>
    </table>
    </TabItem>
    <TabItem value="Radxa CM3 IO Board">
    <table>
        <tr>
            <td>Model</td>
            <td>Radxa CM3 IO Board</td>
        </tr>
        <tr>
            <td>USB Interface</td>
            <td>1x USB 3.0 interface, providing high-speed USB connectivity for fast data transfers<br/>2x USB 2.0 interfaces, providing standard USB connectivity for connecting peripherals</td>
        </tr>
        <tr>
            <td>Ethernet</td>
            <td>1x Gigabit Ethernet port, providing high-speed network connectivity for data transmission<br/>1x PoE (Power over Ethernet) support, enabling Ethernet-based power delivery</td>
        </tr>
        <tr>
            <td>Display</td>
            <td>1x eDP interface supporting both display and touch functionality<br/>1x HDMI interface for connecting HDMI displays and enabling high-definition output<br/>2x MIPI DSI outputs, used for driving high-definition MIPI DSI display panels</td>
        </tr>
        <tr>
            <td>SD Slot</td>
            <td>1x TF card slot, which allows storage expansion via a TF (microSD) card</td>
        </tr>
        <tr>
            <td>40-Pin</td>
            <td>PWM x8<br/>SPI x2<br/>I2C x2<br/>UART x1</td>
        </tr>
        <tr>
            <td>PCIe</td>
            <td>1x PCIe 36-pin interface, which can be used to connect various expansion cards and provides high-speed data transfer capabilities</td>
        </tr>
        <tr>
            <td>Fan Header</td>
            <td>1x Fan Header, for connecting a fan to provide effective cooling</td>
        </tr>
        <tr>
            <td>RTC Interface</td>
            <td>1x RTC socket, for installing an RTC battery to enable real-time clock functionality</td>
        </tr>
        <tr>
            <td>Power Supply</td>
            <td>1x 12V DC input interface, providing a 12V DC power supply option</td>
        </tr>
        <tr>
            <td>Size</td>
            <td>90 x 160 mm</td>
        </tr>
    </table>
    </TabItem>
</Tabs>
