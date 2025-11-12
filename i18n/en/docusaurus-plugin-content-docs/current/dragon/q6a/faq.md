---
sidebar_position: 7
---

# Frequently Asked Questions (FAQ)

## Failed to Open Serial Port Device

If you encounter the error `Error: Permission denied, cannot open /dev/ttyUSB0` when trying to open the serial port!

You can troubleshoot the issue by following these steps:

1. Check if the serial device is properly connected to the PC

2. Check serial device permissions

For Linux systems, if the serial device has insufficient permissions, you need to run the following commands in the terminal to grant the current user access to the device.

- View serial device information

Using `/dev/ttyUSB0` as an example:

<NewCodeBlock tip="Linux$" type="host">

```
ls -l /dev/ttyUSB0
```

</NewCodeBlock>

If the device exists on the system, you will see output similar to:

```
crw-rw---- 1 root dialout 188, 0 Sep 10 21:24 /dev/ttyUSB0
```

- Add current user to the `dialout` group

<NewCodeBlock tip="Linux$" type="host">

```
sudo usermod -a -G dialout $USER
```

</NewCodeBlock>

- Log in again

<NewCodeBlock tip="Linux$" type="host">

```
newgrp dialout
```

</NewCodeBlock>

3. Check if the serial device is being used by another program

## Why does Radxa OS use GDM by default instead of SDDM?

Radxa OS uses GDM (GNOME Display Manager) instead of SDDM (Simple Desktop Display Manager) by default for the following reasons:

**SDDM Limitations:**

- SDDM cannot properly start the graphical interface in headless mode when HDMI is not connected
- This prevents users from logging in through remote desktop or VNC

**GDM Advantages:**

- Runs stably in various connection states (including headless mode)
- Provides better compatibility and reliability

If you want to switch back to SDDM, follow these steps:

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo dpkg-reconfigure sddm
```

</NewCodeBlock>

In the configuration interface that appears, select `sddm` as the default display manager, then restart the system for the changes to take effect.

## why my SBC cannot connect Wi-Fi when it is only logged in to the desktop mode?

Because KDE or GNOME desktop environment stores Wi-Fi passwords in the user-specific keyring by default. The keyring will only be unlocked when the user logs in to the graphical interface, which means that the system cannot automatically connect to a protected Wi-Fi network when it is not logged in (such as in headless mode), and SSH cannot be used.
To solve this problem, you can choose one of the following three methods:

- Enable automatic login:
    This will allow the system to automatically log in to the specified user, unlocking the keyring, allowing Wi-Fi connection. Use the rsetup tool to enable automatic login.
- Disable keyring encryption:
    You can disable keyring encryption by following these steps: KDE Settings -> KDE Wallet -> Disable keyring encryption.
    Then forget the Wi-Fi password and reconnect to the Wi-Fi.
    This way, the keyring will no longer be encrypted, and the system can access the Wi-Fi password without user login, enabling automatic connection to Wi-Fi networks. Please note that this method reduces system security.
- Use nmtui/nmcli tools to manually add Wi-Fi password:
    Use command-line tools nmtui or nmcli to manually configure Wi-Fi network connections and save the password to system-wide configuration files instead of the user's keyring.

<NewCodeBlock tip="Linux$" type="host">

```bash
nmcli connection add type wifi con-name <connection_name> ssid <ssid> password <password>
# or
nmtui
```

</NewCodeBlock>

## Network Connection Automatically Disconnects

You can modify the parameters in the `/usr/share/glib-2.0/schemas/org.gnome.settings-daemon.plugins.power.gschema.xml` file to disable sleep timeout.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
vim /usr/share/glib-2.0/schemas/org.gnome.settings-daemon.plugins.power.gschema.xml
```

</NewCodeBlock>

Modify the `sleep-inactive-ac-timeout` and `sleep-inactive-battery-timeout` parameters in the file to have a default value of `0`, then restart the system for the changes to take effect.
