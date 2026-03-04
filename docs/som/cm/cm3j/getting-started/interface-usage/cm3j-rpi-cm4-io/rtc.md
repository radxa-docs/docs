---
sidebar_position: 7
---

# RTC 接口

## 使用介绍

- 安装电池

  - 如图所示，将 RTC 电池安装到树莓派 Compute Module 4 IO Board 上

    ![RTC](/img/cm3j/rtc.webp)

- 上电启动

- 查看设备

  - RTC 通常映射到Linux的设备文件中。你可以查看 /dev/rtc\* 或 /sys/class/rtc/ 目录下的文件来确认 RTC 设备是否已经被识别和加载

- 读取当前 RTC 时间

  - 使用 hwclock 命令来读取 RTC 的当前时间，在终端中执行以下命令：

    ```bash
    sudo hwclock -r
    ```

- 写入时间

  - 如果需要设置 RTC 的时间，可以使用 hwclock 命令并通过 --set 选项提供一个新的时间值。例如，设置为当前系统时间可以使用：

    ```bash
    sudo hwclock --set --date="2024-07-09 15:43:15"
    ```

- 持续性测试

  - 断开树莓派 Compute Module 4 IO Board 的网络连接和电源，十分钟或者更长时间后，再次读取 RTC 时间，时间应该是以刚刚写入的时间为基础加上间隔的时间
