---
sidebar_position: 11
---

# Fan Interface

The Radxa CM4 IO Board features an onboard fan interface for connecting an external fan to cool the board.

## Hardware Connection

Connect the fan to the 2-Pin 1.25mm fan header on the Radxa CM4 IO Board.

Fan specifications:

- Interface type: 2-Pin 1.25mm
- Operating voltage: 5V

:::tip Interface Location
Refer to the [Hardware Information](./hardware_info.md) guide to locate the corresponding hardware interface.
:::

### Checking Fan Devices

1. Use the `ls` command to view registered fan devices in the system.

<NewCodeBlock tip="radxa@device$" type="device">
```
ls /sys/devices/platform/ | grep fan
```
</NewCodeBlock>

Terminal output example:

<NewCodeBlock tip="radxa@device$" type="device">
```
pwm-fan
```
</NewCodeBlock>

- `pwm-fan`: Control device for the onboard fan

1. Locate PWM Control Files

The PWM control files for the fan are typically located in the `/sys/class/hwmon/` directory. You need to find the `hwmon` directory corresponding to `pwm-fan`.

Use the `ls` command to view the PWM control files for the `pwm-fan` device:

<NewCodeBlock tip="radxa@device$" type="device">
```
ls /sys/class/hwmon/
```
</NewCodeBlock>

Terminal output example:

<NewCodeBlock tip="radxa@device$" type="device">
```
hwmon0
```
</NewCodeBlock>

1. Identify Fan Control Node

Use the `ls` command to view the PWM control files for the `pwm-fan` device in the `hwmon` directory:

<NewCodeBlock tip="radxa@device$" type="device">
```
ls -l /sys/class/hwmon/hwmon*/device
```
</NewCodeBlock>

Terminal output example:

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

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Resource Download](../download.md) page.
