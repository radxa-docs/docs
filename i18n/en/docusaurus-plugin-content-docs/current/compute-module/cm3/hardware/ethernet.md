---
sidebar_position: 10
---

# Gigabit Ethernet

The RADXA CM3 board integrates a Gigabit PHY chip, RTL8211F. Four sets of differential signals, PHY1_MDI0, PHY1_MDI01, PHY1_MDI02, and PHY1_MDI03, are connected to the B2B connector. When operating at 1000BASE‑T, all four sets of differential signals are used. When operating at 100BASE‑TX, only PHY1_MDI0 and PHY1_MDI01 are utilized.

** Diagram for Reference **

** Refer to the schematic for specific signal definitions **

![Ethernet](/img/cm3/ethernet-phy-design.webp)

The Radxa CM3 IO Board adopts an integrated design with transformer and Ethernet port. The reference design is provided as follows:

![Ethernet](/img/cm3/ethernet_combo.webp)

The trace length of the MDI signal on the compute module.

| Signal     | Length     |
| ---------- | ---------- |
| PHY1_MDI0+ | 319.903mil |
| PHY1_MDI0- | 326.000mil |
| PHY1_MDI1+ | 249.671mil |
| PHY1_MDI1- | 277.370mil |
| PHY1_MDI2+ | 394.321mil |
| PHY1_MDI2- | 400.440mil |
| PHY1_MDI3+ | 335.779mil |
| PHY1_MDI3- | 347.346mil |

The differential signals of the MDI (Medium Dependent Interface) for Gigabit Ethernet generally control the differential impedance at 100 ohms.
