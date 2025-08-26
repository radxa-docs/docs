---
sidebar_position: 9
---

# 风扇接口

瑞莎 Cubie A7Z 板载风扇接口，我们可以通过 2-Pin 1.25mm 排线连接风扇 (风扇工作电压为 5V)，实现风扇给主板散热。

:::info 接口位置
风扇接口具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 使用指南

使用风扇接口连接风扇，风扇参数：

- 接口类型：2-Pin 1.25mm
- 工作电压：5V

:::tip
安装时注意风扇接口的正负极
:::

### 查看风扇设备

1. 使用 `ls` 命令查看系统中已注册的风扇设备。

<NewCodeBlock tip="radxa@device$" type="device">
```
ls /sys/devices/platform/ | grep fan
```
</NewCodeBlock>

终端输出类似结果：

<NewCodeBlock tip="radxa@device$" type="device">
```
pwm-fan
```
</NewCodeBlock>

- `pwm-fan`：主板自带风扇的控制设备

1. 确定 PWM 控制文件

风扇的 PWM 控制文件通常在 `/sys/class/hwmon/` 目录下，需要找到 `pwm-fan` 对应的 `hwmon` 目录。

使用 `ls` 命令查看 `pwm-fan` 设备的 PWM 控制文件。

<NewCodeBlock tip="radxa@device$" type="device">
```
ls /sys/class/hwmon/
```
</NewCodeBlock>

终端会输出类似结果：

<NewCodeBlock tip="radxa@device$" type="device">
```
hwmon0
```
</NewCodeBlock>

1. 确定风扇控制节点

使用 `ls` 命令查看 `hwmon` 目录下 `pwm-fan` 设备的 PWM 控制文件。

<NewCodeBlock tip="radxa@device$" type="device">
```
ls -l /sys/class/hwmon/hwmon*/device
```
</NewCodeBlock>

终端输出类似结果：

```
/sys/class/hwmon/hwmon0/device -> ../../../pwm-fan
```

根据终端输出结果，我们可以通过 `hwmon0` 控制 `pwm-fan`。

### 控制风扇转速

使用 `echo` 命令设置风扇转速：PWM 控制范围一般为 0~255（0=停转，255=全速）。

- 风扇全速

<NewCodeBlock tip="radxa@device$" type="device">

```
echo 255 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```

</NewCodeBlock>

- 风扇半速

<NewCodeBlock tip="radxa@device$" type="device">

```
echo 128 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```

</NewCodeBlock>

- 关闭风扇

<NewCodeBlock tip="radxa@device$" type="device">
```
echo 0 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```
</NewCodeBlock>

## 接口规格

:::info 技术参考
完整的技术规格和引脚定义可参考下载专区的 [硬件设计：原理图](../download) 文档
:::
