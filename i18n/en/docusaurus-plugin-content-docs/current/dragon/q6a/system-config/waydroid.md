---
sidebar_position: 9
---

# Waydroid User Guide

Waydroid is an Android container solution based on Wayland, allowing you to run Android apps on the Dragon Q6A.

Waydroid runs a full Android system in a container and integrates it with the desktop environment, so Android apps can run like native applications.

:::tip

- [Waydroid Official Documentation](https://docs.waydro.id/)
  :::

## Prerequisites

Waydroid only works under a Wayland session. You can use the following command to check the current session type.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
echo $XDG_SESSION_TYPE
```

</NewCodeBlock>

If the output is `wayland`, it means your current session is Wayland and you can run Waydroid.

If the output is something else, select the GNOME desktop environment at the bottom-right of the login screen and log in again.

## Install Waydroid

### Add the Waydroid repository

Add the official Waydroid repository.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
curl -s https://repo.waydro.id | sudo bash
```

</NewCodeBlock>

### Install Waydroid

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo apt update
sudo apt install waydroid -y
```

</NewCodeBlock>

## PSI kernel parameter

If Android gets stuck on the boot animation, add the PSI parameter.

### Edit boot parameters

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo sed -i 's/$/ psi=1/' /etc/kernel/cmdline
```

</NewCodeBlock>

## Update boot entry

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo kernel-install add $(uname -r) /boot/vmlinuz-$(uname -r)
```

</NewCodeBlock>

Finally, reboot the system.

## Initialize the Android system

On first use, you need to initialize the system image. You can click the Waydroid icon or run the command below in a terminal.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo waydroid init
```

</NewCodeBlock>

Initializing will automatically download `system.img` and `vendor.img`. The downloaded images will be stored in `/var/lib/waydroid/images`.

## Install Android apps

Install Android apps from the command line.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
waydroid app install xxx.apk
```

</NewCodeBlock>

After installation, the app will appear in the Linux desktop application menu.
