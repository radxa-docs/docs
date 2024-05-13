---
sidebar_position: 20
---

# FAQ

### 1. Can Radxa CM5 be used on Radxa CM3 IO board

No, as the 3 pins (94/96/98) (USB_5V_IN) of the current CM3 + Radxa CM3 IO board are connected to 5V, while CM5 is GPIO.
![cm3 vs cm5](/img/cm5/radxa_cm3_vs_cm5.webp)

### 2. Can we replace Radxa CM3 with Radxa CM5 for hardware upgrade on the baseboard we previously developed based on Radxa CM3?

1. Please confirm whether the 3 pins (94/96/98) (USB_5V_IN) of the current CM3 + baseboard hardware design are connected to 5V. If so, then cannot replace with CM5, otherwise the board will be damaged

![cm3 vs cm5](/img/cm5/radxa_cm3_vs_cm5.webp)

2. If the 3 pins mentioned in step 1 above are not connected to 5V, then replace CM3 with CM5. After replacement, the following functional changes will occur.
   - Not support SPI Flash
   - There is a difference in SD card detection pin: CM3 is pin 76 on the first connector, while CM5 is pin 74 on the third connector.
     If you want to be compatible with Raspberry PI's CM4 IO board (SD card boot), IO board's third connector's pin 90 needs to be grounded.
   - Not support HDMI TX ARC function: Because CM3's second connector pin 145/149 is not connected to SBDP/SBDN signal
   - MIPI_CSI: Not support 4lane+2lane, only support 2lane+2lane
   - MIPI_DSI0: Not support 4lane+4lane, only support 4lane+2lane
   - Not support 3.5mm headphone audio, external CODEC is needed
   - Not support EDP: 15/17/21/23/27/29/33/35 pin, CM3 supports EDP, while CM5 is TYPE C
   - USB2_HOST3 not supported: 69/71 PIN CM3 is USB, while CM5 is I2C
