---
sidebar_position: 50
sidebar_label: E24C
---

# 瑞莎 E24C - 紧凑型高性能网络计算机

## 1.产品概述

Radxa E24C 是一款紧凑型高性能网络计算机，搭载瑞芯微RK3528A处理器。它专为路由、边缘网络和工业应用而设计，配备四个千兆以太网端口、4K HDMI输出和NVMe存储扩展，在性能、连接性和可靠性之间实现最佳平衡。

作为一款功能多样的网络设备，E24C 提供了丰富的接口选择和灵活的配置选项，适用于多种网络场景和应用需求。凭借其强大的处理能力和多样化的连接选项，E24C 能够满足从简单的家庭网络到复杂的企业网络解决方案的各种需求。

Radxa E24C 是网络工程师、开发人员和系统集成商的理想之选，它提供了一个强大的平台，可用于部署防火墙、VPN 网关、自定义路由器和边缘计算解决方案。

## 2.产品外观

Radxa E24C 裸板相比铝合金外壳版本可以使用更多外设接口；但铝合金外壳提供更坚固的保护！

<Tabs queryString="e24cmode1">

<TabItem value="E24C(外壳版)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C 俯视图</div>
  <img src="/img/e/e24c/e24c-01-shell.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C 侧视图</div>
  <img src="/img/e/e24c/e24c-02-shell.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="E24C(裸板)">
<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C 俯视图</div>
  <img src="/img/e/e24c/e24c-01.webp" style={{width: '100%', maxWidth: '600px'}} />
  <img src="/img/e/e24c/e24c-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C 侧视图</div>
  <img src="/img/e/e24c/e24c-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

</Tabs>

## 3.技术规格

| 参数类别           | 详细规格                                                     |
| :----------------- | :----------------------------------------------------------- |
| **处理器**         |                                                              |
| SoC                | Rockchip RK3528A                                             |
| CPU                | 四核 ARM Cortex‑A53，频率最高 2.0GHz                         |
| GPU                | ARM Mali-450 GPU，支持 OpenGL® ES1.1, ES2.0，OpenVG® 1.1   |
| **内存与存储**     |                                                              |
| 内存(可选)         | 2GB/4GB/8GB LPDDR4，频率 2133MHz                             |
| 板载eMMC存储(可选) | 8GB/16GB/32GB，eMMC 5.1标准                                  |
| 拓展存储           | MicroSD存储卡槽（支持UHS-I）                                 |
| 高速存储           | M.2 PCIe 2.1 NVMe SSD接口（支持2280规格）                    |
| **网络连接**       |                                                              |
| 以太网             | 4个千兆以太网端口(WAN/LAN可配置)                             |
| 网络控制器         | RTL8367RB-CG 内置交换芯片                                    |
| **外设接口**       |                                                              |
| USB接口            | 3个USB 2.0 Type-A + 1个USB2.0 Type-C(OTG)                    |
| 视频输出           | HDMI2.1接口：支持高达4K@60Hz分辨率                           |
| 扩展接口           | 14针拓展排针：支持UART、SPI、I2C和电源输出                   |
| 其他接口           | 电源按键、Maskrom按键、用户自定义按键、风扇接口、RTC电池接口 |
| **电源与物理特性** |                                                              |
| 供电方式           | DC 12V/2A, 接口规格：5.5x2.5mm接口                           |
| 功耗               | 典型功耗: 5W（空载）, 最大功耗: 12W（满载）                  |
| 散热方案           | 铝合金外壳被动散热/可选主动风扇散热                          |
| 尺寸（裸板）       | 143 × 99 × 25.3 mm                                           |
| 工作温度           | 0°C ~ 70°C                                                   |
| **软件支持**       |                                                              |
| 操作系统           | 支持Debian Linux、OpenWrt等操作系统                          |
| 启动方式           | 支持从MicroSD卡、eMMC或NVMe SSD启动                          |

## 4.接口布局

<Tabs queryString="e24cmode2">

<TabItem value="E24C(外壳版)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C 外壳版接口</div>
  <img src="/img/e/e24c/e24c-shell-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| 序号 | 说明                                         | 数量 |
| :--: | :------------------------------------------- | :--: |
|  ①   | 电源接口：DC5525                             |  1   |
|  ②   | HDMI2.1输出接口                              |  1   |
|  ③   | 千兆以太网接口(WAN/LAN可配置)                |  4   |
|  ④   | 电源按键                                     |  1   |
|  ⑤   | LED状态指示灯(1个电源指示灯，4个网口指示灯)  |  5   |
|  ⑥   | MicroSD卡槽                                  |  1   |
|  ⑦   | USB 2.0 Type‑A型接口                         |  3   |
|  ⑧   | Maskrom按键                                  |  1   |
|  ⑨   | 用户按键                                     |  1   |
|  ⑩   | USB 2.0 Type‑C型接口：从设备加调试二合一接口 |  1   |

