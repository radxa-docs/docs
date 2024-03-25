---
sidebar_position: 5
---

# Power Management

## Control with hardware power key

After connecting the power supply, the power green indicator light of ROCK 3C will be always on.

After pressing the power button to turn on the device, the status blue light will flash. When the ROCK 3C is powered off or in sleep mode, the blue status light will be off.

![ROCK 3C Power](/img/rock3/3c/rock3c-power.webp)

After the ROCK 3C is booted into the desktop, press the power button again, and the power management dialog will pop up:

![ROCK 3C Power](/img/rock5a/rock5a-power-status.webp)

## Control with software

### Control via GUI

Open the Application Launcher. Select `Leave` option to show the power management dialog:

![ROCK3C GUI 01](/img/rock5a/rock5a-GUI-leave.webp)

### Control via command

You can run the following commands in a terminal to control the power state:

- Reboot: `systemctl reboot`
- Shutdown: `systemctl poweroff`
- Suspend: `systemctl suspend`
