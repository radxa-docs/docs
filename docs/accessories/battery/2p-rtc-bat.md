---
sidebar_position: 3
---

# 瑞莎 RTC 电池

瑞莎 RTC 电池可以为主板上的实时时钟（RTC）芯片在断电时持续供电，从而实现系统时钟的持续计时，保障系统时间在断电情况下也能保持准确

![](/img/accessories/rtc_battery.webp)

- 接口类型：2-Pin XH1.25mm
- 电池类型：CR2032
- 工作电压：3.3V

## 使用指南

将 RTC 电池的接口连接到主板上的 RTC 接口。

### 查看 RTC

终端输入命令查看系统是否正确识别 RTC 电池。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo dmesg | grep rtc
```
</NewCodeBlock>

终端输出类似信息：`registered as rtc0`，说明 RTC 电池被正确识别。

```text
[    6.259233] rtc-ds1307 10-0068: registered as rtc0
[    6.260658] rtc-ds1307 10-0068: setting system clock to 2025-08-06T08:39:15 UTC (1754469555)
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

记录当前系统时间，然后断开主板的电源和网络，等待 10 分钟左右，然后重新连接电源，观察系统时间是否正常计时。
