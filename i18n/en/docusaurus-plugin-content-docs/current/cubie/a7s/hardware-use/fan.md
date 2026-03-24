---
sidebar_position: 9
---

# Fan Interface

The Radxa Cubie A7S features an onboard fan interface. You can connect a fan using the 3-Pin fan interface to provide cooling for the motherboard.

:::info Interface Location
For the specific location of the fan interface, please refer to the interface description section in the [Hardware Interface](./hardware-info) tutorial!
:::

## Interface Specifications

| Item | Specification |
|------|---------------|
| Interface Type | 3-Pin Female Header |
| Pin Spacing | 0.8mm |
| Arrangement | Single-row 3-pin |
| Installation Method | SMD, bottom-mount |
| Operating Voltage | 5V (VCC5V0_SYS) |
| Speed Control | PWM (no tachometer feedback) |

### Pin Definition

| Pin | Signal | Description |
|-----|--------|-------------|
| 1 | GND | Ground |
| 2 | PJ27_PWM1-9 | PWM speed control signal |
| 3 | VCC5V0_SYS | 5V power input |

:::tip
Pay attention to the polarity when connecting the fan. The triangle silkscreen marking points to the GND pin. Do not reverse the connection.
:::

## Usage Guide

### Checking Fan Devices

1. Use the `ls` command to view the registered fan devices in the system.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
ls /sys/devices/platform/ | grep fan
```
</NewCodeBlock>

Terminal will display output similar to:

<NewCodeBlock tip="radxa@device$" type="device">
```bash
pwm-fan
```
</NewCodeBlock>

- `pwm-fan`: Control device for the motherboard's built-in fan

2. Locate the PWM Control File

The fan's PWM control file is typically located in the `/sys/class/hwmon/` directory. You need to find the `hwmon` directory corresponding to `pwm-fan`.

Use the `ls` command to view the PWM control files for the `pwm-fan` device.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
ls /sys/class/hwmon/
```
</NewCodeBlock>

Terminal will display output similar to:

<NewCodeBlock tip="radxa@device$" type="device">
```bash
hwmon0
```
</NewCodeBlock>

3. Identify the Fan Control Node

Use the `ls` command to view the PWM control files for the `pwm-fan` device in the `hwmon` directory.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
ls -l /sys/class/hwmon/hwmon*/device
```
</NewCodeBlock>

Terminal will display output similar to:

```text
/sys/class/hwmon/hwmon0/device -> ../../../pwm-fan
```

Based on the terminal output, we can control `pwm-fan` through `hwmon0`.

### Controlling Fan Speed

Use the `echo` command to set the fan speed. The PWM control range is typically 0~255 (0=stop, 255=full speed).

- Full Speed

<NewCodeBlock tip="radxa@device$" type="device">

```bash
echo 255 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```

</NewCodeBlock>

- Half Speed

<NewCodeBlock tip="radxa@device$" type="device">

```bash
echo 128 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```

</NewCodeBlock>

- Turn Off Fan

<NewCodeBlock tip="radxa@device$" type="device">
```bash
echo 0 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```
</NewCodeBlock>

## Interface Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematic](../download) document in the download section.
:::
