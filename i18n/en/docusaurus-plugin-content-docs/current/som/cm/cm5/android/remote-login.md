---
sidebar_position: 2
---

import Serial from "../../../../common/general/\_serial.mdx"

# Remote Login

Introduces how to login remotely via serial port, adb, etc. from pc.

<Tabs queryString="target">

<TabItem value="Serial" label="Serial Debug">

<Serial platform="rk" model="nx5"/>

</TabItem>

<TabItem value="ADB" label="ADB">

ADB (android debug bridge) is a bridge between your Android device and your computer, and is used to fully operate and manage your Android device on your computer.

## Install ADB

#### Windows

Download the Windows version of the adb toolkit from Android [official website] (https://developer.android.google.cn/).
After downloading and decompressing, you need to configure environment variables:

Method 1: Enter the following command in the terminal window

```
set HTTP_PROXY=myserver:1981

```

Method 2: ![CM5 adb](/img/cm5/cm5-install-adb-en.webp)

#### Linux

Just use the following command to install it:

```bash
sudo apt install adb
```

#### Mac

Download the Windows version of the adb toolkit from Android [official website] (https://developer.android.google.cn/). After downloading and decompressing, you need to configure environment variables:

Open the terminal and enter the command to configure environment variables.

```bash
export PATH=${path}:~/platform-tools(‘~’ represents the path to the unzipped toolkit)
```

## ADB login

<Tabs queryString="target">

<TabItem value="line_adb" label="Wired login">

#### Require

1. A USB data cable
2. A computer or laptop with the ADB tool installed
3. A Radxa CM5

#### Steps

1. Start Radxa CM5

2. Use a USB cable to connect the USB interface of your computer and the OTG Type C interface of Radxa CM5

![cm5-adb](/img/cm5/cm5io-otg-connect.webp)

3. Open the computer terminal and enter adb devices to confirm that Radxa CM5 is recognized, enter adb shell to log in

```bash
$ adb devices
  List of devices attached
  f94f8e0d28380ceb device

$ adb shell
  RadxaRockCM5:/ $
```

</TabItem>

<TabItem value="wireless_adb" label="Wireless login">

Android 11 and above support ADB wireless login.

#### Require

1. A computer or laptop with the ADB tool installed. The ADB version needs to be greater than 31.0.0

2. For a Radxa CM5, the Android image needs to be greater than or equal to 11

3. The computer and Radxa CM5 need to be in the same LAN

#### Steps

1. Start Radxa CM5 and connect to the network using wifi

2. Enter the development mode and click the version number 7 times to enter the development mode (Settings -> About Tablet -> Version Number)

3. Enter the development options (Settings -> System -> Development options), turn on wireless debugging, remember the IP address and connection (example: 10.0.0.16:45613)

4. Open the computer terminal and enter adb connect 10.0.0.16:45613 to connect to Radxa CM5, enter adb shell to log in

```bash
$ adb connect 10.0.0.16:45613

$ adb shell
  RadxaRockCM5:/ $
```

</TabItem>
</Tabs>

</TabItem>
</Tabs>
