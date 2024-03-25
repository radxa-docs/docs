---
sidebar_position: 30
---

# RTC 定时唤醒

** 确保 RTC 电池（CR1220）接入主板，保证时钟在电源关闭时继续运行**

## 定时功能设置

- 接通 Radxa X2L 的电源
- 开机时，按住 DEL 键进入 BIOS 设置页面
- 在 Advanced --> S5 RTC Wake setting页面下，设置 Wake up On Alarm 选项

![RTC_Wake_up_01](/img/x/x2l/rtc_wakeup_01.webp)

## 模式介绍

** 有 2 种方式实现 RTC Wakeup 功能**

### Fixed Time

- 设置自动开机的时间，比如需要在每天的早上 8 点 30 分自动开机，设置如下图所示(系统时间和当地时间保持一致)。
- 设置好后按 F4 保存退出，完成后关机，保持Radxa X2L 处于接通电源的状态。Radxa X2L 会在每天的 8 点半自动开机。

![RTC_Wake_up_02](/img/x/x2l/rtc_wakeup_02.webp)

### Dynamic Time

- 设置动态时间，比如需要在当前时间的 5 分钟后自动开机，设置如下图所示。
- 设置好后按 F4 保存退出，完成后关机，保持电源有电。系统会在 5 分钟后自动开机。

![RTC_Wake_up_03](/img/x/x2l/rtc_wakeup_03.webp)
