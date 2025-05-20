---
sidebar_position: 1
---

# 硬件接口与设计


## 1. 硬件概述

Radxa E24C 是一款紧凑型高性能网络计算机，搭载瑞芯微RK3528A处理器为路由、边缘网络和工业应用而设计,在性能、连接性和可靠性之间实现最佳平衡。

本文档详细介绍 E24C 的硬件接口、连接方式以及应用建议，帮助您充分发挥设备性能。
## 2. 芯片架构

RK3528A 是瑞芯微推出的高性能处理器，具有高性能、低功耗、低成本的特点。

- 强大处理性能 ： 四核 ARM Cortex-A53
- 网络能力 ： 支持多个千兆网络接口，对网络应用进行了优化
- 多样化接口：支持 PCIe、USB 3.0、HDMI 2.1 等多种高速接口

<div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '12px', color: '#000000'}}>E24C 芯片内部架构图</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/radxa-e24c-chip-diagram.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>

## 3. 系统架构

E24C 采用紧凑高效的硬件设计，将多种接口和功能集成在单一板上。

<div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '12px', color: '#000000'}}>E24C 系统内部架构与组件连接图</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-rk3528.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>

## 4. 硬件接口

:::tip
Radxa E24C 详细的硬件接口线序，参考[硬件原理图](../download)
:::

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C 裸板接口</div>
  <img src="/img/e/e24c/e24c-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| 序号 | 说明                                          | 数量 |
| :--: | :-------------------------------------------- | :--: |
|  ①   | 电源接口：DC5525                              |  1   |
|  ②   | 板载 eMMC                                     |  1   |
|  ③   | USB 2.0 Type‑C 型接口：从设备加调试二合一接口 |  1   |
|  ④   | 用户按键                                      |  1   |
|  ⑤   | USB 2.0 Type‑A 型接口                         |  3   |
|  ⑥   | RTC 电池接口                                  |  1   |
|  ⑦   | MicroSD 卡槽                                  |  1   |
|  ⑧   | GPIO：14Pin 拓展排针                          |  1   |
|  ⑨   | LED 状态指示灯(1个电源指示灯，4个网口指示灯)  |  5   |
|  ⑩   | 电源按键                                      |  1   |
|  ⑪   | 风扇接口                                      |  1   |
|  ⑫   | Maskrom 按键                                  |  1   |
|  ⑬   | 千兆以太网接口( WAN/LAN 可配置)               |  4   |
|  ⑭   | HDMI2.1 输出接口                              |  1   |
|  ⑮   | M.2 NVME SSD 接口                             |  1   |

### 4.1 MicroSD 卡槽

E24C 板载 MicroSD 卡槽，可用于存储系统数据、系统镜像、系统配置等。

| PIN | Name       | 功能描述      |
| --- | ---------- | ------------- |
| 1   | SDMMC_D2   | SD 卡数据线 2 |
| 2   | SDMMC_D3   | SD 卡数据线 3 |
| 3   | SDMMC_CMD  | SD 卡命令线   |
| 4   | VCC_3V3    | 3.3V 电源     |
| 5   | SDMMC_CLK  | SD 卡时钟信号 |
| 6   | GND        | 接地          |
| 7   | SDMMC_D0   | SD 卡数据线 0 |
| 8   | SDMMC_D1   | SD 卡数据线 1 |
| 9   | SDMMC_DETN | SD 卡插入检测 |
| 10  | GND        | 接地          |
| 11  | GND        | 接地          |
| 12  | GND        | 接地          |
| 13  | GND        | 接地          |

#### 使用指南

- **支持卡型**：兼容 MicroSD/MicroSDHC/MicroSDXC 存储卡
- **推荐规格**：建议使用 Class 10/UHS-I 或更高规格的卡，以获得更好的性能
- **最大容量**：理论上支持高达 2TB 的 MicroSDXC 卡，实际测试支持 512GB

#### 主要应用场景

- **系统启动**：E24C 可以从 MicroSD 卡启动操作系统，这是最常见的使用方式
- **数据存储**：可在已有系统（如使用 eMMC 启动）的情况下用于扩展存储空间
- **系统备份**：可用于备份当前系统和数据

:::tip
对于生产环境或需要 24/7 运行的系统，推荐使用 eMMC 或 M.2 SSD 作为主要存储和启动设备，因为它们提供更好的稳定性和读写耐久性。MicroSD 卡适合临时存储和开发测试场景。
:::

