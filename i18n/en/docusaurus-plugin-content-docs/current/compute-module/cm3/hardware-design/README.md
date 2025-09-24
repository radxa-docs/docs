---
sidebar_position: 5
---

# Hardware Information

This section introduces the hardware specifications for the Radxa CM3 and the Radxa CM3 IO Board.

:::info Hardware Version Modification Notes

- **V1.0**

  - Initial release version.

- **V1.1**

  - Modified PMUIC: Changed from RK809-5 to RK817-5.

- **V1.2**

  - Added auto power-on circuit.
  - Added power-on indicator light (this version includes eMMC and WiFi functionality).

- **V1.21**

  - Removed component R903461.
  - Added R21 (100K, 0201 package).
  - Changed R20 from 10K to 20K.

- **V1.3**

  - Modified PCB board, adjusted CSI signal positions.
  - PMIC_SLEEP_H routed from connector, optimized via routing.
  - Added resistor R903471 (22Ω, 0201 package).
  - Adjusted values of resistors R20, R21, and R9235.

- **V1.31A**

  - Added resistors R90351 and R90348.
  - Modified SARADC_IN3 connection to J1 (14PIN: 5V_PWR_EN).
  - Modified PCIE_PWREN_H connection to J1 (34PIN: USB2.0_HUB_PWR).
  - Connected 4G_DISABLE to U13A (37PIN: GPIO7).

- **V1.32A**

  - Updated PCB silkscreen LOGO, version number updated to V1.32A.
  - Changed SARADC port connection: from J1 (26PIN) to U13A (93PIN).
  - Added R90352 (10K, 0201 package).

- **V1.321A**

  - Updated R9213, R9214 reference resistors: changed from 0201 0Ω to 120Ω ferrite beads.
  - Updated BOM version to V1.321A.
  - Modified Y2 capacitor parameter: changed from 37.4MHz 12pF to 9pF.
  - Added resistor R92 (470Ω, 0201 package).
  - Changed R21 resistor value: from 22Ω to 100Ω.

- **V1.322A**
  - Added reference resistor R90347 (22Ω, 0201 package).

:::

<DocCardList />
