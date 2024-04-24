---
sidebar_position: 2
---

# Hardware Revisions History

### CM5 X2.0:

- Add eMMC configuration on the core board.
- Change the original eMMC interface of CM5 to SDMMC
- Remove the WIFI_HOST_WAKE_E network and add SD_PWR_ON
- Move the status indicator LED from the baseboard to the core board.

### CM5 X2.1:

- Add voltage divider resistors to HDMI_TX0_HPD detection
- Add MOS control for SDMMC_DET_L
- Change Ethernet PHY Config resistors: R90388 to NC, R90387 to 4.7K.
- Change FAN on IO board to 2 PIN 5V circuit.

### CM5 V2.2:

- Move the 4 MOSFETs and 8 matching resistors controlled by HDMI0_TX_ON_H to the core board.
- Move HDMI DDC and CEC signals from the IO board to the core board, add level conversion UM3204H.
- Make the main control chip compatible with RK3588S2 design, add 2 resistors.
- Swap positions of I2C5: 80/82 Pin to meet RPI's 3.3V I2C requirement, exchange positions with I2C7.

### CM5 V2.21:

- Connect 220nF capacitors in series on the 4 HDMI signal lines to support RPI's HDMI.
