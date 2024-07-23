---
sidebar_position: 1
description: "简单介绍 CM3I/CM3I IO Board"
---

# 产品介绍

## 主要特性

<Tabs queryString="model">
    <TabItem value="CM3I 核心板">
        Radxa CM3I 是基于 Rockchip RK3568(J) 片上系统 (SoC) 的系统模块 (SoM)。Radxa CM3I 集成了中央处理器 (CPU)、电源管理单元 (PMU)、DRAM 存储器、闪存和无线连接（WiFi 5 和 BT 5.0），外形小巧，仅为 70 毫米 x 40 毫米。Radxa CM3I 为许多不同的应用提供了高性价比的解决方案。
    </TabItem>
    <TabItem value="CM3I IO 板">
        Radxa CM3I IO 板专为 Radxa CM3I 设计，旨在对 Radxa CM3I 的功能进行全面验证。利用 Radxa CM3I IO 板，开发人员可以轻松验证 Radxa CM3I 的处理能力、存储扩展、多媒体支持和各种接口的功能。
    </TabItem>
</Tabs>

<Tabs queryString="model">
    <TabItem value="CM3I 核心板">
        
        ### 强大的多媒体处理能力

        CPU 采用了先进的 ARM Cortex-A55 架构，集成了强大的图像处理单元（GPU），支持高清视频解码和编码，能够处理多种视频格式和分辨率。此外，RK3568J还配备了高性能的 DSP 和 NPU（神经网络处理单元），用于音频处理和人工智能应用，使其在多媒体处理方面表现出色。

        ### 潜在的开发潜力

        作为一款强大的开发平台 Radxa CM3I 对于人工智能、边缘计算、嵌入式系统等领域具有较大的潜力。
    </TabItem>
    <TabItem value="CM3I IO 板">
        ### 接口丰富

        Radxa CM3I IO 提供了丰富的接口，包括多个 USB 、HDMI 等接口，便于连接外部设备和扩展功能。详见参数配置。

        ### 配件生态丰富

        Radxa CM3I IO 支持多款摄像头和显示屏。

        ### 开源支持

        Radxa CM3I IO 提供了完整的硬件设计原理图和软件源代码，这一特性使得大多 DIY 设计爱好者和开发者进行个性化修改和功能拓展，吸引了一众开源爱好者活跃在社区，有利于促进知识共享和技术创新。

    </TabItem>
</Tabs>

## 主板预览

<Tabs queryString="model">
    <TabItem value="CM3I 核心板">
        <img src="/img/cm3i/cm3i-overview.webp" alt="cm3i" style={{ width: "80%" }} />
    </TabItem>
    <TabItem value="CM3I IO 板">
        <img src="/img/cm3i/cm3i-io-overview.webp" alt="cm3i" style={{ width: "80%" }} />
    </TabItem>
</Tabs>

## 参数配置