### 4.2 USB 接口

E24C提供两种不同类型的 USB 接口：USB 2.0 Type-C 和 USB 2.0 Type-A。

#### USB 2.0 Type-C

作为数据传输接口，支持 USB2.0 OTG 数据传输和串口调试,最高支持 480Mbps 的数据传输速率。

#### USB 2.0 Type-A

3 个 USB 2.0 Type-A 接口，最高支持 480Mbps 的数据传输速率。

| PIN | Name         | 功能描述                |
| --- | ------------ | ----------------------- |
| 1   | VCC5V0_USB   | 5V 电源输出，最大 500mA |
| 2   | USB2_HOST_DM | USB 2.0 数据线负极      |
| 3   | USB2_HOST_DP | USB 2.0 数据线正极      |
| 4   | GND          | 接地                    |

**应用建议**：

- 鼠标、键盘等输入设备
- 低带宽外设（打印机、扫描仪等）
- 支持 USB 2.0 的外部设备

### 4.3 HDMI 接口

E24C 板载 标准 HDMI 2.1 接口，支持高达 4K 的视频输出，可用于连接显示器、电视等外部设备。

| PIN | Name        | 功能描述                         |
| --- | ----------- | -------------------------------- |
| 1   | HDMI_TX2+   | HDMI 高速数据传输线道 2 正极     |
| 2   | GND         | 接地                             |
| 3   | HDMI_TX2-   | HDMI 高速数据传输线道 2 负极     |
| 4   | HDMI_TX1+   | HDMI 高速数据传输线道 1 正极     |
| 5   | GND         | 接地                             |
| 6   | HDMI_TX1-   | HDMI 高速数据传输线道 1 负极     |
| 7   | HDMI_TX0+   | HDMI 高速数据传输线道 0 正极     |
| 8   | GND         | 接地                             |
| 9   | HDMI_TX0-   | HDMI 高速数据传输线道 0 负极     |
| 10  | HDMI_TXC+   | HDMI 时钟信号正极                |
| 11  | GND         | 接地                             |
| 12  | HDMI_TXC-   | HDMI 时钟信号负极                |
| 13  | HDMI_CEC    | 消费电子控制信号，用于设备间控制 |
| 14  | NC          | 未连接                           |
| 15  | HDMI_SCL    | DDC 时钟线，EDID 信息读取        |
| 16  | HDMI_SDA    | DDC 数据线，EDID 信息读取        |
| 17  | GND         | 接地                             |
| 18  | VCC5V0_HDMI | 5V 电源输出                      |
| 19  | HDMI_HPD    | 热插拔检测信号                   |

### 4.4 千兆以太网接口

E24C 配备了 4 个千兆以太网端口，是产品的核心功能组件，支持多种网络应用场景。


| PIN | Name    | 功能描述               |
| --- | ------- | ---------------------- |
| 1   | ETH_TXP | 千兆以太网发送数据正极 |
| 2   | ETH_TXN | 千兆以太网发送数据负极 |
| 3   | ETH_RXP | 千兆以太网接收数据正极 |
| 4   | NC      | 未连接                 |
| 5   | NC      | 未连接                 |
| 6   | ETH_RXN | 千兆以太网接收数据负极 |
| 7   | NC      | 未连接                 |
| 8   | NC      | 未连接                 |

#### 千兆网络控制器

E24C 的千兆网络接口由瑞芯微 RK3528A 处理器的 SoC 集成的网络控制器驱动，主要特性包括：

- **全双工千兆以太网**：每个端口支持 10/100/1000 Mbps 速率
- **MDI/MDIX 自动侦测**：自动识别直连和交叉网线
- **IEEE 802.3 兼容**：支持标准以太网协议
- **硬件流量控制**：支持 IEEE 802.3x 流量控制
- **内部 MAC 地址**：每个端口分配独立 MAC 地址

#### 网络配置场景

四个千兆以太网端口允许灵活配置多种网络拓扑：

**1. 多 WAN 路由器配置**

可将多个端口配置为 WAN 接口，实现：

- 多线路负载均衡
- 链路求和 (Link Aggregation)
- 多 ISP 备份连接

**2. 网络集线器配置**

将所有端口配置为交换机模式：

