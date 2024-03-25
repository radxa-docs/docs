---
sidebar_position: 50
---

# Power on / off your ROCK 5A

## Software Restart

** Take the debian system as an example here**

### Shutdown and restart of the graphical interface

1. Click on the icon in the lower left corner and select the **Leave** option.
2. You will be able to see the System function options.
3. You can select the function you need **(Sleep, Reboot, Shutdown)**

![ROCK5A GUI 01](/img/rock5a/rock5a-GUI-leave.webp)

### Shutdown and restart of the terminal interface

Open the terminal command in the desktop(or Ctrl+Alt+T)

**Restart**  
Enter the following command and press Enter.
It will reboot the system if the password is correct.
If wrong, please re-enter the correct password.

```
sudo reboot
```

**Shutdown**  
Enter the following command and press Enter.
It will shutdown the system if the password is correct.
If wrong, please re-enter the correct password.

```
sudo shutdown now
```

## Power Key Start

As shown in the figure, the place where the arrow is pointing to is the power key.

- When the device is off, press the power key and the device will turn on. The power green led will be always on when working, and the status blue led will flash.

![ROCK5A Power](/img/rock5a/rock5a-power.webp)

- When the device is on, press the power key and the screen will pop up the user state selection. You can choose sleep, restart, shutdown or lag out. When you turn off the device or the device in sleep mode, power green led and status blue led will be off.

![ROCK5A Power](/img/rock5a/rock5a-power-status.webp)
