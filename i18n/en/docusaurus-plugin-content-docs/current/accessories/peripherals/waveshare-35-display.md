---
sidebar_position: 10
---

# Waveshare 3.5 inch SPI TFT LCD display

## Connect the screen

Connect the screen with the development board as follows:

![Waveshare35-spi-display](/img/accessories/waveshare35-spi-display.webp)

## Use rsetup to enable the corresponding overlay

- after entering rsetup, enter the device tree management interface.
<!-- - after entering rsetup, follow [Device Tree Settings](/radxa-os/rsetup/devicetree) to enter the device tree management interface. -->

- Enable the overlay of Waveshare 3.5 inch Display

```
[*] Enable Waveshare 3.5 inch Display on SPI1
```

## Config the display

- backup /etc/X11/xorg.conf.d/20-modesetting.conf

```
sudo cp /etc/X11/xorg.conf.d/20-modesetting.conf /etc/X11/xorg.conf.d/20-modesetting.conf.bak
```

- Clear the original content and add the following

```
Section "Device"
     Identifier  "Rockchip Graphics"
     Driver      "fbdev"
     Option      "fbdev"          "/dev/fb1"
     Option      "DRI"            "2"
EndSection
```

please check whether the device is /dev/fb0 or /dev/fb1.

## Configure Touch

Add a configuration file 99-touchscreen-calibration.conf under /etc/X11/xorg.conf.d with the following contents:

```
Section "InputClass"
    Identifier "calibration"
    MatchProduct "ADS7846 Touchscreen"
    Option "TransformationMatrix" "-1 0 1 0 1 0 0 0 1"
EndSection
```

## Reboot the system

```
sudo reboot
```

After restarting the system, the screen should already be displayed normally.
