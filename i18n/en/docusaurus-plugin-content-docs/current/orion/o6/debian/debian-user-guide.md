---
sidebar_position: 5
---

# Debian User Guide

This guide focuses on the Debian12 Desktop system built by Radxa.

## Default username and password

``
username : radxa
password : radxa

```

## Accessing Devices

### Option 1: Use HDMI monitor, USB keyboard and mouse

The desktop system can be seen on the HDMI monitor.

### Option two: SSH

SSH service is enabled by default.
You can view the IP of the device in the router management interface; or you can find the IP of the device by [angryip](https://angryip.org/) of the computer host.

```

$ ping ip-of-device
$ ssh radxa@ip-of-device

```

## Displays

The Orion O6 has five display ports, namely

- HDMI
- DP
- USBC 0
- USBC 1
- eDP

The physical interfaces correspond to the system DRM Card as follows:

| System DRM Card              | physical interface |
| -------------------------- | -------- |
| /sys/class/drm/card0-DP-1  | USBC 0   |
| /sys/class/drm/card1-DP-2  | HDMI     |
| /sys/class/drm/card2-eDP-1 | eDP      |
| /sys/class/drm/card3-DP-3  | USBC 1   |
| /sys/class/drm/card4-DP-4  | DP       |
```
