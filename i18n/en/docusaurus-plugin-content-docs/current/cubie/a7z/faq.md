---
sidebar_position: 105
---

# Frequently Asked Questions

## System Issues

### System Fails to Boot

We provide two types of system images:

- **Standard System Image**: Includes a partition table and can be directly installed to the boot media.

- **Phoenix System Image**: Does not include a partition table and requires the Phoenix tool for flashing.

First, verify that the correct system image is being used. If the system image is correct, you can check the system boot logs via serial debugging for further troubleshooting.

## Remote Access Issues

### SSH Connection Failure

The factory system image has SSH service enabled by default. Generally, you only need to ensure that both the Cubie A7Z and your PC are on the same local network to establish an SSH connection.

Troubleshooting steps:

1. Check if the Cubie A7Z is connected to the network and has a valid IP address by running `ip a` to view network connection details.
2. Verify that both the Cubie A7Z and your PC are on the same local network by pinging each other's IP addresses.
3. Check if the SSH service is running by executing `sudo systemctl status ssh`.

### VNC Connection Issues

VNC remote access requires manual configuration of the VNC server. If configured according to the tutorial, the VNC server will automatically shut down after each reboot or shutdown.

Troubleshooting steps:

1. Complete the VNC remote configuration as per the tutorial.
2. Ensure that SSH remote access is working properly.
3. Check if the VNC server is running by using the command `vncserver -list`.
4. Connect via VNC using `ip:5901`, where `ip` is the IP address of your Cubie A7Z.

## Serial Port Issues

### Failed to Open Serial Port

If you encounter the error `Error: Permission denied, cannot open /dev/ttyUSB0` when trying to access the serial port, follow these troubleshooting steps:

1. Check if the serial device is properly connected.

2. Verify serial device permissions:

For Linux systems, if the serial device has insufficient permissions, run the following command to grant all users access to the serial device:

<NewCodeBlock tip="Linux@host$" type="host">

```bash
sudo chmod 777 /dev/ttyUSB0
```

</NewCodeBlock>

3. Check if the serial device is being used by another program.

## Network Bandwidth Testing

### Port in Use

If you see the error `iperf3: error - unable to start listener for connections: Address already in use`, it means that port 5201 is already in use by another iperf3 process.

Solution:

1. Check for running iperf3 processes:

<NewCodeBlock tip="Linux@host$" type="device">

```bash
ps -ef | grep iperf3
```

</NewCodeBlock>

2. Terminate the iperf3 process by replacing `<PID>` with the actual process ID:

<NewCodeBlock tip="Linux@host$" type="device">

```bash
sudo kill <PID>
```

</NewCodeBlock>

## KDE Discover cannot be used

KDE Discover uses OpenGL rendering by default, which is not supported by the current GPU driver, causing KDE Discover to be unusable. The solution is to use the apt command-line tool to install packages directly.

<NewCodeBlock tip="Linux@host$" type="device">
```bash
sudo apt search <package_name>
sudo apt install <package_name>
```
</NewCodeBlock>

apt can also perform fuzzy search for software packages. When using the apt install command, you can use the tab key to automatically complete the software package name.

For example, to install VLC media player:

<NewCodeBlock tip="Linux@host$" type="device">
```bash
sudo apt search vlc
sudo apt install vlc
```
</NewCodeBlock>

## System Installation and Software Update Issues

### System Hangs During Software Installation or initramfs Update

On the Cubie A7Z, if the system hangs during software installation or initramfs update with the following errors:
- `FDT_ERR_BADMAGIC` device tree errors
- SD card timing errors (`RTO` - Response Timeout)
- System freezes or becomes unresponsive

#### Troubleshooting Steps:

1. **Check SD Card Quality and Compatibility**:
   - Use genuine SD cards from reputable brands (such as Samsung EVO, SanDisk Extreme, Kingston Canvas)
   - Recommended to use U3/A2 speed class SD cards for better sustained performance
   - Avoid SD cards with extremely high theoretical speeds (300MB/s+) as they may have compatibility issues with Allwinner platforms
   - Ensure the SD card is not counterfeit (counterfeit cards often report incorrect specifications)

2. **Check Power Supply**:
   - Use a dedicated 5V/4A power adapter
   - Disconnect all peripherals during initramfs updates or software installation
   - Ensure the power cable is securely connected without loose contacts

3. **Software Workarounds**:
   - Manually update initramfs with lower I/O priority:
   <NewCodeBlock tip="Linux@host$" type="device">
   
   ```bash
   sudo ionice -c 3 update-initramfs -u
   ```
   
   </NewCodeBlock>
   - If the system hangs during package installation, try installing packages one at a time
   - Consider using a different system image version if an updated version is available

4. **SD Card Performance Optimization**:
   - If using extremely high-speed SD cards, try limiting the SD card speed in U-Boot
   - Check the SD card for bad blocks or filesystem errors

5. **System Log Checking**:
   - View complete system boot logs via serial port
   - Check `dmesg` output for SD/MMC controller errors
   - Examine `/var/log/syslog` for detailed error information during initramfs updates

If the above methods do not resolve the issue, it may be a kernel or driver problem. We recommend:
- Updating to the latest system image
- Reporting specific error logs to Radxa technical support
- Considering UFS storage as an alternative solution
