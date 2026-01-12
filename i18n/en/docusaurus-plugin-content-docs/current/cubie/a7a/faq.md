---
sidebar_position: 7
---

# Frequently Asked Questions

## System Issues

### System Fails to Boot

We provide standard system images and Phoenix system images.

- **Standard System Image**: Includes a partition table and can be directly installed onto the system boot medium.

If using a standard system image, refer to the [Quick Start → Install System](./getting-started/install-system/) tutorial for installation.

- **Phoenix System Image**: Does not include a partition table and requires the Phoenix tool to flash the system image.

If using a Phoenix system image, refer to the tutorials [Install System to MicroSD Card](./low-level-dev/install-system/sd-system) and [Low-Level Development → Install System in FEL Mode](./low-level-dev/install-system/fel-install-system/) based on your system boot medium.

First, confirm whether the installed system image is correct. If the system image is correct, you can use serial debugging to obtain system boot logs and troubleshoot based on the log information.

## Remote Access Issues

### Unable to SSH

The factory system image enables the SSH service by default. Generally, you only need to ensure that the Cubie A7A and the PC are on the same local network to access it via SSH.

**Troubleshooting Steps**:

1. Check whether the Cubie A7A is connected to the network and whether the IP address is correct: Use the `ip a` command to view detailed network connection information.
2. Check whether the Cubie A7A and the PC are on the same local network: Use the `ping` command to test if their IP addresses can communicate.
3. Check whether the SSH service is running: Use the `sudo systemctl status ssh` command to check the SSH service status.

### Unable to Use VNC

VNC remote access requires manual configuration of the VNC server. If configured according to the tutorial, the VNC server will automatically shut down after each reboot or shutdown.

**Troubleshooting Steps**:

1. Complete the VNC remote configuration as per the tutorial.
2. Ensure that SSH remote access is functioning correctly.
3. Check whether the VNC server is running: Use the `vncserver -list` command to check the VNC server status.
4. Use `ip:5901` for VNC remote access, where `ip` is the IP address of the Cubie A7A.

## Serial Port Issues

### Failed to Open Serial Port

If you encounter the error `Error: Permission denied, cannot open /dev/ttyUSB0` when opening the serial port:

Follow these steps to troubleshoot:

1. Check whether the serial device is properly connected.

2. Check the serial device permissions.

For example, on a Linux system, if the serial device lacks sufficient permissions, run the following command in the terminal to grant all users access to the serial device:

<NewCodeBlock tip="Linux@host$" type="host">

```
sudo chmod 777 /dev/ttyUSB0
```

</NewCodeBlock>

3. Check whether the serial device is occupied by another program.

## Network Bandwidth Testing

### Port Occupied

If the system displays the error `iperf3: error - unable to start listener for connections: Address already in use`, it means the iperf3 process is occupying port 5201.

**Solution**:

1. Check the iperf3 process:

<NewCodeBlock tip="Linux@host$" type="device">

```
ps -ef | grep iperf3
```

</NewCodeBlock>

2. Terminate the iperf3 process: Replace `<PID>` with the PID of the iperf3 process.

<NewCodeBlock tip="Linux@host$" type="device">

```
sudo kill <PID>
```

</NewCodeBlock>

## KDE Discover cannot be used

KDE Discover uses OpenGL rendering by default, which is not supported by the current GPU driver, causing KDE Discover to be unusable. The solution is to use the apt command-line tool to install packages directly.

<NewCodeBlock tip="Linux@host$" type="device">
```
sudo apt search <package_name>
sudo apt install <package_name>
```
</NewCodeBlock>

apt can also perform fuzzy search for software packages. When using the apt install command, you can use the tab key to automatically complete the software package name.

For example, to install VLC media player:

<NewCodeBlock tip="Linux@host$" type="device">
```
sudo apt search vlc
sudo apt install vlc
```
</NewCodeBlock>
