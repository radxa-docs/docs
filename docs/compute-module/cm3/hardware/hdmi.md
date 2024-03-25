---
sidebar_position: 10
---

# HDMI

HDMI（高清多媒体接口）是一种通过 TMDS（最小化传输差分信号）兼容的物理链路将视频和音频数据传输到音频/视频显示设备的统一方法。 HDMI 接口与 DVI（数字视频接口）标准电气兼容。

## 特征

- HPD（热插拔检测）输入模拟比较器
- 13.5–600 MHz 的输入参考时钟范围
- 支持高达 10 位的深色模式
- 聚合带宽高达 18Gbps
- 支持高达 1080p@120Hz 和 4096x2304@60Hz 的视频分辨率
- 与 3‑D 视频格式的兼容性

| 信号               | 阻抗          | 描述                                                                                  |
| ------------------ | ------------- | ------------------------------------------------------------------------------------- |
| HDMI_TX_DP/DN[2꞉0] | 100ohm±10%    | HDMI TX data transmission                                                             |
| HDMI_TX_CLKP/CLKN  | 100ohm±10%    | HDMI TX clock transmission                                                            |
| HDMI_TX_HPDIN      | Not specified | HDMI TX hot‑plug detection                                                            |
| HDMI_TX_REXT       | Not specified | External resistor for HDMI reference connection(Default꞉ 1% precision 1.62k resistor) |
| HDMITX_SCL/SDA     | Not specified | HDMI data communication channel                                                       |
| HDMITX_CEC         | Not specified | HDMI Consumer Electronics Control pin                                                 |

在 RADXA CM3 计算模块上，HDMITX_SCL/SDA 和 HDMITX_CEC 信号已经通过电平转换处理。 HDMI_TX_HPDIN 信号有一个 100k 欧姆的下拉电阻，并通过一个 1k 欧姆的电阻串联到 RK3566。 设计底板时，用户无需担心电平转换问题。 请参考以下设计꞉

![Ethernet](/img/cm3/hdmi-design.webp)

## HDMI 2.0 布局要求

| 范围                                           | 要求                                                                        |
| ---------------------------------------------- | --------------------------------------------------------------------------- |
| Trace Impedance                                | 100Ω ±10% differential                                                      |
| Max intra‑pair skew                            | <12mil                                                                      |
| Max mismatch between clock and data pairs      | <480mil                                                                     |
| Max trace length on carrier board              | <6 inches                                                                   |
| Minimum pair to pair spacing                   | ≥5 times the width of HDMI trace (At least 4 times the width of HDMI trace) |
| Minimum spacing between HDMI and other Signals | ≥5 times the width of HDMI trace (At least 4 times the width of HDMI trace) |
| Maximum allowed via                            | Recommend ≤ 2 vias                                                          |

## 计算模块上 HDMI 信号的走线长度

| 信号             | 长度         |
| ---------------- | ------------ |
| HDMI_TX0N_PORT   | 1310.556mil  |
| HDMI_TX0P_PORT   | 1302.62mil   |
| HDMI_TX1N_PORT   | 1218.286mil  |
| HDMI_TX1P_PORT   | 1156.647mil  |
| HDMI_TX2N_PORT   | 1122.794mil  |
| HDMI_TX2P_PORT   | 1118.675mil  |
| HDMI_TXCLKN_PORT | 1437.63mil   |
| HDMI_TXCLKP_PORT | 1,398.265mil |
