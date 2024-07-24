---
sidebar_position: 1
description: "简单介绍 CM3/CM3 IO Board"
---

# 产品介绍

## 主要特性

<Tabs queryString="model">
    <TabItem value="CM3 核心板">
        Radxa CM3 是基于 Rockchip RK3566 片上系统 (SoC) 的系统模块 (SoM)。 CM3 集成了中央处理器 (CPU)、电源管理单元 (PMU)、DRAM 内存、闪存和无线连接（WiFi 5 和 BT 5.0），外形小巧，仅为 55 毫米 x 40 毫米。
        Radxa CM3 核心板使用 3x 100P 0.4mm 间距 B2B 连接器，提供强大的功能支持，可与客户的底板结合，构建完整的产品功能，从而加快研发进程。
    </TabItem>
    <TabItem value="CM3 IO 板">
        我们提供[瑞莎 CM3 接口板](/accessories/cm3-io-board)与 Radxa CM3 相兼容，你可以使用它开发出你想要的产品。例如，HMI，机器人，可视对讲机，智能家居等。
    </TabItem>
</Tabs>

<Tabs queryString="model">
    <TabItem value="CM3 核心板">

    ### 强大的多媒体处理能力

    CPU 采用四核 A55 (ARM v8) 的架构，1.8 GHZ 主频，具有强大的计算能力和多任务处理能力。GPU部分则集成了 Mali G52-2EE，支持 Arm Mali™-G52-2EE, OpenGL® ES1.1/2.0/3.0/3.1/3.2, Vulkan® 1.1, OpenCL™ 2.1 等多种图形接口，可提供高效流畅的图形处理体验。

    ### 潜在的开发潜力

    作为一款强大的开发平台 Radxa CM3 对于人工智能、边缘计算、嵌入式系统等领域具有较大的潜力。

    ### 兼容性强

    兼容 Radxa CM3 IO Board 的同时，也兼容了 [Raspberry Pi CM4 IO Board](https://www.raspberrypi.com/products/compute-module-4-io-board/)/[Seeed Studio Dual Gigabit Ethernet Carrier Board](https://www.seeedstudio.com/Dual-GbE-Carrier-Board-with-4GB-RAM-32GB-eMMC-RPi-CM4-Case-p-5029.html)/[Waveshare CM4 IO Base](https://www.waveshare.com/wiki/CM4-IO-BASE-B)/[Mcuzone CM4 Mini](https://www.aliexpress.com/item/1005001972265702.html)/[Mcuzone CM4 Tiny](https://www.aliexpress.com/item/1005002206178734.html)
    </TabItem>
    <TabItem value="CM3 IO 板">
    ### 接口丰富

    Radxa CM3 IO 提供了丰富的接口，包括多个 USB 、HDMI 等接口，便于连接外部设备和扩展功能。详见参数配置。

    ### 开源支持

    Radxa CM3 IO 提供了完整的硬件设计原理图和软件源代码，这一特性使得大多 DIY 设计爱好者和开发者进行个性化修改和功能拓展，吸引了一众开源爱好者活跃在社区，有利于促进知识共享和技术创新。

    ### 配件生态丰富

    Radxa CM3 IO 支持多款摄像头和显示屏。

    </TabItem>

</Tabs>

## 主板预览

<Tabs queryString="model">
    <TabItem value="Radxa CM3 核心板">
        <img src="/img/cm3/cm3-package.webp" alt="Radxa CM3 核心板" style={{ width: "60%" }} />
    </TabItem>
    <TabItem value="Radxa CM3 IO Board">
        <img src="/img/cm3/cm3-io-package.webp" alt="Radxa CM3 IO Board" style={{ width: "60%" }} />
    </TabItem>
</Tabs>

## 参数配置

<Tabs queryString="model">
    <TabItem value="Radxa CM3 核心板">
    <table>
        <tr>
        <td>型号</td>
        <td>Radxa CM3 核心板</td>
        </tr>
        <tr>
            <td>CPU</td>
            <td>基于 Rockchip RK3566 SoC，具有高达 1.8GHz 的 64 位四核低功耗内核</td>
        </tr>
        <tr>
            <td>GPU</td>
            <td>Arm Mali™-G52-2EE 支持：OpenGL®ES1.1/2.0/3.0/3.1/3.2<br/>Vulkan®1.1<br/>OpenCL™2.1</td>
        </tr>
        <tr>
            <td>NPU</td>
            <td>1 TOPs@INT8，支持INT8、INT16、FP16、BFP16，支持TensorFlow、Caffe、Tflite、Pytorch、Onnx、Android等深度学习框架™NN 等</td>
        </tr>
        <tr>
            <td>内存</td>
            <td>32 位 LPDDR4X，最高可达 8GB</td>
        </tr>
        <tr>
            <td>存储</td>
            <td>eMMC 5.1，最高 512GB</td>
        </tr>
        <tr>
            <td>显示</td>
            <td>单显示引擎、HDMI2.0、eDP 1.3、双 MIPI-DSI、与单 LVDS 组合、24 位 RGB/BT1120 和 EBC 接口</td>
        </tr>
        <tr>
            <td>硬件编解码</td>
            <td>4K H.265/H.264/VP9 视频解码器和 1080p@60fps H.264/H.265 视频编码器</td>
        </tr>
        <tr>
            <td>音频接口</td>
            <td>8 通道 I2S0/I2S1、2 通道 IS2/I2S3、8 通道 SPDIF0、PDM0、8 通道 TDM）和语音活动检测 (VAD)</td>
        </tr>
        <tr>
            <td>高速接口</td>
            <td>一个 USB 3.0 主机、两个 SATA 3.0、一个 PCIe 2.1、两个 SerDes（串行器/解串器）通道、双 USB 2.0 主机和一个 USB 2.0 OTG</td>
        </tr>
        <tr>
            <td>以太网</td>
            <td>1000M 以太网物理层（RTL8211F）</td>
        </tr>
        <tr>
            <td>安全性</td>
            <td>Arm TrustZone®安全扩展<br/>安全视频路径<br/>安全 JTAG 调试<br/>安全启动<br/>OTP 和加密（AES/TDES/SM4/SM3/SHA256/SHA512/RSA）</td>
        </tr>
        <tr>
            <td>尺寸</td>
            <td>55.0 x 40.1 mm</td>
        </tr>
    </table>
    </TabItem>
    <TabItem value="Radxa CM3 IO Board">
    <table>
        <tr>
            <td>型号</td>
            <td>Radxa CM3 IO Board</td>
        </tr>
        <tr>
            <td>USB 接口</td>
            <td>1x USB 3.0 接口 提供高速 USB 连接，实现快速数据传输<br/>2x USB 2.0 接口 提供用于连接外设的标准 USB 连接</td>
        </tr>
        <tr>
            <td>以太网</td>
            <td>1x 千兆以太网端口，为数据传输提供高速网络连接<br/>1x PoE支持，启用以太网供电功能</td>
        </tr>
        <tr>
            <td>显示</td>
            <td>1x eDP 支持显示和触摸功能<br/>1x HDMI 接口 可连接 HDMI 显示器进行高清输出<br/>2x MIPI DSI 输出，用于 MIPI DSI 显示屏的高清显示</td>
        </tr>
        <tr>
            <td>SD 卡槽</td>
            <td>1x TF卡槽，允许通过TF（microSD）卡扩展存储</td>
        </tr>
        <tr>
            <td>40-Pin</td>
            <td>PWM x8<br/>SPI x2<br/>I2C x2<br/>UART x1</td>
        </tr>
        <tr>
            <td>PCIe</td>
            <td>1x PCIe 36 PIN 可以用于各种扩展卡的连接，提供高速数据传输能力</td>
        </tr>
        <tr>
            <td>风扇座子</td>
            <td>1x 风扇座，连接风扇，有效散热</td>
        </tr>
        <tr>
            <td>RTC 接口</td>
            <td>1x RTC 座，用于安装 RTC 电池，以实现实时时钟功能</td>
        </tr>
        <tr>
            <td>供电</td>
            <td>1x 12V DC 接口，提供12V直流电源输入选项</td>
        </tr>
        <tr>
            <td>尺寸</td>
            <td>90 x 160 mm</td>
        </tr>
    </table>
    </TabItem>
</Tabs>
