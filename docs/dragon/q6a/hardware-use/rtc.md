---
sidebar_position: 15
---

# RTC 接口

瑞莎 Dragon Q6A 板载 RTC 接口，用于安装纽扣电池。

## 硬件连接

将 CR2032 型号的纽扣电池安装到瑞莎 Dragon Q6A 的 RTC 接口，安装时请注意电池正负极，瑞莎 Dragon Q6A 的丝印有标注正负极。

:::tip 接口位置
可以参考 [硬件信息](./hardware_info) 教程找到对应硬件接口位置。
:::

## 配置 RTC

### 确认 RTC 硬件

使用以下命令来确认 RTC 硬件是否正常工作。

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo dmesg | grep rtc
```
</NewCodeBlock>

终端输出类似信息：`registered as rtc0`，说明 RTC 电池被正确识别。

```
[    0.368528] msm_dpu ae01000.display-controller: [drm] Cannot find any crtc or sizes
[    0.368720] msm_dpu ae01000.display-controller: [drm] Cannot find any crtc or sizes
[    6.259233] rtc-ds1307 10-0068: registered as rtc0
[    6.260658] rtc-ds1307 10-0068: setting system clock to 2025-08-06T08:39:15 UTC (1754469555)
```

### 读取 RTC 时间

终端使用 `hwclock` 命令读取 RTC 芯片（/dev/rtc0）的当前时间。

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo apt update
sudo apt install util-linux util-linux-extra -y
sudo hwclock -r -f /dev/rtc0
```

</NewCodeBlock>

### 显示系统时间

使用 `date` 命令显示系统当前时间。

<NewCodeBlock tip="radxa@device$" type="device">

```
date
```

</NewCodeBlock>

### 设置 RTC 时间

若 RTC 时间和系统时间不一致，可以使用 `hwclock` 命令将系统当前时间写入 RTC。

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo hwclock -w -f /dev/rtc0
```
</NewCodeBlock>

### 验证 RTC 功能

记录当前系统时间，然后断开主板电源和网络，等待 10 分钟左右，然后重新连接电源，观察系统时间是否正常计时。

## 接口引脚定义

可以参考 [资源汇总下载](../download) 页面的硬件原理图。
