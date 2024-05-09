---
sidebar_position: 10
---

# eDP

RK3566 集成了一个 eDP（嵌入式 DisplayPort）v1.3 控制器，支持 1.62Gbps/lane 和 2.7Gbps/lane 的数据速率。 它可以在 1 通道、2 通道和 4 通道模式下运行，最大输出分辨率为 2560x1600@60Hz。 eDP 接口还包括一个最大速率为 1Mbps 的 AUX 通道。

对于eDP接口中的耦合差分信号，建议在发射端附近放置100nF的耦合电容。 建议使用 0201 封装尺寸的电容以降低 ESR（等效串联电阻）和 ESL（等效串联电感）。

eDP接口功能꞉

- 支持 1 个 eDP 1.3 接口
- 支持多达 4 个 2.7Gbps 的物理通道
- 支持面板自刷新 (PSR)
- 支持分辨率高达 2560x1600@60Hz
- 支持高达 10 位的 RGB 格式

## eDP接口信号的阻抗和说明

| 信号              | 阻抗       | 描述                          |
| ----------------- | ---------- | ----------------------------- |
| eDP_TX_DP/DN[3꞉0] | 100ohm±10% | eDP TX数据传输，外加100nF电容 |
| eDP_TX_AUXP/N     | 100ohm±10% | eDP TX辅助通道，外接100nF电容 |
| eDP_HPDIN         | N/A        | 无 eDP TX 插入检测            |

![eDP](/img/cm3/edp-design.webp)

## eDP布局要求

| 范围                                          | 要求                                         |
| --------------------------------------------- | -------------------------------------------- |
| Trace Impedance                               | 100Ω ±10% differential                       |
| Max intra‑pair skew                           | \<12mil                                      |
| Max trace length on carrier board             | \<6 inches                                   |
| Minimum pair to pair spacing                  | Recommend ≥4 times the width of eDP trace    |
| AC coupling capacitors                        | 100nF ±20%, discrete 0201 package preferable |
| Minimum spacing between eDP and other signals | ≥4 times the width of eDP trace              |
| Maximum allowed via Recommend                 | ≤ 4 vias                                     |

## 计算模块上 eDP 信号的走线长度

| Signal      | Length       |
| ----------- | ------------ |
| EDP_TX_AUXN | 1125.784mil  |
| EDP_TX_AUXP | 1145.200mil  |
| EDP_TX_D0N  | 1,551.442mil |
| EDP_TX_D0P  | 1,605.627mil |
| EDP_TX_D1N  | 1,394.502mil |
| EDP_TX_D1P  | 1,387.683mil |
| EDP_TX_D2N  | 1,223.146mil |
| EDP_TX_D2P  | 1,278.783mil |
| EDP_TX_D3N  | 1,074.909mil |
| EDP_TX_D3P  | 1,092.072mil |

**注意：在eDP显示器的连接器端，建议为AUXP预留一个100k的下拉电阻，为AUXN预留一个100k的上拉电阻。**