</TabItem>

<TabItem value="E24C(裸板)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C 裸板接口</div>
  <img src="/img/e/e24c/e24c-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| 序号 | 说明                                         | 数量 |
| :--: | :------------------------------------------- | :--: |
|  ①   | 电源接口：DC5525                             |  1   |
|  ②   | 板载eMMC                                     |  1   |
|  ③   | USB 2.0 Type‑C型接口：从设备加调试二合一接口 |  1   |
|  ④   | 用户按键                                     |  1   |
|  ⑤   | USB 2.0 Type‑A型接口                         |  3   |
|  ⑥   | RTC电池接口                                  |  1   |
|  ⑦   | MicroSD卡槽                                  |  1   |
|  ⑧   | GPIO：14Pin拓展排针                          |  1   |
|  ⑨   | LED状态指示灯(1个电源指示灯，4个网口指示灯)  |  5   |
|  ⑩   | 电源按键                                     |  1   |
|  ⑪   | 风扇接口                                     |  1   |
|  ⑫   | Maskrom按键                                  |  1   |
|  ⑬   | 千兆以太网接口(WAN/LAN可配置)                |  4   |
|  ⑭   | HDMI2.1输出接口                              |  1   |
|  ⑮   | M.2 NVME SSD接口                             |  1   |

</TabItem>

</Tabs>

## 5.主要特点

- 多功能网络配置：4个千兆以太网端口，支持灵活的WAN/LAN配置
- 可扩展存储：支持M.2 NVMe SSD高速存储扩展
- 开发者友好：Type-C接口支持双模式（OTG数据传输与UART调试）
- 软件生态支持：官方提供Debian Linux和OpenWrt系统支持

## 6.系统支持

Radxa E24C支持Debian Linux和OpenWrt两大操作系统，用户可根据不同应用场景灵活选择最适合的系统方案。

### 6.1 Debian Linux

提供完整的Linux桌面环境，适合通用计算和开发需求。

- 提供完整的软件包管理系统
- 适合进行应用开发和测试
- 支持主流编程语言和开发工具

### 6.2 OpenWrt

基于开源的路由器操作系统，适合高度定制化的网络需求。

- 轻量级系统，运行高效
- 模块化设计，灵活配置网络
- 支持各种网络服务和安全功能

## 7.包装清单

瑞莎 E24C 提供多种配置选项，标准包装中包含以下物品：

| 物品名称        | 数量 | 备注                               |
| :-------------- | :--: | :--------------------------------- |
| Radxa E24C 主机 |  1   | 裸板或铝合金外壳版本(根据订购选项) |
| 快速入门指南    |  1   | 纸质说明书                         |

:::tip
根据具体配置，以下配件可能包含或需要单独购买：

- 12V/2A 电源适配器，DC5525 接口
- MicroSD 卡（对于无 eMMC 版本必需）
- M.2 NVMe SSD（对于需要扩展存储的用户）
- USB Type-A 转 Type-C 数据线（用于调试）
- HDMI 数据线（连接显示器）
  :::

## 8.应用场景

Radxa E24C 凭借其多功能网络接口和强大处理能力，适用于多种应用场景：

### 8.1 网络路由器与防火墙

利用 OpenWrt 系统配置 E24C 作为高性能网络路由器和防火墙，保护家庭或小型办公网络。

- 支持基于状态包检测的防火墙规则
- 内网和外网流量详细监控
- 网络带宽管理与 QoS 控制

### 8.2 VPN 网关

将 E24C 配置为远程访问 VPN 网关，实现安全的远程办公或远程访问家庭网络。

- 支持 OpenVPN、WireGuard 等多种 VPN 协议
- 部署简单，管理便捷
- 低功耗的 24/7 运行方案

### 8.3 家庭多媒体服务器

搭配 NVMe SSD，将 E24C 作为家庭多媒体服务器使用。

- Plex/Emby 媒体服务器
- NAS 文件存储与共享
- DLNA 媒体流服务

### 8.4 边缘计算与物联网网关

作为边缘计算节点或 IoT 网关，收集和处理来自物联网设备的数据。

- 低功耗边缘数据处理
- 支持 MQTT 等物联网协议
- 通过 GPIO 接口连接传感器和外设

### 8.5 小型服务器

基于 Debian Linux，将 E24C 配置为轻量级 Web 服务器、数据库服务器或开发平台。

- 部署 Docker 容器化应用
- 自动化和监控服务
- 配合 SSD 达到更高的存储和运行性能
