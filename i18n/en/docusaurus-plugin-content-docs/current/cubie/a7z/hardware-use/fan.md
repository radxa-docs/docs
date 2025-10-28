---
sidebar_position: 9
---

# Fan Interface

The Radxa Cubie A7Z features an onboard fan interface. You can connect a fan using a 3-Pin 0.8mm cable (fan operating voltage: 5V) to provide cooling for the motherboard.

:::info Interface Location
For the specific location of the fan interface, please refer to the interface description section in the [Hardware Interface](./hardware-info) tutorial!
:::

## Usage Guide

Connect a fan to the fan interface with the following specifications:

- Interface Type: 3-Pin Female Header
- Pin Spacing: 0.8mm
- Arrangement: Single-row 3-pin
- Installation Method: SMD, 180° SMD mounting
- Operating Voltage: 5V

:::tip
Pay attention to the positive and negative polarity when connecting the fan.
:::

### Checking Fan Devices

1. Use the `ls` command to view the registered fan devices in the system.

<NewCodeBlock tip="radxa@device$" type="device">
```
ls /sys/devices/platform/ | grep fan
```
</NewCodeBlock>

Terminal will display output similar to:

<NewCodeBlock tip="radxa@device$" type="device">
```
pwm-fan
```
</NewCodeBlock>

- `pwm-fan`: Control device for the motherboard's built-in fan

1. Locate the PWM Control File

The fan's PWM control file is typically located in the `/sys/class/hwmon/` directory. You need to find the `hwmon` directory corresponding to `pwm-fan`.

Use the `ls` command to view the PWM control files for the `pwm-fan` device.

<NewCodeBlock tip="radxa@device$" type="device">
```
ls /sys/class/hwmon/
```
</NewCodeBlock>

Terminal will display output similar to:

<NewCodeBlock tip="radxa@device$" type="device">
```
hwmon0
```
</NewCodeBlock>

1. Identify the Fan Control Node

Use the `ls` command to view the PWM control files for the `pwm-fan` device in the `hwmon` directory.

<NewCodeBlock tip="radxa@device$" type="device">
```
ls -l /sys/class/hwmon/hwmon*/device
```
</NewCodeBlock>

Terminal will display output similar to:

```
/sys/class/hwmon/hwmon0/device -> ../../../pwm-fan
```

Based on the terminal output, we can control `pwm-fan` through `hwmon0`.

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
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematic](../download) document in the download section.
:::
