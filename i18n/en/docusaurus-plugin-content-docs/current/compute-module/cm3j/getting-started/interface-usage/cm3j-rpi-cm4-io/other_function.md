---
sidebar_position: 12
---

# Function Pins

## Usage Instructions

### nRPIBOOT

Short circuit the pins shown in the figure below to enable the recovery function and enter the loader download mode.

![J2](/img/cm3j/j2.webp)

### BT_nDis / WL_nDis

![J3](/img/cm3j/j3.webp)

Before the system boots, connect the BT_nDis pin to the ground to disable the Bluetooth function.

Before the system starts up, connect the WL_nDis pin to the ground, and this can disable the Wi-Fi function.

### GLOBAL_EN / RUN_PG

![J1](/img/cm3j/j1.webp)

Connect GLOBAL_EN to the ground to achieve the shutdown function.

Connect RUN_PG to the ground, and the system will perform the restart function.
