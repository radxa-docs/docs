---
sidebar_position: 1
description: "简单介绍 ROCK 5T"
---

# 产品介绍

## 主要特性

ROCK 5T 是一款基于 RK3588 芯片组的优雅单板计算机 (SBC)。其 110 x 82 mm 的尺寸几乎涵盖了 RK3588 的所有功能，提供卓越的灵活性和可扩展性。ROCK 5T为极客、单板机爱好者、物联网爱好者和高校师生等用户提供了将想法变为现实的坚实基础。它在边缘计算、人工智能、云计算、智能监控和其他领域有着广泛的应用。

ROCK 5T 可作为：

- 个人桌面计算机
- 个人私有服务器
- 安卓影音播放器
- 机器人控制器
- 区块链节点

其他更多使用场景，等你来发掘！

### 接口丰富

ROCK 5T 提供了丰富的接口，包括多个 USB、以太网、HDMI 接口，便于连接外部设备和扩展功能。详见[参数配置](#参数配置)。

### 配件生态丰富

ROCK 5T 支持多款摄像头和显示屏。

### 强大的多媒体处理能力

支持8K视频编解码和复杂图形处理，集成 AI 加速单元，适用于高清智能电视和多媒体应用。

### 丰富的操作系统支持

支持多种操作系统，包括 Radxa 官方的发行的 Debian 系统和 Android 系统，另外还有一些第三方操作系统，如 Ubuntu/Armbian 等，适用于各类应用场景。

### 潜在的开发潜力

作为一款强大的开发平台 ROCK 5T 对于人工智能、边缘计算、嵌入式系统等领域具有较大的潜力。

### 开源支持

ROCK 5T 提供了完整的硬件设计原理图和软件源代码，这一特性使得大多 DIY 设计爱好者和开发者进行个性化修改和功能拓展，吸引了一众开源爱好者活跃在社区，有利于促进知识共享和技术创新。

## 主板预览

<TabItem value="ROCK 5T V1.2">
<img src="/img/rock5t/rock-5t-overview-v12.webp" width="800" alt="rock 5t v1.2" />
</TabItem>

## 参数配置

<table>
   <tr>
    <th>型号</th>
    <td colspan="2"  align="center">ROCK 5T</td>
  </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2"  align="center">Rockchip RK3588</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">四大核 Cortex‑A76 频率最高达 2.4GHz<br/>四小核 Cortex‑A55 主频最大为 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Mali G610MP4 GPU，支持 OpenGLES 1.1/2.0/3.2<br />OpenCL 1.1/1.2/2.2 <br/> Vulkan 1.1 和 1.2</td>
    </tr>
    <tr>
    <td align="center">NPU</td>
    <td colspan="2" align="center">NPU 支持 INT4/INT8/INT16/FP16/BF16 和 TF32 加速，计算能力高达 6TOPs</td>
    </tr>
    <tr>
        <td align="center">内存</td>
        <td colspan="2" align="center">4/8/16/24/32 64 位 LPDDR5</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td colspan="2" align="center">板载 eMMC 模块：0/32/64/128/256 GB<br/>microSD 存储卡</td>
    </tr>
    <tr>
        <td align="center">显示</td>
        <td colspan="2" align="center">可通过两个 HDMI、一个 DP（C 型）和一个 MIPI DSI 提供 4 路显示输出<br/>分辨率高达 3x 4K@60FPS + 1x 1080P@60FPS 或者 1x 8K@60FPS + 1x 4K@60FPS + 1x 1080P@60FPS<br/>1x 标准 HDMI 输入端口，最高支持 4Kp60 显示输入</td>
    </tr>
    <tr>
        <td align="center">硬件编解码</td>
        <td colspan="2" align="center">H.265/H.264/AV1/AVS2 硬件解码高达 8K@60fps<br/>H.265/H.264 硬件编码高达 8K@30fps</td>
    </tr>
    <tr>
        <td align="center">以太网</td>
        <td colspan="2" align="center">10/100/1000/2500M 以太网（支持 POE ）<br/>PoE 需要额外的可选 HAT</td>
    </tr>
    <tr>
        <td align="center">板载 WIFI</td>
        <td colspan="2" align="center">配备板载 WiFi Realtek 8852BE</td>
    </tr>
    <tr>
        <td align="center">M.2</td>
        <td colspan="2" align="center">M.2 B Key 连接器，可提供 USB 信号并支持 4G 模块。通过使用 SIM 卡，可方便地连接移动网络。<br/>M.2 M Key 连接器，共提供两个双通道 PCIe 3.0 接口，标准的 M.2 2280 安装孔，可以安装 M.2 2280 NVMe 固态硬盘。值得注意的是，不支持 M.2 SATA 固态硬盘。</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td  align="center">2x USB 2 端口<br/>2x USB 3 HOST 端口<br/>1x USB-C 端口</td>
    </tr>
    <tr>
        <td align="center">摄像头</td>
        <td colspan="2" align="center">2 个摄像头端口（2 个四通道 MIPI CSI 或 2 个双通道 MIPI CSI）</td>
    </tr>
    <tr>
        <td align="center">PDM</td>
        <td colspan="2" align="center">1 个PDM接口，支持双通道阵列麦克风</td>
    </tr>
    <tr>
        <td align="center">其他</td>
        <td colspan="2" align="center">40 针扩展座</td>
    </tr>
    <tr>
        <td align="center">供电</td>
        <td colspan="2" align="center">支持 DC 12V 的电源适配器<br/>支持向 GPIO PIN 2 和 4 提供 5V 电源</td>
    </tr>
    <tr>
        <td align="center">尺寸</td>
        <td colspan="2" align="center">110mm x 82 mm</td>
    </tr>
</table>
