---
sidebar_position: 99
---

# ROCK 2 Series Frequently Asked Questions

This document collects common issues and troubleshooting steps for the ROCK 2 series single board computers.

## ROCK 2A Frequently Asked Questions

### Boot Issues

#### 1. System Won't Boot/Stops Booting
If your ROCK 2A won't boot or stops booting after some time, try these steps:

**Step 1: Check Power Supply**
- Ensure you're using a **5V/3A** or higher rated power adapter
- Check that the power cable is securely connected
- Try a different power adapter to rule out power issues

**Step 2: Check Storage Device**
- If using an SD card, try:
  - Using a different SD card
  - Re-flashing the system image
  - Ensuring the SD card makes good contact with the slot
- If using eMMC, check that the eMMC module is properly installed

**Step 3: Check Hardware Connections**
- Disconnect all peripherals (USB devices, display, etc.)
- Connect only power and observe if the power LED lights up normally
- If using an HDMI display, ensure the display is powered on

**Step 4: Serial Debugging**
If the above steps don't resolve the issue, connect via serial to view boot logs:
1. Connect a USB-to-TTL serial cable to the ROCK 2A debug serial port
2. Use a serial tool (like PuTTY, screen, minicom) to connect to the serial port
3. Set baud rate to **1500000**
4. Observe error messages during the boot process

#### 2. System Crashes After Running for Some Time
If the system crashes or reboots after running for some time:
- Check thermal conditions, ensure heatsink is properly installed
- Check ambient temperature, avoid overheating
- Try a different power supply, unstable voltage can cause system instability

#### 3. SD Card/eMMC Recognition Issues
- Ensure storage device is properly formatted
- Try using official recommended images
- Check if storage device is damaged

### Network Connection Issues

#### 1. Wired Network Won't Connect
- Check that Ethernet cable is properly connected
- Check router/switch status
- View network interface status via serial

#### 2. Wireless Network Issues
- Ensure antennas are connected
- Check if Wi-Fi driver is loaded
- Try different Wi-Fi networks

### Display Issues

#### 1. No HDMI Display Output
- Check HDMI cable is working
- Try a different display
- Check if system boots normally via serial

#### 2. Incorrect Display Resolution
- Check display supported resolutions
- Adjust display settings via configuration files

## ROCK 2F Frequently Asked Questions

### Boot Issues
Refer to ROCK 2A boot troubleshooting steps.

### Other Issues
For other issues, please report them on [GitHub Issues](https://github.com/radxa-docs/docs/issues).

## Getting Help
- View complete documentation: https://docs.radxa.com/rock2
- Report issues: https://github.com/radxa-docs/docs/issues
- Community support: Visit Radxa community forums
