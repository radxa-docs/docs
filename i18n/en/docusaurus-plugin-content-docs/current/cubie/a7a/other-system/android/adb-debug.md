---
sidebar_position: 4
---

# ADB Debugging

ADB (Android Debug Bridge) is a command-line tool officially provided by Android for debugging and managing Android devices.

Our tutorial uses Android SDK Platform-Tools for ADB debugging.

:::tip
Android SDK Platform-Tools is a core component of the Android Software Development Kit (SDK), providing developers and advanced users with a collection of utilities for interacting with and managing Android devices and emulators.

Android SDK Platform-Tools includes tools like ADB (Android Debug Bridge) and Fastboot, supporting major operating systems such as Linux, Windows, and macOS.
:::

## Hardware Requirements

- Board: Radxa Cubie A7A
- Boot media: MicroSD card, eMMC module, or UFS module (choose one)
- Power adapter: 5V Type-C power adapter
- Type-C cable: For connecting the board to your computer

Ensure that the Android system on your Cubie A7A has successfully booted before proceeding with ADB debugging.

:::tip
For the exact location of the Type-C port, please refer to the interface description section in the [Hardware Interfaces](../hardware-info) guide!
:::

## Download SDK Platform-Tools

Official download page: [Android SDK Platform-Tools](https://developer.android.com/studio/releases/platform-tools)

Download and extract the appropriate SDK Platform-Tools package for your operating system.

## Using SDK Platform-Tools

We primarily use the ADB tool from the SDK Platform-Tools package.

Open a terminal, navigate to the extracted `platform-tools` directory, and run ADB tools using the `./adb <command>` command.

### View Version Information

Use the `./adb version` command to view the version information of the ADB tool.

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb version
```

</NewCodeBlock>

Upon successful execution, it will display the version information of the ADB tool, similar to the following:

```text
Android Debug Bridge version 1.0.41
Version 36.0.0-13206524
```

### Enable Debugging Function

:::tip
The Android system on Cubie A7A defaults to enabling USB debugging, and wireless ADB debugging is supported from Android 11.

**Wired Connection**：You need to enable USB debugging in the Android system on Cubie A7A.

**Wireless Connection**：You need to enable wireless debugging in the Android system on Cubie A7A.
:::

#### Wired Connection

Use a Type-C data cable to connect Cubie A7A and your computer. Power and wired debugging are performed through this Type-C data cable.

#### Wireless Connection

Use a Type-C power adapter to connect Cubie A7A, Cubie A7A's WiFi and your computer need to connect to the same network, ensuring they are in the same local area network.

#### Enable Debugging Function

We need to let Cubie A7A enter developer mode, and check if USB and wireless debugging functions are enabled in this mode.

Steps to enable USB and wireless debugging functions:

1. Enter the `Settings` → `About tablet` interface of the Android system on Cubie A7A.
2. Click `Build number` seven times to enter developer mode.
3. Enter the `Settings` → `System` → `Developer options` interface of the Android system on Cubie A7A.
4. Check the `USB debugging` and `Wireless debugging` functions.
5. Click the `Wireless debugging` option to see `IP address & Port`, wireless debugging requires IP address and port information.

### View Device List

Use the `./adb devices` command to view the device list.

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb devices
```

</NewCodeBlock>

Upon successful execution, it will display the device list, similar to the following:

```text
List of devices attached
7c0016117200887238d	device
```

### Connect Android Device

<Tabs queryString="adb-connect">
<TabItem value="Wired Connection">

In the `platform-tools` folder directory, use the `./adb shell` command to enter the Android device's terminal shell.

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb shell
```

</NewCodeBlock>

Upon successful execution, it will display the Android device's terminal shell, similar to the following:

```text
radxa-a7a:/ $
```

</TabItem>
<TabItem value="Wireless Connection">

In the `platform-tools` folder directory, use the `./adb connect <device_ip>` command to connect to the Android device.

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb connect <device_ip:port>

# Example

./adb connect 192.168.31.201:43167
```

</NewCodeBlock>

Upon successful connection, you'll see a message similar to:

```text
already connected to 192.168.31.201:43167
```

After a successful connection, use the `./adb shell` command to access the Android device's terminal shell.

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb shell
```

</NewCodeBlock>

Successful access will display the Android device's terminal shell, similar to:

```text
radxa-a7a:/ $
```

</TabItem>
</Tabs>
