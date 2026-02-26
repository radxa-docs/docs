---
sidebar_position: 11
---

# Fan Interface

The Radxa ROCK 4D features an onboard fan interface. You can connect a fan using a 2-Pin 1.25mm cable (fan operating voltage is 5V) to provide cooling for the motherboard.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-fan.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## User Guide

Connect a fan to the fan interface with the following specifications:

- Interface Type: 2-Pin XH 1.25mm
- Operating Voltage: 5V

:::tip
Pay attention to the positive and negative polarity when installing the fan.
:::

### Configuring Fan Settings

Enter the `rsetup` command in the terminal to configure the fan settings using the Rsetup tool.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
rsetup
```
</NewCodeBlock>

1. Use the arrow keys to select the `Hardware` option, then press Enter to confirm.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-fan-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. Use the arrow keys to select the `Thermal governor` option, then press Enter to confirm.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-fan-2.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Use the arrow keys to select the `step_wise` option, press Space to check the `step_wise` option, then press Enter to confirm.

:::tip
A `*` in the option box indicates that the option is enabled.
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-fan-3.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Viewing Fan Devices

1. Use the `ls` command to view the registered fan devices in the system.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
ls /sys/devices/platform/ | grep fan
```
</NewCodeBlock>

Terminal will display output similar to:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
pwm-fan
radxa-poe-fan
```
</NewCodeBlock>

- `pwm-fan`: Control device for the motherboard's built-in fan
- `radxa-poe-fan`: Control device for the PoE HAT fan

2. Locate the PWM Control File

The fan's PWM control files are typically located in the `/sys/class/hwmon/` directory. You need to find the `hwmon` directory corresponding to `pwm-fan`.

Use the `ls` command to view the PWM control files for the `pwm-fan` device.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
ls /sys/class/hwmon/
```
</NewCodeBlock>

The terminal will display output similar to:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
hwmon0  hwmon1  hwmon2  hwmon3  hwmon4  hwmon5  hwmon6  hwmon7
```
</NewCodeBlock>

3. Identify the Fan Control Node

Use the `ls` command to view the PWM control files for the `pwm-fan` device in the `hwmon` directory.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
ls -l /sys/class/hwmon/hwmon*/device
```
</NewCodeBlock>

The terminal will display output similar to:

```text
/sys/class/hwmon/hwmon0/device -> ../../thermal_zone0
/sys/class/hwmon/hwmon1/device -> ../../thermal_zone1
/sys/class/hwmon/hwmon2/device -> ../../thermal_zone2
/sys/class/hwmon/hwmon3/device -> ../../thermal_zone3
/sys/class/hwmon/hwmon4/device -> ../../thermal_zone4
/sys/class/hwmon/hwmon5/device -> ../../thermal_zone5
/sys/class/hwmon/hwmon6/device -> ../../../radxa-poe-fan
/sys/class/hwmon/hwmon7/device -> ../../../pwm-fan
```

Based on the terminal output, we can control the `pwm-fan` through `hwmon7`.

### Controlling Fan Speed

Use the `echo` command to set the fan speed: The PWM control range is typically 0~255 (0=stop, 255=full speed).

- Full Speed

<NewCodeBlock tip="radxa@radxa-4d$" type="device">

```bash
echo 255 | sudo tee /sys/class/hwmon/hwmon7/pwm1
```

</NewCodeBlock>

- Half Speed

<NewCodeBlock tip="radxa@radxa-4d$" type="device">

```bash
echo 128 | sudo tee /sys/class/hwmon/hwmon7/pwm1
```

</NewCodeBlock>

- Turn Off Fan

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
echo 0 | sudo tee /sys/class/hwmon/hwmon7/pwm1
```
</NewCodeBlock>

## Interface Specifications

:::tip
For detailed interface specifications, please refer to the [Hardware Design: Schematics](../download) in the download section.
:::

| Pin# | Name          |
| :--: | :------------ |
|  1   | FAN-PWM       |
|  2   | VCC5V0_SYS_S5 |
|  3   | GND           |
|  4   | GND           |
