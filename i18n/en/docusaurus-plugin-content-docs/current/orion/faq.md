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

## 2.USB3 bulk transfer device disconnect/re-enumeration issue

When performing high-throughput bulk transfers with USB3 devices like Cypress FX3, you may encounter device disconnection and re-enumeration, resulting in `LIBUSB_ERROR_NO_DEVICE` errors.

### Common symptoms:
- Device disconnects approximately 1 second after bulk transfer starts
- Kernel logs show: `usb 6-1: USB disconnect, device number 3` immediately followed by `usb 6-1: new SuperSpeed USB device number 4 using xhci-hcd`
- Program reports `LIBUSB_ERROR_NO_DEVICE` error

### Possible causes:
1. **Power stability**: USB3 devices may exceed port current limits during high-speed transfers
2. **USB3 link power management**: U1/U2 state transitions may cause instability
3. **xHCI driver/firmware issues**: Certain kernel versions may have compatibility problems

### Recommended troubleshooting steps:

#### 1. Check power supply:
- Use a high-quality external power supply (5V/4A or higher)
- For high-power devices, consider using a powered USB3 hub
- Ensure USB cables are specification-compliant and of good quality

#### 2. Adjust USB power management settings:
<NewCodeBlock tip="Linux$" type="host">

```bash
# Disable USB autosuspend
echo 'on' | sudo tee /sys/bus/usb/devices/*/power/control

# Disable USB3 link power management
echo '0' | sudo tee /sys/module/usbcore/parameters/autosuspend
```

</NewCodeBlock>

#### 3. Update system:
<NewCodeBlock tip="Linux$" type="host">

```bash
sudo apt update
sudo apt upgrade
```

</NewCodeBlock>

#### 4. Check kernel version:
<NewCodeBlock tip="Linux$" type="host">

```bash
uname -r
# Ensure using the latest supported kernel version
```

</NewCodeBlock>

#### 5. Add kernel boot parameters (temporary):
Add to `/boot/extlinux/extlinux.conf`:
```
usbcore.autosuspend=-1 usb-storage.quirks=...
```

#### 6. Collect diagnostic information:
<NewCodeBlock tip="Linux$" type="host">

```bash
# Check USB topology
lsusb -t

# Monitor kernel logs
sudo dmesg -w

# Check specific device information
sudo lsusb -v -d 04b4:00f1
```

</NewCodeBlock>

### If the issue persists:
If the above steps don't resolve the issue, this may be a technical problem requiring further investigation. Please provide the following information for technical support:

1. Complete `dmesg` logs
2. `lsusb -t` and `lsusb -v` outputs
3. Specific image version and kernel version used
4. Detailed steps to reproduce the issue
