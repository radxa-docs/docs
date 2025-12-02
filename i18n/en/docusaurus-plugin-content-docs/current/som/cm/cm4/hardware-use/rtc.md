---
sidebar_position: 12
---

# RTC Interface

The Radxa CM4 IO Board comes with an onboard RTC (Real-Time Clock) interface for connecting a button cell battery.

## Hardware Connection

Install a CR1220 button cell battery into the RTC interface of the Radxa CM4 IO Board. Pay attention to the battery polarity during installation - the positive and negative poles are clearly marked on the board's silkscreen.

:::tip Interface Location
You can refer to the [Hardware Information](./hardware_info.md) tutorial to locate the corresponding hardware interface.
:::

## RTC Configuration

### Verify RTC Hardware

Use the following command to verify if the RTC hardware is functioning properly.

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo dmesg | grep rtc
```

</NewCodeBlock>

If the output includes a line containing `rtc information is valid`, it indicates that the RTC battery has been correctly recognized.

```
[    8.145303] [drm] Esmart1-win0(possible_vp_mask = 0x00000006) has no possible crtcs
[    8.145370] [drm] Esmart3-win0(possible_vp_mask = 0x00000006) has no possible crtcs
[    8.153133] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
[    8.154487] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
[    8.700833] rtc-hym8563 2-0051: hym8563_init_device: error read i2c data -6
[    8.716545] rtc-hym8563 2-0051: rtc information is valid
[    8.724597] rtc-hym8563 2-0051: registered as rtc0
[    8.725670] rtc-hym8563 2-0051: setting system clock to 2000-01-01T00:00:23 UTC (946684823)
```

### Read RTC Time

Use the `hwclock` command to read the current time from the RTC chip (/dev/rtc0).

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo hwclock -r -f /dev/rtc0
```

</NewCodeBlock>

### Display System Time

Use the `date` command to display the current system time.

<NewCodeBlock tip="radxa@device$" type="device">

```
date
```

</NewCodeBlock>

### Set RTC Time

If the RTC time is not synchronized with the system time, you can write the current system time to the RTC using the `hwclock` command.

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo hwclock -w -f /dev/rtc0
```

</NewCodeBlock>

### Verify RTC Functionality

1. Note down the current system time
2. Disconnect the board's power and network connections
3. Wait for approximately 10 minutes
4. Reconnect the power
5. Observe if the system time continues to count correctly

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Downloads](../download.md) page.
