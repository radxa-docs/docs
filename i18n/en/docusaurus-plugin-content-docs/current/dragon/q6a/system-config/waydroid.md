---
sidebar_position: 9
---

# Waydroid User Guide

Waydroid is an Android container environment based on Wayland. It allows you to run Android apps on the Dragon Q6A.

Waydroid runs a complete Android system in a container and integrates with the Linux desktop, so Android apps can run like native applications.

:::tip

- [Waydroid official documentation](https://docs.waydro.id/)
  :::

## Prerequisites

Waydroid only works under a Wayland session. You can check your current session type with the following command.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
echo $XDG_SESSION_TYPE
```

</NewCodeBlock>

If the output is `wayland`, your current session is Wayland and you can run Waydroid.

If the output is not `wayland`, select the **GNOME (Wayland)** session (avoid Xorg) from the login screen and log in again.

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

Add the PSI kernel parameter.

### Edit boot parameters

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo cp /etc/kernel/cmdline /etc/kernel/cmdline.bak
grep -q 'psi=1' /etc/kernel/cmdline || sudo sed -i 's/$/ psi=1/' /etc/kernel/cmdline
```

</NewCodeBlock>

### Update boot entry

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo kernel-install add $(uname -r) /boot/vmlinuz-$(uname -r)
```

</NewCodeBlock>

Finally, reboot the system.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo reboot
```

</NewCodeBlock>

## Initialize Waydroid

Before first use, you need to initialize Waydroid. You can click the Waydroid icon or run the command below in a terminal.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo waydroid init
```

</NewCodeBlock>

Initialization will automatically download `system.img` and `vendor.img`.

:::tip Manually initialize Waydroid

If automatic initialization fails or downloads are very slow, you can manually download the system/vendor archives and extract them to `/etc/waydroid-extra/images`.

- Get the download URL

Copy the download URL from the JSON files below. The dates of `system.img` and `vendor.img` should match; otherwise apps may crash.

[system.img](https://ota.waydro.id/system/lineage/waydroid_arm64/VANILLA.json)

[vendor.img](https://ota.waydro.id/vendor/waydroid_arm64/MAINLINE.json)

- Extract the image archives

Open a terminal, go to the directory where you downloaded the files, and extract the system/vendor archives to `/etc/waydroid-extra/images`.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo mkdir -p /etc/waydroid-extra/images
sudo unzip lineage-*-system.zip -d /etc/waydroid-extra/images
sudo unzip lineage-*-vendor.zip -d /etc/waydroid-extra/images
rm lineage-*-system.zip lineage-*-vendor.zip
```

</NewCodeBlock>

- Re-initialize Waydroid

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo waydroid init -f
```

</NewCodeBlock>

:::

## Start Waydroid

After initialization, start the Waydroid container service.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo systemctl enable --now waydroid-container
```

</NewCodeBlock>

Then start the Waydroid session and open the UI.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
waydroid session start
waydroid show-full-ui
```

</NewCodeBlock>

## Install Android apps

Open a terminal, change to the directory that contains the APK, and install it with the command below.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
waydroid app install example-app.apk
```

</NewCodeBlock>

After installation, the app will appear in your application menu.