- 网络分区 (VLAN)
- QoS 优先级控制
- 端口镜像与监控

**3. 组合模式**

最常见的配置：1个 WAN + 3个 LAN 端口：

- 1个端口连接到上游路由器/调制解调器
- 3个端口用于内部网络设备连接

#### 使用建议

- 建议使用 CAT 5e 或更高规格的网线，以获得全千兆性能
- 多 WAN 配置需要专门的路由软件支持，如 iStoreOS 或 OpenWrt
- 当运行高流量网络应用时，注意散热问题

:::tip
对于需要强大网络性能的应用（如企业路由、网关等），可以配置端口聚合 (Port Bonding) 以提高带宽和可靠性。在 iStoreOS 或 OpenWrt 中可以轻松配置这些高级功能。
:::

### 4.5 M.2 M Key 接口

| PIN | Name          |
| --- | ------------- |
| 1   | GND           |
| 2   | VCC3V3_PCIE   |
| 3   | GND           |
| 4   | VCC3V3_PCIE   |
| 5   | GND           |
| 6   | NC            |
| 7   | GND           |
| 8   | NC            |
| 9   | GND           |
| 10  | NC            |
| 11  | GND           |
| 12  | NC            |
| 13  | GND           |
| 14  | NC            |
| 15  | GND           |
| 16  | NC            |
| 17  | GND           |
| 18  | NC            |
| 19  | GND           |
| 20  | NC            |
| 21  | GND           |
| 22  | NC            |
| 23  | GND           |
| 24  | NC            |
| 25  | GND           |
| 26  | NC            |
| 27  | GND           |
| 28  | NC            |
| 29  | GND           |
| 30  | NC            |
| 31  | GND           |
| 32  | NC            |
| 33  | GND           |
| 34  | NC            |
| 35  | GND           |
| 36  | NC            |
| 37  | GND           |
| 38  | NC            |
| 39  | VCC3V3_PCIE   |
| 40  | NC            |
| 41  | VCC3V3_PCIE   |
| 42  | NC            |
| 43  | GND           |
| 44  | NC            |
| 45  | NC            |
| 46  | NC            |
| 47  | GND           |
| 48  | NC            |
| 49  | GND           |
| 50  | PCIE_CLKREQ_N |
| 51  | GND           |
| 52  | PCIE_WAKE_N   |
| 53  | GND           |
| 54  | PCIE_REFCLK_P |
| 55  | PCIE_REFCLK_N |
| 56  | NC            |
| 57  | GND           |
| 58  | PCIE_RX_N     |
| 59  | PCIE_RX_P     |
| 60  | GND           |
| 61  | GND           |
| 62  | PCIE_TX_N     |
| 63  | PCIE_TX_P     |
| 64  | GND           |
| 65  | GND           |
| 66  | NC            |
| 67  | NC            |
| 68  | PCIE_RST_N    |
| 69  | GND           |
| 70  | NC            |
| 71  | GND           |
| 72  | NC            |
| 73  | GND           |
| 74  | NC            |
| 75  | GND           |

### 4.6 风扇接口 (2-Pin 1.25mm)

| PIN | Name |
| --- | ---- |
| 1   | PWM  |
| 2   | GND  |

### 4.7 RTC 电池接口 (2-Pin 1.25mm)

| PIN | Name       |
| --- | ---------- |
| 1   | VCC3V0_RTC |
| 2   | GND        |

### 4.8 14-Pin GPIO 接口 (0.1"/2.54mm)

| PIN | Name   | 功能          |
| --- | ------ | ------------- |
| 1   | VCC5V0 | 5V 电源输出   |
| 2   | VCC5V0 | 5V 电源输出   |
| 3   | VCC3V3 | 3.3V 电源输出 |
| 4   | GND    | 接地          |
| 5   | GPIO0  | SPI_CLK       |
| 6   | GPIO1  | SPI_MOSI      |
| 7   | GPIO2  | SPI_MISO      |
| 8   | GPIO3  | SPI_CS        |
| 9   | GPIO4  | UART_TX       |
| 10  | GPIO5  | UART_RX       |
| 11  | GPIO6  | I2C_SCL       |
| 12  | GPIO7  | I2C_SDA       |
| 13  | GPIO8  | 通用 GPIO     |
| 14  | GND    | 接地          |
