---
sidebar_position: 11
---

# 风扇接口

瑞莎 ROCK 4D 板载风扇接口，我们可以通过 2-Pin 1.25mm 排线连接风扇 (风扇工作电压为 5V)，实现风扇给主板散热。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-fan.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

使用风扇接口连接风扇，风扇参数：

- 接口类型：2-Pin XH 1.25mm
- 工作电压：5V

:::tip
安装时注意风扇接口的正负极
:::

### 设置风扇选项

在终端命令行输入 `rsetup` 命令，使用 Rsetup 工具设置风扇选项。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
rsetup
```
</NewCodeBlock>

1. 通过方向键选择 `Hardware` 选项，然后回车键确认选择。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-fan-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. 通过方向键选择 `Thermal governor` 选项，然后回车键确认选择。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-fan-2.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. 通过方向键选择 `step_wise` 选项，然后按空格键勾选 `step_wise` 选项，最后按回车键确认选择。

:::tip
选项框中出现 `*` 表示该选项已启用
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-fan-3.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 查看风扇设备

1. 使用 `ls` 命令查看系统中已注册的风扇设备。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
ls /sys/devices/platform/ | grep fan
```
</NewCodeBlock>

终端输出类似结果：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
pwm-fan
radxa-poe-fan
```
</NewCodeBlock>

- `pwm-fan`：主板自带风扇的控制设备
- `radxa-poe-fan`：PoE HAT 风扇控制设备

1. 确定 PWM 控制文件

风扇的 PWM 控制文件通常在 `/sys/class/hwmon/` 目录下，需要找到 `pwm-fan` 对应的 `hwmon` 目录。

使用 `ls` 命令查看 `pwm-fan` 设备的 PWM 控制文件。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
ls /sys/class/hwmon/
```
</NewCodeBlock>

终端会输出类似结果：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
hwmon0  hwmon1  hwmon2  hwmon3  hwmon4  hwmon5  hwmon6  hwmon7
```
</NewCodeBlock>

2. 确定风扇控制节点

使用 `ls` 命令查看 `hwmon` 目录下 `pwm-fan` 设备的 PWM 控制文件。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
ls -l /sys/class/hwmon/hwmon*/device
```
</NewCodeBlock>

终端输出类似结果：

```
/sys/class/hwmon/hwmon0/device -> ../../thermal_zone0
/sys/class/hwmon/hwmon1/device -> ../../thermal_zone1
/sys/class/hwmon/hwmon2/device -> ../../thermal_zone2
/sys/class/hwmon/hwmon3/device -> ../../thermal_zone3
/sys/class/hwmon/hwmon4/device -> ../../thermal_zone4
/sys/class/hwmon/hwmon5/device -> ../../thermal_zone5
/sys/class/hwmon/hwmon6/device -> ../../../radxa-poe-fan
/sys/class/hwmon/hwmon7/device -> ../../../pwm-fan
```

根据终端输出结果，我们可以通过 `hwmon7` 控制 `pwm-fan`。

### 控制风扇转速

使用 `echo` 命令设置风扇转速：PWM 控制范围一般为 0~255（0=停转，255=全速）。

- 风扇全速

<NewCodeBlock tip="radxa@radxa-4d$" type="device">

```
echo 255 | sudo tee /sys/class/hwmon/hwmon7/pwm1
```

</NewCodeBlock>

- 风扇半速

<NewCodeBlock tip="radxa@radxa-4d$" type="device">

```
echo 128 | sudo tee /sys/class/hwmon/hwmon7/pwm1
```

</NewCodeBlock>

- 关闭风扇

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
echo 0 | sudo tee /sys/class/hwmon/hwmon7/pwm1
```
</NewCodeBlock>

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name          |
| :--: | :------------ |
|  1   | FAN-PWM       |
|  2   | VCC5V0_SYS_S5 |
|  3   | GND           |
|  4   | GND           |
