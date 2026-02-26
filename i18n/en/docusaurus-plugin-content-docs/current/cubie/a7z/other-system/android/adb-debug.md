---
sidebar_position: 4
---

# ADB Debugging

ADB (Android Debug Bridge) is the official Android command-line utility for debugging and managing Android devices.

This guide uses the Android SDK Platform-Tools package for all ADB operations.

:::tip
Android SDK Platform-Tools is a core component of the Android SDK that provides utilities for interacting with devices and emulators.

It bundles ADB, Fastboot, and other tools, and is available for Linux, Windows, and macOS.
:::

## Hardware Requirements

- Board: Radxa Cubie A7Z
- Boot media: MicroSD card or onboard UFS
- Type‑C data cable to connect the board and PC

Ensure the Cubie A7Z has already booted into Android; otherwise ADB cannot connect.

:::tip
The Cubie A7Z Type‑C port supports both power input and OTG, so the same cable can power the board and provide wired ADB debugging.
:::

## Download SDK Platform-Tools

Official download page: [Android SDK Platform-Tools](https://developer.android.com/studio/releases/platform-tools)

Choose the archive for your host OS, download it, and extract it.

## Using SDK Platform-Tools

ADB is the primary tool used in this package.

Open a terminal, change to the extracted `platform-tools` directory, and run `./adb <command>` as needed.

### Check the Version

Run `./adb version` to confirm the installed ADB version.

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb version
```

</NewCodeBlock>

Successful output looks like:

```text
Android Debug Bridge version 1.0.41
Version 36.0.0-13206524
```

### Enable Debugging Features

:::tip
USB debugging is enabled by default on the Cubie A7Z Android build, and Android 11 or later also supports wireless ADB.

- **Wired debugging**: Ensure USB debugging remains enabled on the device.
- **Wireless debugging**: Enable the wireless debugging option as well.
  :::

#### Wired connection

Connect the Cubie A7Z to the PC with the Type‑C cable; it provides both power and data for wired debugging.

#### Wireless connection

Power the Cubie A7Z via a Type‑C adapter. Ensure both the board and the PC are on the same Wi‑Fi network.

#### Steps to enable debugging

Put the device into Developer Mode and confirm the debugging options are enabled:

1. On the tablet, go to `Settings → About tablet`.
2. Tap `Build number` seven times to unlock Developer Mode.
3. Navigate to `Settings → System → Developer options`.
4. Enable both `USB debugging` and `Wireless debugging`.
5. Tap `Wireless debugging` to view the **IP address & Port**, needed for wireless ADB.

### List Connected Devices

Run `./adb devices` to display attached devices.

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb devices
```

</NewCodeBlock>

Successful output resembles:

```text
List of devices attached
7c0016117200887238d	device
```

### Connect to the Android Device

<Tabs queryString="adb-connect">
<TabItem value="Wired">

From inside the `platform-tools` directory, run `./adb shell` to enter the device shell.

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb shell
```

</NewCodeBlock>

You should see a shell prompt similar to:

```text
radxa-A7Z:/ $
```

</TabItem>
<TabItem value="Wireless">

From the same directory, run `./adb connect <device_ip:port>` to initiate a wireless session.

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb connect <device_ip:port>

# Example

./adb connect 192.168.31.201:43167

```

</NewCodeBlock>

Expected output:

```text
already connected to 192.168.31.201:43167
```

After connecting, use `./adb shell` to drop into the device shell.

<NewCodeBlock tip="Host-PC$" type="device">

```bash
./adb shell
```

</NewCodeBlock>

You should again see:

```text
radxa-A7Z:/ $
```

</TabItem>
</Tabs>
