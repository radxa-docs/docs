---
sidebar_position: 1
slug: /cubie
---

# Cubie 系列

Cubie 系列是瑞莎基于 Allwinner 芯片推出的一系列单板计算机。

## 型号参数对比

| 型号      | SoC / CPU                                         | NPU 性能          | 内存配置                                   | 系统/板载存储                        | 存储扩展与总线                  | 网络与无线                                              | 显示与摄像头                                 | 典型接口                              |
| --------- | ------------------------------------------------- | ----------------- | ------------------------------------------ | ------------------------------------ | ------------------------------- | ------------------------------------------------------- | -------------------------------------------- | ------------------------------------- |
| Cubie A5E | 全志 A527 / T527，8× Cortex-A55，最高 2.0GHz      | T527 版本：2 TOPS | LPDDR4/4x：1GB / 2GB / 4GB                 | SPI Flash，板载 eMMC（可选 0～32GB） | MicroSD，M.2 M Key NVMe（2230） | 双千兆以太网（1 路 PoE，需 PoE HAT），Wi‑Fi 6，蓝牙 5.4 | HDMI 4K@60，1× MIPI DSI，1× MIPI CSI         | 40Pin GPIO，USB 3.0 Type‑A，USB‑C OTG |
| Cubie A7A | 全志 A733，2× A76 + 6× A55，最高 2.0GHz           | 3 TOPS            | LPDDR5:2GB / 4GB / 6GB / 8GB / 12GB / 16GB | 8MB SPI NOR Flash                    | MicroSD，eMMC 模块，UFS 模块    | 千兆以太网（PoE，需 PoE HAT），Wi‑Fi 6，蓝牙 5.4        | HDMI 4K@60，1× MIPI DSI，1×/2× MIPI CSI      | 40Pin GPIO，PCIe 3.0 FPC，丰富 USB    |
| Cubie A7Z | 全志 A733，2× A76 + 6× A55，板卡 65×30mm 超小尺寸 | 3 TOPS@INT8       | LPDDR4/4x：1GB / 2GB / 4GB / 8GB / 16GB    | 可选板载 UFS（最高 1TB）             | MicroSD，PCIe 3.0 FPC（1‑lane） | 板载 Wi‑Fi 6，蓝牙 5.4                                  | Micro HDMI 4K@60，USB‑C 3.0 DP Alt，MIPI CSI | 40Pin GPIO，双 USB‑C                  |

## 型号特点与选型建议

### Cubie A5E：双网口与工业场景优先

- 双千兆以太网，其中一路支持 PoE（通过 PoE HAT），适合做工业网关、边缘路由、双网隔离等场景。
- 可选 T527 SoC，内置 2 TOPS NPU，支持基础 AI 推理，对轻量边缘 AI 场景足够（如简单检测、分类）。
- 支持 M.2 M Key NVMe SSD，便于在紧凑体积下扩展高速本地存储。
- 标准 40Pin GPIO、HDMI + MIPI DSI / CSI，满足常见工业控制与人机交互需求。
- 更适合：优先考虑双网口 / PoE、对板卡尺寸不极端苛刻的工业与网关应用。

### Cubie A7A：通用高性能边缘 AI 平台

- 全志 A733 + 3 TOPS NPU，综合算力强，适合作为通用边缘 AI 和桌面/多媒体开发主板。
- LPDDR5 最大 16GB，可满足较大模型推理、多任务并行和桌面图形环境需求。
- 支持 eMMC / UFS 模块，系统盘可灵活选择容量与性能档位，适合量产定制。
- 提供 PCIe 3.0 FPC 接口，可外接 NVMe SSD、AI 加速卡或其他高速外设，拓展能力强。
- 丰富 USB、音频接口与 40Pin GPIO，兼顾桌面体验与嵌入式扩展。
- 更适合：需要“性能与扩展”平衡、对板卡尺寸有一定空间、希望保留升级余地的通用项目。

### Cubie A7Z：极致小型化的边缘 AI 模块

- 65×30mm 超小尺寸板卡，在有限空间内提供与 A7A 相近的 CPU/NPU 性能。
- 可选板载 UFS（最高 1TB），无需额外存储模块即可获得大容量与高性能系统盘。
- 双 USB‑C（其中一口支持 USB 3.0 + DP Alt 模式），适合做一线出线的紧凑整机或模块化方案。
- 板载 Wi‑Fi 6 / 蓝牙 5.4、40Pin GPIO、PCIe 3.0 FPC，使其在体积极小的前提下仍保留丰富扩展能力。
- 更适合：体积极度受限、需要板载高速存储、整机/模块集成度高的边缘 AI 与嵌入式产品。

<DocCardList />
