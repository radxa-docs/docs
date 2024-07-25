---
sidebar_position: 30
---

# RTC 定时唤醒

** 确保 RTC 电池接入主板，保证时钟在电源关闭时继续运行**

![RTC_Wake_up_01](/img/x/x4/rtc_wakeup_04.webp)

## 定时功能设置

- 接通 Radxa X4 的电源
- 开机时，按住 DEL 键进入 BIOS 设置页面
- 在 Advanced --> ACPI Settings页面下，设置 Resume On RTC Alarm 选项

![RTC_Wake_up_01](/img/x/x4/rtc_wakeup_01.webp)

## 模式介绍

### Fixed Time

- 设置自动开机的时间，比如需要在每天的15点15分15秒自动开机，设置如上图所示(系统时间和当地时间保持一致)。

- 设置好后按F4保存退出，完成后关机，保持Radxa X4处于接通电源的状态。系统会在每天的15点15分15秒自动开机。
