---
sidebar_position: 10
---

# SATA

SATA (Serial Advanced Technology Attachment) is a serial communication hard disk interface supported by RK3566. It adheres to the SATA V3.0 protocol and offers the following features꞉

- Compatibility with Gen1 / Gen2 / Gen3 standards.
- Support for a maximum signal transmission rate of 6GT/s on a single data channel.
- Support for Out‑of‑Band (OOB) communication.
- Support for SATA Power Management (PM) function and connection with external expansion chips.
- Support for spread spectrum function.

The table below provides the impedance and description of the SATA interface signals꞉

| Signal      | Impedance | Description                                                                           |
| ----------- | --------- | ------------------------------------------------------------------------------------- |
| SATAx_TXP/N | 90ohm±10% | SATA data send, place the coupling capacitor 10nF close to the mainboard connector    |
| SATAx_RXP/N | 90ohm±10% | SATA data receive, place the coupling capacitor 10nF close to the mainboard connector |

The following layout requirements should be considered for SATA 3.0꞉

| Parameter                                      | Requirement                                 |
| ---------------------------------------------- | ------------------------------------------- |
| Trace Impedance                                | 100Ω ±10% differential                      |
| Max intra‑pair skew                            | <12mil                                      |
| Max trace length on carrier board              | <6 inches                                   |
| AC coupling capacitors                         | 10nF ±20%, discrete 0201 package preferable |
| Minimum pair‑to‑pair spacing                   | ≥4 times the width of SATA trace            |
| Minimum spacing between SATA and other signals | ≥4 times the width of SATA trace            |
| Maximum allowed via                            | Recommend ≤ 2 vias                          |
