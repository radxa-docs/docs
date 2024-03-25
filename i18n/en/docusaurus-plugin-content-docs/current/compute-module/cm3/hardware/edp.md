---
sidebar_position: 10
---

# eDP

The RK3566 integrates an eDP (Embedded DisplayPort) v1.3 controller, which supports data rates of 1.62Gbps/lane and 2.7Gbps/lane. It can operate in 1‑lane, 2‑lane, and 4‑lane modes, with a maximum output resolution of 2560x1600@60Hz. The eDP interface also includes an AUX channel with a maximum rate of 1Mbps.

For the coupled differential signals in the eDP interface, it is recommended to place 100nF coupling capacitors near the transmitter side. It is suggested to use 0201 package size capacitors to reduce ESR (Equivalent Series Resistance) and ESL (Equivalent Series Inductance).

eDP interface features꞉

- Supports 1 eDP 1.3 interface
- Supports up to 4 physical lanes of 2.7Gbps
- Supports Panel Self Refresh (PSR)
- Supports resolutions up to 2560x1600@60Hz
- Supports RGB format with up to 10 bits

## The impedance and description of the eDP interface signals

| Signal            | Impedace   | Description                                            |
| ----------------- | ---------- | ------------------------------------------------------ |
| eDP_TX_DP/DN[3꞉0] | 100ohm±10% | eDP TX data transmission, coupled with 100nF capacitor |
| eDP_TX_AUXP/N     | 100ohm±10% | eDP TX auxiliary channel, coupled with 100nF capacitor |
| eDP_HPDIN         | N/A        | No eDP TX insertion detection                          |

![eDP](/img/cm3/edp-design.webp)

## eDP Layout Requirements

| Parameter                                     | Requirement                                  |
| --------------------------------------------- | -------------------------------------------- |
| Trace Impedance                               | 100Ω ±10% differential                       |
| Max intra‑pair skew                           | <12mil                                       |
| Max trace length on carrier board             | <6 inches                                    |
| Minimum pair to pair spacing                  | Recommend ≥4 times the width of eDP trace    |
| AC coupling capacitors                        | 100nF ±20%, discrete 0201 package preferable |
| Minimum spacing between eDP and other signals | ≥4 times the width of eDP trace              |
| Maximum allowed via Recommend                 | ≤ 4 vias                                     |

## The trace length of the eDP signals on the compute module

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

**Note: At the connector end of the eDP display, it is recommended to have a 100k pull‑down resistor reserved for AUXP and a 100k pull‑up resistor reserved for AUXN.**
