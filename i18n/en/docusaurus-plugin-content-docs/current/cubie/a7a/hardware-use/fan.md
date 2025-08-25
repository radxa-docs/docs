---
sidebar_position: 11
---

# Fan Interface

The Radxa Cubie A7A features an onboard fan interface that supports connecting a fan using a 2-Pin 1.25mm cable (fan operating voltage: 5V) to provide cooling for the mainboard.

:::tip
For the exact location of the fan interface, please refer to the interface description section in the [Hardware Interface](./hardware-info) guide!
:::

## User Guide

Connect a fan to the fan interface with the following specifications:

- Interface Type: 2-Pin 1.25mm
- Operating Voltage: 5V

:::tip
Pay attention to the positive and negative polarity when connecting the fan.
:::

### Checking Fan Device

1. Use the `ls` command to view registered fan devices in the system.

<NewCodeBlock tip="radxa@device$" type="device">
```
ls /sys/devices/platform/ | grep fan
```
</NewCodeBlock>

Terminal output will be similar to:

<NewCodeBlock tip="radxa@device$" type="device">
```
pwm-fan
```
</NewCodeBlock>

- `pwm-fan`: Control device for the onboard fan

2. Locate the PWM Control File

PWM control files for the fan are typically located in the `/sys/class/hwmon/` directory. You need to find the `hwmon` directory corresponding to `pwm-fan`.

Use the `ls` command to view the PWM control files for the `pwm-fan` device.

<NewCodeBlock tip="radxa@device$" type="device">
```
ls /sys/class/hwmon/
```
</NewCodeBlock>

Terminal output will be similar to:

<NewCodeBlock tip="radxa@device$" type="device">
```
hwmon0
```
</NewCodeBlock>

3. Identify the Fan Control Node

Use the `ls` command to view the PWM control files for the `pwm-fan` device in the `hwmon` directory.

<NewCodeBlock tip="radxa@device$" type="device">
```
ls -l /sys/class/hwmon/hwmon*/device
```
</NewCodeBlock>

Terminal output will be similar to:

```
/sys/class/hwmon/hwmon0/device -> ../../../pwm-fan
```

Based on the terminal output, we can control the `pwm-fan` through `hwmon0`.

### Controlling Fan Speed

Use the `echo` command to set the fan speed. The PWM control range is typically 0~255 (0=stop, 255=full speed).

- Full Speed

<NewCodeBlock tip="radxa@device$" type="device">
```
echo 255 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```
</NewCodeBlock>

- Half Speed

<NewCodeBlock tip="radxa@device$" type="device">
```
echo 128 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```
</NewCodeBlock>

- Turn Off Fan

<NewCodeBlock tip="radxa@device$" type="device">
```
echo 0 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```
</NewCodeBlock>

## Interface Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematics](../download) document in the download section.
:::
