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

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo dmesg | grep rtc
```
</NewCodeBlock>

终端输出类似信息：`registered as rtc0`，说明 RTC 电池被正确识别。

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

### 读取 RTC 时间

终端使用 `hwclock` 命令读取 RTC 芯片（/dev/rtc0）的当前时间。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo hwclock -r -f /dev/rtc0
```
</NewCodeBlock>

### 显示系统时间

使用 `date` 命令显示系统当前时间。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
date
```
</NewCodeBlock>

### 设置 RTC 时间

若 RTC 时间和系统时间不一致，可以使用 `hwclock` 命令将系统当前时间写入 RTC。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo hwclock -w -f /dev/rtc0
```
</NewCodeBlock>

### 验证 RTC

记录当前系统时间，然后断开瑞莎 Cubie A7A 的电源和网络，等待 10 分钟左右，然后重新连接电源，观察系统时间是否正常计时。

## 接口规格

:::info 技术参考
完整的技术规格和引脚定义可参考下载专区的 [硬件设计：原理图](../download) 文档
:::
