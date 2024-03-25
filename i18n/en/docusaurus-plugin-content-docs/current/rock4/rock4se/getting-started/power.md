---
sidebar_position: 18
---

# Power Management

## Control with hardware power key

After connecting to the power supply, ROCK 4SE will automatically start up, and the power led will remain on. After the system starts, the status blue led will continue to flash. When the ROCK 4SE is in sleep state, the status blue led will be off.

![ROCK 4SE Power](/img/rock4/4se/rock4se-power.webp)

## Control with software

### Control via GUI

Open the Application Launcher. Select `Leave` option to show the power management dialog:

![ROCK 4SE GUI](/img/rock5a/rock5a-GUI-leave.webp)

### Control via command

You can run the following commands in a terminal to control the power state:

- Reboot: `systemctl reboot`
- Shutdown: `systemctl poweroff`
- Suspend: `systemctl suspend`
