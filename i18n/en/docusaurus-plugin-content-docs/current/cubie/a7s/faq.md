---
sidebar_position: 7
---

# FAQ

## System

### The system does not boot

Verify that you downloaded the correct image, that it is fully downloaded, and that you flashed the _decompressed_ image (not the compressed archive).

If everything looks correct, try downloading the image again to avoid partial downloads.

## Remote access

### SSH does not work

Factory images enable SSH by default. In most cases, you only need to make sure Cubie A7S and your PC are on the same LAN, then connect via SSH.

Troubleshooting:

1. Check Cubie A7S network connectivity and IP address: use `ip a`.
2. Confirm Cubie A7S and your PC are on the same LAN: `ping` each other.
3. Check whether SSH service is running: `sudo systemctl status ssh`.

### VNC does not work

VNC requires manual server configuration. If you follow the tutorial, note that the VNC server will stop after every reboot or shutdown.

Troubleshooting:

1. Complete the VNC configuration steps in the tutorial.
2. Make sure SSH works first.
3. Check whether the VNC server is running: `vncserver -list`.
4. Connect to `ip:5901` where `ip` is the Cubie A7S IP address.

## Serial console

### Cannot open the serial device

If you see `Error: Permission denied, cannot open /dev/ttyUSB0`:

Try the following:

1. Check that the USB‑to‑UART adapter is correctly connected to the PC.

2. Check device permissions.

On Linux, if you do not have permission to access the device, run the following to grant access.

- View device info

For example, using `/dev/ttyUSB0`:

<NewCodeBlock tip="Linux$" type="host">

```
ls -l /dev/ttyUSB0
```

</NewCodeBlock>

If the device exists, you will see output similar to:

```
crw-rw---- 1 root dialout 188, 0 Sep 10 21:24 /dev/ttyUSB0
```

- Add your user to the `dialout` group

<NewCodeBlock tip="Linux$" type="host">

```
sudo usermod -a -G dialout $USER
```

</NewCodeBlock>

- Re-login (or refresh group membership)

<NewCodeBlock tip="Linux$" type="host">

```
newgrp dialout
```

</NewCodeBlock>

3. Check whether the serial device is in use by another program.

## Network bandwidth testing

### Port already in use

If you see `iperf3: error - unable to start listener for connections: Address already in use`, an `iperf3` process is already using port 5201.

Fix:

1. Find the `iperf3` process

<NewCodeBlock tip="Linux@host$" type="device">

```
ps -ef | grep iperf3
```

</NewCodeBlock>

2. Kill the `iperf3` process (replace `<PID>` with the actual PID)

<NewCodeBlock tip="Linux@host$" type="device">

```
sudo kill <PID>
```

</NewCodeBlock>

## KDE Discover does not work

KDE Discover uses OpenGL rendering by default. If the current GPU driver does not support OpenGL rendering, KDE Discover may not work. Use `apt` in the terminal to install packages instead.

<NewCodeBlock tip="Linux@host$" type="device">
```
sudo apt search <package_name>
sudo apt install <package_name>
```
</NewCodeBlock>

`apt` supports fuzzy searching. When using `apt install`, you can press `Tab` to auto-complete package names.

For example, to install VLC:

<NewCodeBlock tip="Linux@host$" type="device">
```
sudo apt search vlc
sudo apt install vlc
```
</NewCodeBlock>
