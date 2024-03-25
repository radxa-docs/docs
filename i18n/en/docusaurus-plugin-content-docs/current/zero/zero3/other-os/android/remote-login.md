---
sidebar_position: 3
---

import Serial from "../../../../common/general/\_serial.mdx"

# Remote login

Introduce how to access SBC through a personal computer (PC) via serial port, adb, etc.

## Serial Login

<Serial platform="rk" />

## Adb Login

ADB is a bridge between your Android device and your computer, and is used to fully operate and manage your Android device on your computer.

### Wired Login

#### Requirements

1. a USB cable
2. a computer or laptop with the ADB tool installed on it
3. a Radxa ZERO 3W/E

#### Steps

1. Connect the USB cable between the USB connector of the computer and the OTG Type C connector of the Radxa ZERO 3W/E.
2. Open the computer terminal and enter adb devices to confirm that the Radxa ZERO 3W/E is recognized.
   Type adb shell to login

```bash
$ adb devices
  List of devices attached
  e74a71a469bf207c device

$ adb shell
  rk356x_radxa_zero3:/ $
```

### Wireless login

Wireless ADB is supported on Android 11 and later.

#### Requirements

1. a computer or laptop with ADB tools installed and ADB version greater than 31.0.0
2. a Radxa ZERO 3W with an Android image greater than or equal to 11.
3. the computer and Radxa ZERO 3W need to be on the same LAN.

#### Steps

1. Start Radxa ZERO 3W and connect to the network using wifi.
2. Enter the Developing mode by tapping the version number 7 times (Settings -> About Tablet -> Version Number).
3. Go to Developing Options (Settings -> System -> Developing Options), turn on wireless debugging and memorize the IP address and interface (example: 10.0.0.16:45613).
4. Open a computer terminal and type adb connect 10.0.0.16:45613 to connect to the Radxa ZERO 3W, type adb shell to login

```bash
$ adb connect 10.0.0.16:45613

$ adb shell
  rk356x_radxa_zero3:/ $
```
