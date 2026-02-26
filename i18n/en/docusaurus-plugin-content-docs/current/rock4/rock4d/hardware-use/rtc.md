---
sidebar_position: 10
---

# RTC Connector

The Radxa ROCK 4D features an onboard RTC battery connector that allows you to connect an RTC battery. This provides continuous power to the Real-Time Clock (RTC) chip during power loss, ensuring the system clock continues to keep accurate time even when the board is powered off.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-rtc.webp" style={{width: '100%', maxWidth: '1200px'}} alt="ROCK 4D RTC Connector Location" />
</div>

## User Guide

To use the RTC connector, connect an RTC battery with the following specifications:

- Connector Type: 2-Pin XH 1.25mm
- Battery Type: CR2032
- Battery Voltage: 3.0V

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-rtc-install.webp" style={{width: '100%', maxWidth: '1200px'}} alt="RTC Battery Installation" />
</div>

### Checking RTC Status

To verify if the system recognizes the RTC battery, run the following command in the terminal:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo dmesg | grep rtc
```
</NewCodeBlock>

If the RTC battery is properly recognized, you should see output similar to `rtc information is valid`:

```text
[    8.145303] [drm] Esmart1-win0(possible_vp_mask = 0x00000006) has no possible crtcs
[    8.145370] [drm] Esmart3-win0(possible_vp_mask = 0x00000006) has no possible crtcs
[    8.153133] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
[    8.154487] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
[    8.700833] rtc-hym8563 2-0051: hym8563_init_device: error read i2c data -6
[    8.716545] rtc-hym8563 2-0051: rtc information is valid
[    8.724597] rtc-hym8563 2-0051: registered as rtc0
[    8.725670] rtc-hym8563 2-0051: setting system clock to 2000-01-01T00:00:23 UTC (946684823)
```

### Reading RTC Time

To read the current time from the RTC chip (/dev/rtc0), use the `hwclock` command:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo hwclock -r -f /dev/rtc0
```
</NewCodeBlock>

### Displaying System Time

To view the current system time, use the `date` command:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
date
```
</NewCodeBlock>

### Setting RTC Time

If the RTC time doesn't match the system time, you can write the current system time to the RTC using:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo hwclock -w -f /dev/rtc0
```
</NewCodeBlock>

### Verifying RTC Functionality

To verify the RTC is working correctly:

1. Note the current system time
2. Disconnect power and network from the Radxa ROCK 4D
3. Wait approximately 10 minutes
4. Reconnect power and check if the system time has maintained accurate timekeeping

## Interface Specifications

:::tip
For detailed interface specifications, please refer to the [Hardware Design: Schematics](../download) in the download section.
:::

| Pin# | Name      | Pin# | Name               |
| :--: | :-------- | :--: | :----------------- |
|  1   | OSCI      |  5   | I2C2_SDA_M0_CC_RTC |
|  2   | OSCO      |  6   | I2C2_SCL_M0_CC_RTC |
|  3   | RTC_INT_L |  7   | 32KOUT_RTC         |
|  4   | GND       |  8   | VCC_RTC            |
