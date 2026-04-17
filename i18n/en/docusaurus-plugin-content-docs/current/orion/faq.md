---
sidebar_position: 200
---

# FAQ

## 1.Why does my O6 / O6N have high memory usage after booting?

System reserves a part of memory for NPU to ensure NPU works properly, so the available memory looks like short.

### Temporarily disable NPU (restores after reboot):

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo rmmod aipu
```

</NewCodeBlock>

### Permanently disable NPU (blacklist):

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo vim /etc/modprobe.d/blacklist-aipu.conf
```

</NewCodeBlock>

Add:

<NewCodeBlock tip="Linux$" type="host">

```bash
blacklist aipu
```

</NewCodeBlock>

Save and reboot:

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo reboot
```

</NewCodeBlock>

Note: Disabling will free the memory reserved for NPU. To restore, delete the blacklist configuration and reboot.

## 2.Orion O6 USB3 Bulk Transfer Causes Device Disconnect/Re-enumeration

When using USB3 devices like Cypress FX3 (VID:PID 04b4:00f1) for high-throughput bulk transfers, Orion O6 may experience device disconnection and re-enumeration.

### Symptoms
- Device disconnects and re-enumerates during sustained high-throughput USB bulk transfers
- Error: `LIBUSB_ERROR_NO_DEVICE`
- dmesg shows: `usb 6-1: USB disconnect, device number 3` → `usb 6-1: new SuperSpeed USB device number 4 using xhci-hcd`

### Possible Causes
1. **Insufficient Power Supply**: USB3.2 Type-A ports have a 1A current limit, high-power devices may exceed this limit
2. **Cable Quality**: Poor quality or excessively long USB3 cables may cause signal integrity issues
3. **xHCI Driver/Firmware Issues**: xHCI controller may exhibit stability issues under high load
4. **USB3 Link Management**: USB3 link power management (U1/U2 states) may cause instability

### Troubleshooting Steps
1. **Check Power Supply**:
   - Use a dedicated 12V/3A or higher power adapter
   - Avoid powering high-power devices through USB hubs
2. **Replace Cables and Ports**:
   - Use high-quality, short-length USB3 cables
   - Try different USB3.2 Type-A ports
3. **Check System Logs**:
   ```bash
   dmesg | grep -i "usb\|xhci"
   journalctl -k | grep -i "usb\|xhci"
   ```
4. **Disable USB Autosuspend and Link Power Management**:
   ```bash
   # Temporarily disable USB autosuspend
   for dev in /sys/bus/usb/devices/*/power/control; do
     echo on > "$dev" 2>/dev/null || true
   done
   
   # Disable USB3 link power management (add to boot parameters)
   # Add to the append line in /boot/extlinux/extlinux.conf:
   # usbcore.autosuspend=-1 usbcore.quirks=vid:pid:u
   ```

### Solutions
1. **Use Externally Powered USB3 Hub**: Provide independent power for high-power USB3 devices
2. **Update BIOS and Kernel**: Check for available BIOS updates or kernel patches
3. **Adjust Transfer Parameters**: Reduce data rate for bulk transfers or use smaller packets
4. **Contact Technical Support**: If the issue persists, contact Radxa technical support with detailed system logs

### Known Compatibility Issues
- Cypress FX3 (VID:PID 04b4:00f1) may experience this issue during high-throughput bulk transfers
- Some USB3 storage devices may trigger disconnect/re-enumeration during sustained write operations

**Note**: This issue may be specific to certain hardware combinations. It's recommended to verify compatibility with Orion O6 before purchasing USB3 peripherals.
