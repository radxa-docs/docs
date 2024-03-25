---
sidebar_position: 3
---

import Serial from "../../../../common/general/\_serial.mdx"

# Remote login

Introduce how to access SBC through a personal computer (PC) via serial port,adb,etc.

<Tabs queryString="target">

<TabItem value="serial" label="Serial login">

<Serial platform="rk" model="3a"/>

</TabItem>

<TabItem value="adb" label="ADB login">

ADB is a bridge between your Android device and your computer, and is used to fully operate and manage your Android device on your computer.

### preparation

install adb(Android Debug Bridge):

<Tabs queryString="target">

<TabItem value="adb_windows" label="Windows">

Download the Windows version of the adb toolkit from [Android](https://source.android.com/docs/setup/build/adb),and after downloading and decompressing,you need to configure the environment variables:

Method 1:Enter the following command in the terminal window:

```bash

set HTTP_PROXY=myserver:1981

```

Method 2:Open system settings and modify environment variables:![3a adb](/img/nx5/adb_config_en.webp)

</TabItem>

<TabItem value="adb_linux" label="Linux">

Use the following command to install:

```bash

sudo apt install adb

```

</TabItem>

<TabItem value="adb_mac" label="Mac">

Download the Mac version of the adb toolkit from [Android](https://source.android.com/docs/setup/build/adb),and after downloading and decompressing,you need to configure the environment variables:

```bash
export PATH=${path}:~/platform-tools( '~' is the path of the extracted toolkit)
```

</TabItem>

</Tabs>

<Tabs queryString="target">

<TabItem value="wired_adb" label="Wired login">

#### Requirements

- 1 x USB cable
- 1 x computer or laptop with the ADB tool installed on it
- 1 x Rock 3a

#### Steps

1. Connect the USB cable between the USB connector of the computer and the OTG Type C connector of the Rock 3a.
2. Open the computer terminal and enter adb devices to confirm that the Rock 3a is recognized.Type adb shell to login.

```bash

$ adb devices
  List of devices attached
  f94f8e0d28380ceb device

$ adb shell
  radxa:rock-android11:/ $

```

</TabItem>

<TabItem value="wireless_adb" label="Wireless login">

Wireless ADB is supported on Android 11 and later.

#### Requirements

- a computer or laptop with ADB tools installed and ADB version greater than 31.0.0.
- a Rock 3a with an Android image greater than or equal to 11.
- the computer and Rock 3a need to be on the same LAN.

#### Steps

1. Start Rock 3a and connect to the network using wifi.
2. Enter the Developing mode by tapping the version number 7 times (Settings -> About Tablet -> Version Number).
3. Go to Developing Options (Settings -> System -> Developing Options),turn on wireless debugging and memorize the IP address and interface (example: 10.0.0.16:45613).
4. Open a computer terminal and type adb connect 10.0.0.16:45613 to connect to the Rock 3a,type adb shell to login.

```bash

$ adb connect 10.0.0.16:45613
$ adb shell
  radxa:rock-android11:/ $

```

</TabItem>

</Tabs>

</TabItem>

</Tabs>
