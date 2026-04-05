---
sidebar_position: 99
---

# FAQ

## ROCK 2A Frequently Asked Questions

### Issue: My ROCK 2A stops booting after running for a period of time

If your ROCK 2A suddenly fails to boot after running normally for a period of time (e.g., one month), even after replacing the SD card and reinstalling the system, try the following troubleshooting steps:

#### 1. Power Supply Check
- **Power Adapter**: Ensure you are using the official 12V/2A power adapter. Unstable power supply may cause boot failure.
- **Power Indicator**: Check if the red power indicator on the board is lit. If not, it may be a power issue.
- **Power Test**: Try a known good power adapter to ensure stable voltage output.

#### 2. Hardware Status Check
- **Overheating Issue**: Check if the board is overheating. Long-term operation may cause heatsink detachment or fan failure.
- **Physical Damage**: Check for obvious physical damage, such as swollen capacitors, burnt chip marks, etc.
- **Loose Connections**: Check all cables, including power cables, display cables, etc., to ensure they are securely connected.

#### 3. Boot Diagnostics
- **Serial Debugging**: Connect via USB-to-TTL serial cable to UART2 (pins 8-TX, 10-RX, 6-GND on the 40-pin GPIO header).
  - Baud rate: 1500000
  - Check for obvious error messages or if boot process is stuck at a certain stage.
- **LED Status**: Observe the LED indicator status during boot. The blue LED should blink during normal boot.

#### 4. Storage Device Check
- **eMMC Status**: If you are using the eMMC version, try reflashing the eMMC firmware.
- **SD Card Quality**: Even after replacing the SD card, there may be compatibility issues. Try using high-quality Class 10 UHS-I SD cards.

#### 5. Firmware/Software Recovery
- **Firmware Update**: Try updating to the latest version of the bootloader (U-Boot) and kernel.
- **Minimal System Boot**: Remove all peripherals (USB devices, displays, etc.), keep only power and serial connection, and try minimal system boot.

#### 6. Contact Technical Support
If none of the above steps resolve the issue:
- Submit a detailed issue report on GitHub: https://github.com/radxa-docs/docs/issues
- Provide as much information as possible:
  - Purchase channel and date
  - Usage conditions before the failure occurred
  - Solutions already attempted
  - Serial log screenshots or text
- Contact official customer service with product serial number and purchase proof

#### Common Possible Causes
1. **Power Management Chip Failure**: Long-term use may cause damage to the power management chip.
2. **eMMC Storage Damage**: If using the eMMC version, the storage chip may be damaged.
3. **Component Aging Due to Overheating**: Poor heat dissipation may cause degradation of critical components.
4. **Firmware Corruption**: System updates or unexpected power loss may corrupt the firmware.

> **Note**: These issues typically require professional technical support. If you don't have experience with electronic repairs, it's recommended to contact official after-sales service.