<Tabs queryString="model">
    <TabItem value="CM3I 核心板">
        <table>
            <tr>
                <td align="center">型号</td>
                <td align="center">CM3I 核心板</td>
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
                <td align="center">NPU 支持 INT8/INT16/FP16/BFP16，计算能力高达 1TOPs@INT8</td>
            </tr>
            <tr>
                <td align="center">内存</td>
                <td align="center">1GB、2GB、4GB 或 8GB LPDDR4（视机型而定）</td>
            </tr>
            <tr>
                <td align="center">存储</td>
                <td align="center">可选 4GB/8GB/16GB/32GB，最高 256GB 板载 eMMC 与 eMMC 5.1 兼容<br/>1x SPI Flash<br/>1x SDMMC0</td>
            </tr>
            <tr>
                <td align="center">显示</td>
                <td align="center">1x HDMI TX up to 4096X2160@60Hz<br/>1x eDP four lanes, 2.7Gps per lane<br/>2x MIPI DSI four lanes, 1.6Gbps per lane<br/>1x LVDS four lanes(muxed with MIPI DSI0)</td>
            </tr>
            <tr>
                <td align="center">硬件编解码</td>
                <td align="center">VP9/H.265/H.264 decode 4K@60fps<br/>H.264/H.265 encoder 1080pK@60fps</td>
            </tr>
            <tr>
                <td align="center">摄像头接口</td>
                <td align="center">1x 4-lane MIPI CSI RX or 2x 2-lane MIPI CSI RX<br/>1x 4-lane MIPI_D/C PHY RX</td>
            </tr>
            <tr>
                <td align="center">音频接口</td>
                <td align="center">I2S<br/>PDM，支持麦克风阵列<br/>SPDIF_TX</td>
            </tr>
            <tr>
                <td align="center">输入功率</td>
                <td align="center">5V DC</td>
            </tr>
            <tr>
                <td align="center">连接器</td>
                <td align="center">4x 100P 0.4 mm 间距 B2B 连接器</td>
            </tr>
            <tr>
                <td align="center">运行温度</td>
                <td align="center">J0 型号（RK3568）： 0° 至 60° 摄氏度<br/>J1 model(RK3568J): -40° to 85° 摄氏度</td>
            </tr>
            <tr>
                <td align="center">其它连接</td>
                <td align="center">可选无线局域网、2.4GHz 和 5.0GHz IEEE 802.11b/g/n/ac 无线网络、蓝牙 5.0、支持外置天线的 BLE<br/>1x Onboard Gigabit Ethernet PHY, 1x Gigabit Ethernet MAC<br/>1x SDMMC2<br/>2× USB 2.0 port (高速)<br/>1x USB 3.0 HOST port (5Gbps)1 x USB 3.0 OTG port (5Gbps)<br/>1× PCIe2.0 1-lane Host, Gen 2 (5Gbps)<br/>1x PCIe3.0 2-lane(1x2, 1x1+1x1) Host, Gen 3 (16Gbps)<br/>3 个 SATA 端口，一个与 USB 3 HOST 共享，一个与 PCIe 共享，一个与 USB 3 OTG 共享<br/>最多 8 x UART<br/>最多 4x SPI<br/>最多 2x CAN<br/>最多 4x I2C<br/></td>
            </tr>
            <tr>
                <td align="center">安全性</td>
                <td align="center">OTP<br/>安全启动<br/>Arm TrustZone® 安全扩展<br/>安全视频路径、安全 JTAG 调试<br/>加密 (AES/TDES/SM4/SM3/SHA256/SHA512/RSA)</td>
            </tr>
            <tr>
                <td align="center">尺寸</td>
                <td align="center">70 mm × 40 mm </td>
            </tr>
        </table>
    </TabItem>
    <TabItem value="CM3I IO 板">
        <table>
            <tr>
                <td align="center">型号</td>
                <td align="center">CM3I IO 板</td>
            </tr>
            <tr>
                <td align="center">风扇座子</td>
                <td align="center">1x 风扇座，连接风扇，有效散热</td>
            </tr>
            <tr>
                <td align="center">摄像头接口</td>
                <td align="center">2x MIPI CSI 用于连接 MIPI CSI 摄像头，以进行图像和视频捕捉</td>
            </tr>
            <tr>
                <td align="center">显示</td>
                <td align="center">1x eDP 支持显示和触摸功能<br/>1x HDMI 接口 可连接 HDMI 显示器进行高清输出<br/>1x MIPI DSI 输出，用于 MIPI DSI 显示屏的高清显示</td>
            </tr>
            <tr>
                <td align="center">PCIe</td>
                <td align="center">1x M.2 M Key 支持固态硬盘等存储设备<br/>1x M.2 B Key 支持 4G/5G 移动网络（带 SIM 卡）<br/>1x M.2 E Key 支持 WiFi 和 BT 等无线模块。</td>
            </tr>
            <tr>
                <td align="center">SATA 接口</td>
                <td align="center">1x SATA 接口，连接SATA设备，如硬盘或固态硬盘</td>
            </tr>
            <tr>
                <td align="center">RTC 接口</td>
                <td align="center">1x RTC 座，用于安装 RTC 电池，以实现实时时钟功能</td>
            </tr>
            <tr>
                <td align="center">以太网</td>
                <td align="center">2x 千兆以太网端口，为数据传输提供高速网络连接<br/>1x PoE支持，启用以太网供电功能</td>
            </tr>
            <tr>
                <td align="center">USB</td>
                <td align="center">1x USB 3.0 接口 提供高速 USB 连接，实现快速数据传输<br/>1x USB 2.0 接口 提供用于连接外设的标准 USB 连接</td>
            </tr>
            <tr>
                <td align="center">卡槽</td>
                <td align="center">1x TF卡槽，允许通过TF（microSD）卡扩展存储<br/>1x SIM卡槽 使用SIM卡启用移动网络连接</td>
            </tr>
            <tr>
                <td align="center">CAN 接口</td>
                <td align="center">1x CAN 接口，使能使用CAN总线协议进行通信</td>
            </tr>  
            <tr>
                <td align="center">串口</td>
                <td align="center">1x RS485 接口，支持工业应用中常用的串行通信<br/>1x RS232 接口 方便与连接的设备进行串行通信</td>
            </tr>
            <tr>
                <td align="center">GPIO</td>
                <td align="center">14x GPIO 引脚，提供用于自定义连接和控制的 GPIO</td>
            </tr>
            <tr>
                <td align="center">供电</td>
                <td align="center">1x 12V DC 接口，提供12V直流电源输入选项<br/>1x 12V DC引脚 提供直接的12V电源输入选项<br/>4x 引脚外部电源接口，为电路板提供电源输入<br/>1x 电源按钮，方便地给IO板供电</td>
            </tr>
        </table>
    </TabItem>
</Tabs>
