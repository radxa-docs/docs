---
sidebar_position: 11
---

# 风扇接口

瑞莎 CM4 IO 板板载 1 个风扇接口，连接外部风扇给主板散热。

## 硬件连接

将风扇接口连接到瑞莎 CM4 IO 板的 2-Pin 1.25mm 风扇接口。

风扇参数：

- 接口类型：2-Pin 1.25mm
- 工作电压：5V

:::tip 接口位置
可以参考 [硬件信息](./hardware_info.md) 教程找到对应硬件接口位置。
:::

### 查看风扇设备

1. 使用 `ls` 命令查看系统中已注册的风扇设备。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
ls /sys/devices/platform/ | grep fan
```
</NewCodeBlock>

终端输出类似结果：

<NewCodeBlock tip="radxa@device$" type="device">
```bash
pwm-fan
```
</NewCodeBlock>

- `pwm-fan`：主板自带风扇的控制设备

1. 确定 PWM 控制文件

风扇的 PWM 控制文件通常在 `/sys/class/hwmon/` 目录下，需要找到 `pwm-fan` 对应的 `hwmon` 目录。

使用 `ls` 命令查看 `pwm-fan` 设备的 PWM 控制文件。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
ls /sys/class/hwmon/
```
</NewCodeBlock>

终端会输出类似结果：

<NewCodeBlock tip="radxa@device$" type="device">
```bash
hwmon0
```
</NewCodeBlock>

1. 确定风扇控制节点

使用 `ls` 命令查看 `hwmon` 目录下 `pwm-fan` 设备的 PWM 控制文件。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
ls -l /sys/class/hwmon/hwmon*/device
```
</NewCodeBlock>

终端输出类似结果：

```text
/sys/class/hwmon/hwmon0/device -> ../../../pwm-fan
```

根据终端输出结果，我们可以通过 `hwmon0` 控制 `pwm-fan`。

### 控制风扇转速

使用 `echo` 命令设置风扇转速：PWM 控制范围一般为 0~255（0=停转，255=全速）。

- 风扇全速

<NewCodeBlock tip="radxa@device$" type="device">

```bash
echo 255 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```

</NewCodeBlock>

- 风扇半速

<NewCodeBlock tip="radxa@device$" type="device">

```bash
echo 128 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```

</NewCodeBlock>

- 关闭风扇

<NewCodeBlock tip="radxa@device$" type="device">
```bash
echo 0 | sudo tee /sys/class/hwmon/hwmon0/pwm1
```
</NewCodeBlock>

## 接口引脚定义

可以参考 [资源汇总下载](../download.md) 页面的硬件原理图。
