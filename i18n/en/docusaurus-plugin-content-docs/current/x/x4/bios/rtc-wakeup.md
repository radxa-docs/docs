---
sidebar_position: 30
---

# RTC Timed Wake-Up

** Ensure RTC Battery is Connected to the Motherboard to Ensure Clock Continues Running When Power is Off **

![RTC_Wake_up_01](/img/x/x4/rtc_wakeup_04.webp)

## Timed Function Configuration

- Power on Radxa X4.
- During startup, press and hold the DEL key to access the BIOS settings.
- Navigate to Advanced --> S5 RTC Wake setting.
- Adjust the "Wake up On Alarm" option in this menu

![RTC_Wake_up_01](/img/x/x4/rtc_wakeup_01.webp)

## Mode Introduction

### Fixed Time

- Set the time for automatic startup, such as automatically starting at 15:15:15 every day, as shown in the above figure (the system time should be consistent with the local time).

- After setting, press F4 to save and exit. After completion, turn off the device and keep the Radxa X4 powered on. The system will automatically power on at 15:15:15 every day.
