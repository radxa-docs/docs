---
sidebar_position: 12
---

# RTC 接口

瑞莎 CM4 IO 板板载 RTC 接口，用于安装纽扣电池。

## 硬件连接

将 CR1220 型号的纽扣电池安装到瑞莎 CM4 IO 板的 RTC 接口，安装时请注意电池正负极，瑞莎 CM4 IO 板的丝印有标注正负极。

:::tip 接口位置
可以参考 [硬件信息](./hardware_info.md) 教程找到对应硬件接口位置。
:::

## 配置 RTC

### 确认 RTC 硬件

使用以下命令来确认 RTC 硬件是否正常工作。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo dmesg | grep rtc
```
</NewCodeBlock>

终端输出类似信息：`rtc information is valid`，说明 RTC 电池被正确识别。

```text
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

### 验证 RTC 功能

记录当前系统时间，然后断开主板电源和网络，等待 10 分钟左右，然后重新连接电源，观察系统时间是否正常计时。

## 接口引脚定义

可以参考 [资源汇总下载](../download.md) 页面的硬件原理图。
