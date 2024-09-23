---
sidebar_position: 5
---

# Yocto User Guide

## Default user name add password

The default user name is `root` without password.

## Access the device

### Option one: Use HDMI monitor, USB keyboard and mouse

You can view the Desktop on the HDMI monitor.

### Option two: SSH

SSH service is enabled by default.
You can find the IP from the router management windows or [angryip](https://angryip.org/).

<pre>
$ ping ip-of-device
$ ssh root@ip-of-device
</pre>

### Option three: USB Access (adb)

Yocto enable adbd service by default.
For hardware connection, A USB-A to USB-C cable is required to connect the device with the host PC.
Also need to install adb tool on host PC.

Check adb device on host PC.

<pre>
adb devices
</pre>

Access the device on host PC.

<pre>
adb shell
</pre>

### Option four: Serial port

Please refer to [NIO 12L serial port usage](/nio/nio12l/low-level-dev/serial).

## Storage

### UFS

User `lsblk` to check UFS device. `/dev/sda`, `/dev/sdb` and `/dev/sdc` belong to UFS device files.

<pre>
NAME    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda       8:0    0     4M  0 disk
sdb       8:16   0     4M  0 disk
sdc       8:32   0 119.2G  0 disk
|-sdc1    8:33   0     4M  0 part
|-sdc2    8:34   0     4M  0 part
|-sdc3    8:35   0    32M  0 part
|-sdc4    8:36   0    32M  0 part
|-sdc5    8:37   0   512K  0 part
|-sdc6    8:38   0     1M  0 part
|-sdc7    8:39   0    32M  0 part
|-sdc8    8:40   0   100M  0 part
|-sdc9    8:41   0    32M  0 part
`-sdc10   8:42   0 118.9G  0 part /
</pre>

### MicroSD Card

Use `lsblk | grep mmc` to check MicroSD card. For example, here `/dev/mmcblk1`。

<pre>
mmcblk1     179:0    0  58.9G  0 disk
|-mmcblk1p1 179:1    0     1G  0 part
`-mmcblk1p2 179:2    0  57.9G  0 part
</pre>

## RAM

Use `free -h` to check the capacity.

<pre>
               total        used        free      shared  buff/cache   available
Mem:           7.6Gi       508Mi       6.8Gi        51Mi       386Mi       6.8Gi
Swap:             0B          0B          0B

</pre>

## Display

### HDMI

The Yocto system enables HDMI by default. Connect an HDMI monitor to display the desktop. The maximum supported resolution is 4K@P60.

### Type-C Display

The Yocto system enables Type-C monitors by default. Connect a Type-C monitor, or use a Type-C to HDMI hub, and then connect to an HDMI monitor to display the desktop.
The maximum supported resolution is 4K@P60.

## USB

NIO 12L has 4 Type-A USB 3.0 ports. They are only in host mode, used to connect USB mouse, keyboard, U disk and other devices.

The Type-C port has USB host/device and display functions. The system switches modes on its own depending on the device plugged in.
For example, when a Type-C USB flash drive is connected and the system sets the Type-C port to host mode, the USB flash drive will be recognized by the system.
When a Type-C display is connected, the system will output the display to the display.
When connected to a Type-C hub (including HDMI, USB3.0, RJ45), the system will provide USB host function, network, and display functions.
When using a Type-C to Type-A cable to connect the NIO 12L to the host PC, the system will provide usb adb and usb net functions.

## Network Connection

There are two methods for network connection. One is Ethernet and the other is WIFI.

### Ethernet Connection

You can use a network cable (one end connected to the external network port or route) to connect your NIO 12L to the network. The NIO 12L will automatically configure the network for your surfing on the Internet.

Test Ethernet:

- Check whether the Ethernet is normal by command, ifconfig, which would show us a network card and the Ethernet IP address. Also, use tool `ping` to connect to a normal domain.

<pre>
ifconfig
ping www.baidu.com
</pre>

- Use `iperf3` to test the performance.

### Wi-Fi

When there is not a network cable for your NIO 12L, the WIFI connection is another good choice.
NIO 12L supports 2.4G/5G/6G Wi-Fi wireless network.

Test Wi-Fi:

- Open Wi-Fi

<pre>
nmcli radio wifi on
</pre>

- Scan AP

<pre>
nmcli dev wifi
</pre>

- Connect to AP

<pre>
nmcli dev wifi connect "wifi_name" password "wifi_password"
</pre>

- Use `iperf3` to test the performance.

## Bluetooth

- Check Bluetooth device

<pre>
hciconfig -a
</pre>

- Set up Bluetooth

<pre>
hciconfig hci0 up
</pre>

- Make Bluetooth discoverable

<pre>
hciconfig hci0 piscan
</pre>

- Scan remote Bluetooth device

<pre>
hcitool lescan
</pre>

## Audio

### HDMI Audio

Run command

<pre>
aplay -D hdmi_dp_out ./test.wav
</pre>

### Headphone

Playback command

<pre>
amixer -c mt8395evk cset name='PGA1 Volume' 3
arecord -D jack_mic -r 48000 -f S32_LE sample.wav
</pre>

Record command

<pre>
aplay -D jack_speaker ./sample.wav
</pre>

## Camera

### Use USB camear

Find v4l2 设备节点 via command `ls -l /sys/class/video4linux`. There are `/dev/vidoe6` here。

<pre>
ls -l /sys/class/video4linux
total 0
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video0 -> ../../devices/platform/soc/14001000.mdp3-rdma0/video4linux/video0
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video1 -> ../../devices/platform/soc/1a030000.jpgenc/video4linux/video1
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video2 -> ../../devices/platform/soc/1a040000.jpgdec/video4linux/video2
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video3 -> ../../devices/platform/soc/18000000.vdec/video4linux/video3
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video4 -> ../../devices/platform/soc/1a020000.venc/video4linux/video4
lrwxrwxrwx 1 root root 0 Jan  1 02:44 video5 -> ../../devices/platform/soc/14001000.mdp3-rdma0/video4linux/video5
lrwxrwxrwx 1 root root 0 Jan  1 02:50 video6 -> ../../devices/platform/soc/112f0000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb5/5-1/5-1.4/5-1.4:1.0/video4linux/video6
lrwxrwxrwx 1 root root 0 Jan  1 02:50 video7 -> ../../devices/platform/soc/112f0000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb5/5-1/5-1.4/5-1.4:1.0/video4linux/video7
</pre>

Capture Preview

<pre>
gst-launch-1.0 v4l2src device=/dev/video6 io-mode=mmap ! videoconvert ! waylandsink sync=false
</pre>

## HDMI RX

Example one: Capture Preview

Use one HDMI cable to connect the host PC HDMI port to NIO 12L HDMI RX port.
And the device `/dev/video5` will show up on Yocto OS.

Run command on NIO 12L Yocto OS.

<pre>
gst-launch-1.0 -v v4l2src device=/dev/video5 ! video/x-raw,width=3840,height=2160,format=YUY2 ! queue ! fpsdisplaysink video-sink=waylandsink text-overlay=false
</pre>
