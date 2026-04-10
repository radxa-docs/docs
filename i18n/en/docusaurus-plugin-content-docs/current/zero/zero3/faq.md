---
sidebar_position: 10
---

# FAQ

## Q1: Community Support

Please refer to https://docs.radxa.com/welcome

## Q2: Radxa ZERO 3 Unable to Boot from microSD Card

If your Radxa ZERO 3 cannot boot from a microSD card, follow these troubleshooting steps:

### Check Power Supply
- Ensure using a **5V** power adapter
- Recommended: [Radxa Power PD30W](../accessories/power/pd_30w)
- Check if the Type-C cable is working properly
- Ensure the power interface is correctly connected (USB 2.0 OTG Type-C port)

### Check microSD Card
1. **Card Quality**: Use high-quality, reliable brand microSD cards
2. **Capacity**: Ensure card capacity ≥8GB
3. **Burn Tool**: Use recommended burning tools (like balenaEtcher)
4. **Image Integrity**: Redownload the image and verify the hash
5. **Burn Process**: Ensure the burning process completes fully without interruption

### Boot Indicators
- During normal boot, the power LED should stay on
- If the LED blinks or remains off, there may be a power issue

### Serial Debugging
If all above steps are normal, connect via serial port to check boot logs:
1. Connect UART to USB adapter to the debug serial port
2. Use serial tools (like minicom, screen) to view output
3. Observe error messages during the boot process

## Q3: What Storage Devices Does Radxa ZERO 3 Support for Boot?

Radxa ZERO 3 supports booting from:
- **microSD Card** (primary boot method)
- **eMMC** (requires additional module)
- **USB Storage Devices** (via USB boot)

## Q4: How to Install OS to eMMC?

Please refer to the [Install OS to eMMC](../low-level-dev/install-os-on-emmc) guide.

## Q5: What Are the Power Requirements for Radxa ZERO 3?

Radxa ZERO 3 **only supports 5V power supply**:
- **Input Voltage**: 5V DC
- **Recommended Power**: ≥15W (for stable operation)
- **Interface**: USB 2.0 OTG Type-C port

:::warning Important
Do not use power adapters above 5V as this may damage the device.
:::

## Q6: How to Debug Radxa ZERO 3 via Serial Port?

1. **Connect Serial Port**:
   - Use UART to USB adapter
   - Connect GND, TX, RX pins
   - Baud rate: 1500000

2. **View Boot Logs**:
   - Connect serial port before powering on
   - View boot process in serial terminal

3. **Common Serial Tools**:
   ```bash
   # Linux/macOS
   screen /dev/ttyUSB0 1500000
   
   # Windows
   # Use PuTTY or Tera Term
   ```

## Q7: What Are the Default Login Credentials for Radxa ZERO 3?

For Radxa OS images:
- **Username**: `radxa`
- **Password**: `radxa`

For Debian/Ubuntu images:
- **Username**: `root`
- **Password**: `radxa`

## Q8: How to Update System Packages?

```bash
# Update package lists
sudo apt update

# Upgrade installed packages
sudo apt upgrade

# Clean up unnecessary packages
sudo apt autoremove
```

## Q9: Does Radxa ZERO 3 Support Wi-Fi and Bluetooth?

Yes, Radxa ZERO 3 supports Wi-Fi and Bluetooth:
- **Wi-Fi**: Supports 2.4GHz and 5GHz bands
- **Bluetooth**: Supports Bluetooth 5.0

If experiencing connection issues:
1. Check if antenna is connected (if applicable)
2. Ensure drivers are properly loaded
3. Check network configuration

## Q10: How to Check Hardware Information?

```bash
# View CPU information
cat /proc/cpuinfo

# View memory information
free -h

# View storage devices
lsblk

# View network interfaces
ip addr

# View system version
cat /etc/os-release
```

## Q11: What to Do for Other Issues?

1. **Check Official Documentation**: https://docs.radxa.com/zero/zero3
2. **Visit Community Forum**: Get community support
3. **Contact Technical Support**: Submit issues through official channels

:::tip
When seeking help, please provide:
- Image version used
- Hardware configuration
- Error logs or screenshots
- Steps already attempted to resolve
:::