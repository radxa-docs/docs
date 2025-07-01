---
sidebar_position: 10
---

# RTC 接口

瑞莎 Cubie A7A 板载 RTC 电池接口，可以通过该接口连接 RTC 电池，为主板上的实时时钟（RTC）芯片在断电时持续供电，从而实现系统时钟的持续计时，保障系统时间在断电情况下也能保持准确。

:::tip
RTC 接口具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 使用指南

使用 RTC 接口连接 RTC 电池，电池参数：

- 接口类型：2-Pin 1.25mm
- 电池类型：CR2032
- 电池电压：3.0V

### 查看 RTC

终端输入命令查看系统是否正确识别 RTC 电池。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo dmesg | grep rtc
```
</NewCodeBlock>

终端输出类似信息：`rtc information is valid`，说明 RTC 电池被正确识别。

```
[    8.145303] [drm] Esmart1-win0(possible_vp_mask = 0x00000006) has no possible crtcs
[    8.145370] [drm] Esmart3-win0(possible_vp_mask = 0x00000006) has no possible crtcs
[    8.153133] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
[    8.154487] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
[    8.700833] rtc-hym8563 2-0051: hym8563_init_device: error read i2c data -6
[    8.716545] rtc-hym8563 2-0051: rtc information is valid
[    8.724597] rtc-hym8563 2-0051: registered as rtc0
[    8.725670] rtc-hym8563 2-0051: setting system clock to 2000-01-01T00:00:23 UTC (946684823)
```

### 读取 RTC 时间

终端使用 `hwclock` 命令读取 RTC 芯片（/dev/rtc0）的当前时间。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo hwclock -r -f /dev/rtc0
```
</NewCodeBlock>

### 显示系统时间

使用 `date` 命令显示系统当前时间。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
date
```
</NewCodeBlock>

### 设置 RTC 时间

若 RTC 时间和系统时间不一致，可以使用 `hwclock` 命令将系统当前时间写入 RTC。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo hwclock -w -f /dev/rtc0
```
</NewCodeBlock>

### 验证 RTC

记录当前系统时间，然后断开瑞莎 Cubie A7A 的电源和网络，等待 10 分钟左右，然后重新连接电源，观察系统时间是否正常计时。

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name      | Pin# | Name       |
| :--: | :-------- | :--: | :--------- |
|  1   | OSCI      |  5   | S_TWI1_SDA |
|  2   | OSCO      |  6   | S_TWI1_SCK |
|  3   | RTC_INT_L |  7   | ALDO1      |
|  4   | GND       |  8   | VCC_RTC    |
