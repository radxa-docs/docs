---
sidebar_position: 13
---

# RTC

## 简介

实时时钟 (RTC) 是一种测量时间流逝的电子设备（最常见的形式是集成电路）。

## 接口测试方法

- 将 RTC 电池安装在 RTC 接口，如图所示

<img src="/img/rock5itx/rock5itx-rtc.webp" width="700" alt="rock 5 itx rtc" />

- 检查 rtc 设备是否被成功注册

```bash
[    5.438578] rtc-hym8563 6-0051: registered as rtc0
```

如上所示，rtc 设备为 rtc0

- 查看rtc时间

```bash
hwclock -r -f /dev/rtc0
```

- 查看当前时间是否准确，不准确请同步当前时间

- 写入时间到 rtc

```bash
hwclock -w -f /dev/rtc0
```

- 再次查看rtc时间，确保和当前一致

```bash
hwclock -r -f /dev/rtc0
```

- 断网断电 10 分钟，10 分钟后上电查看 rtc 时间是否和当前一样
