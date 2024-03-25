---
sidebar_position: 10
---

# HDMI

HDMI (High‑Definition Multimedia Interface) is a unified method of transferring video and audio data over a TMDS (Transition Minimized Differential Signaling) compatible physical link to an audio/visual display device. The HDMI interface is electrically compatible with the DVI (Digital Visual Interface) standard.

## Features

- HPD (Hot Plug Detect) input analog comparator
- Input reference clock range of 13.5–600MHz
- Support for up to 10 bits Deep Color modes
- Aggregate bandwidth of up to 18Gbps
- Support for video resolutions up to 1080p@120Hz and 4096x2304@60Hz
- Compatibility with 3‑D video formats

| Signal             | Impedance     | Description                                                                           |
| ------------------ | ------------- | ------------------------------------------------------------------------------------- |
| HDMI_TX_DP/DN[2꞉0] | 100ohm±10%    | HDMI TX data transmission                                                             |
| HDMI_TX_CLKP/CLKN  | 100ohm±10%    | HDMI TX clock transmission                                                            |
| HDMI_TX_HPDIN      | Not specified | HDMI TX hot‑plug detection                                                            |
| HDMI_TX_REXT       | Not specified | External resistor for HDMI reference connection(Default꞉ 1% precision 1.62k resistor) |
| HDMITX_SCL/SDA     | Not specified | HDMI data communication channel                                                       |
| HDMITX_CEC         | Not specified | HDMI Consumer Electronics Control pin                                                 |

On the RADXA CM3 compute module, the HDMITX_SCL/SDA and HDMITX_CEC signals have already been processed through level translation. The HDMI_TX_HPDIN signal has a 100k ohm pull‑down resistor and is series‑connected to the RK3566 through a 1k ohm resistor. When designing a baseboard, users don’t need to worry about the level translation issue. Please refer to the following design꞉

![Ethernet](/img/cm3/hdmi-design.webp)

## HDMI 2.0 Layout Requirements

| Parameter                                      | Requirement                                                                 |
| ---------------------------------------------- | --------------------------------------------------------------------------- |
| Trace Impedance                                | 100Ω ±10% differential                                                      |
| Max intra‑pair skew                            | <12mil                                                                      |
| Max mismatch between clock and data pairs      | <480mil                                                                     |
| Max trace length on carrier board              | <6 inches                                                                   |
| Minimum pair to pair spacing                   | ≥5 times the width of HDMI trace (At least 4 times the width of HDMI trace) |
| Minimum spacing between HDMI and other Signals | ≥5 times the width of HDMI trace (At least 4 times the width of HDMI trace) |
| Maximum allowed via                            | Recommend ≤ 2 vias                                                          |

## The trace length of the HDMI signal on the compute module.

| Signal           | Length       |
| ---------------- | ------------ |
| HDMI_TX0N_PORT   | 1310.556mil  |
| HDMI_TX0P_PORT   | 1302.62mil   |
| HDMI_TX1N_PORT   | 1218.286mil  |
| HDMI_TX1P_PORT   | 1156.647mil  |
| HDMI_TX2N_PORT   | 1122.794mil  |
| HDMI_TX2P_PORT   | 1118.675mil  |
| HDMI_TXCLKN_PORT | 1437.63mil   |
| HDMI_TXCLKP_PORT | 1,398.265mil |
