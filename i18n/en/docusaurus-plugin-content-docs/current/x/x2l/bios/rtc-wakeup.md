---
sidebar_position: 30
---

# RTC Timed Wake-Up

** Ensure RTC Battery (CR1220) is Connected to the Motherboard to Ensure Clock Continues Running When Power is Off **

## Timed Function Configuration

- Power on Radxa X2L.
- During startup, press and hold the DEL key to access the BIOS settings.
- Navigate to Advanced --> S5 RTC Wake setting.
- Adjust the "Wake up On Alarm" option in this menu

![RTC_Wake_up_01](/img/x/x2l/rtc_wakeup_01.webp)

## Mode Introduction

** There are 2 methods to achieve RTC Wakeup functionality **

### Fixed Time

- Set the automatic power-on time, for example, if you want the system to automatically power on every day at 8:30 AM, configure as shown in the figure below (ensure system time is synchronized with the local time).
- After configuring, press F4 to save and exit. Shut down the system, keeping Radxa X2L connected to the power supply. Radxa X2L will automatically power on at 8:30 AM every day.

![RTC_Wake_up_02](/img/x/x2l/rtc_wakeup_02.webp)

### Dynamic Time

- Configure dynamic time, for instance, if you want the system to automatically power on 5 minutes from the current time, set it as shown in the figure below.
- After configuration, press F4 to save and exit. Shut down the system, ensuring the power supply remains connected. The system will automatically power on 5 minutes later.

![RTC_Wake_up_03](/img/x/x2l/rtc_wakeup_03.webp)
