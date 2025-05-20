---
sidebar_position: 50
sidebar_label: E24C
---

# 瑞莎 E24C - 紧凑型高性能网络计算机

## 1.产品概述

Radxa E24C 是一款紧凑型高性能网络计算机，搭载瑞芯微RK3528A处理器。

它专为路由、边缘网络和工业应用而设计，配备四个千兆以太网端口、4K HDMI输出和NVMe存储扩展，在性能、连接性和可靠性之间实现最佳平衡。

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

| 型号               | 瑞莎 E24C                                                    |
| :----------------- | :----------------------------------------------------------- |
| SoC                | Rockchip RK3528A                                             |
| CPU                | 四核 ARM Cortex‑A53                                          |
| GPU                | ARM Mali-450 GPU，支持 OpenGL® ES1.1, ES2.0，OpenVG® 1.1   |
| 内存(可选)         | 2GB/4GB/8GB LPDDR4                                           |
| 板载eMMC存储(可选) | 8GB/16GB/32GB                                                |
| 拓展存储           | MicroSD存储卡                                                |
| 以太网             | 4个千兆以太网端口(WAN/LAN可配置)                             |
| USB接口            | 3个USB 2.0 Type-A + 1个USB2.0 Type-C(OTG)                    |
| 视频输出           | HDMI2.1接口：支持高达4K分辨率                                |
| GPIO               | 14针拓展排针：支持UART、SPI、I2C和电源输出                   |
| 其他接口           | 电源按键、Maskrom按键、用户自定义按键、风扇接口、RTC电池接口 |
| 供电方式           | DC 12V/2A, 接口规格：5.5x2.5mm接口                           |
| 操作系统           | 支持Debian Linux、OpenWrt等操作系统                          |

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
