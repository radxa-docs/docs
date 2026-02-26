---
sidebar_position: 10
---

# RTC Interface

Radxa Cubie A7A features an onboard RTC battery interface. You can connect an RTC battery via this interface to provide continuous power to the real-time clock (RTC) chip on the board during power-off, ensuring the system clock keeps accurate time even when the system is powered down.

:::tip
For the exact location of the RTC interface, please refer to the interface description section in the [Hardware Interfaces](./hardware-info) guide!
:::

## Usage Guide

Connect an RTC battery to the RTC interface. Battery parameters:

- Interface type: 2-Pin 1.25mm
- Battery type: CR2032
- Battery voltage: 3.0V

### Check RTC

Enter the following command in the terminal to check if the RTC battery is recognized by the system.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo dmesg | grep rtc
```
</NewCodeBlock>

Sample terminal output: `registered as rtc0` indicates the RTC battery is recognized.

```text
[    0.033261] sunxi:ccu-ng:[INFO]: sunxi rtc-ccu version: 0.5.5
[    0.044358] sunxi:ccu-ng:[INFO]: rtc_ccu: sunxi ccu init OK
[    0.161008] axp8191-rtcldo: supplied by regulator-dummy
[    0.803919] [drm] sunxi_de_bind crtc init for de 0 ok
[    0.803946] [drm] sunxi_de_bind crtc init for de 1 ok
[    3.318121] rtc-hym8563 14-0051: no valid clock/calendar values available
[    3.318383] rtc-hym8563 14-0051: registered as rtc0
[    3.318674] rtc-hym8563 14-0051: no valid clock/calendar values available
[    3.318679] rtc-hym8563 14-0051: hctosys: unable to read the hardware clock
```

### Read RTC Time

Use the `hwclock` command in the terminal to read the current time from the RTC chip (/dev/rtc0).

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo hwclock -r -f /dev/rtc0
```
</NewCodeBlock>

### Display System Time

Use the `date` command to display the current system time.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
date
```
</NewCodeBlock>

### Set RTC Time

If the RTC time and system time are inconsistent, you can use the `hwclock` command to write the current system time to the RTC.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo hwclock -w -f /dev/rtc0
```
</NewCodeBlock>

### Verify RTC

Record the current system time, then disconnect the power and network from the Radxa Cubie A7A. Wait about 10 minutes, reconnect the power, and check if the system time is correct.

## Port Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematic](../download) document in the download section.
:::
