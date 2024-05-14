---
sidebar_position: 6
---

# WIFI & BT

## WIFI & BT Supported Modules List

| NO. | Model                                              | Chip        | WiFi          | BT  | WIFI Throughput                       | Remark                                              |
| --- | -------------------------------------------------- | ----------- | ------------- | --- | ------------------------------------- | --------------------------------------------------- |
| 1   | ROCK Pi Wireless Module A1 (SDIO+UART) --- AP6236  | BCM43436B0  | 2.4G          | 4.2 | up:23.5 Mbits/sec down:40.4 Mbits/sec |                                                     |
| 2   | ROCK Pi Wireless Module A2 (SDIO+UART) --- AP6256  | BCM43456    | 2.4G&5G       | 5.0 | up:196 Mbits/sec down: 187 Mbits/sec  |                                                     |
| 3   | ROCK Pi Wireless Module A3 (SDIO+UART) --- AP6398S | BCM43598    | 2.4G&5G       | 5.0 | up:336 Mbits/sec down: 315 Mbits/sec  |                                                     |
| 4   | Radxa wireless A8                                  | RTL8852BE   | 2.4G&5G&WIFI6 | 5.0 | up:600Mbits/sec down:900 Mbits/sec    |                                                     |
| 5   | Intel 0MHK36 (PCIE+USB)                            | Intel 3165  | 2.4G&5G       | 4.2 | up:283 Mbits/sec down: 334 Mbits/sec  |                                                     |
| 6   | Intel 7265NGW (PCIE+USB)                           | Intel 7265  | 2.4G&5G       | 4.2 | up:363 Mbits/sec down: 619 Mbits/sec  |                                                     |
| 7   | Intel AX210 (PCIE+USB)                             | Intel AX210 | WiFi 6        | 5.2 | up: 859 Mbits/sec down: 813 Mbits/sec | Only WIFI is supported currently, BT is not working |

- The ROCK 5 ITX does not have an on-board WiFi/BT module, an external module is required. The above are supported and tested WITI/BT cards.
- The M.2 wireless module demonstrated here is: Radxa Wireless Module A8.

[Radxa Wireless Module A8](/zh/img/accessories/a8-module-01.webp)

- Install as shown in the figure:

[Radxa Wireless Module A8](/zh/img/accessories/a8-module-02.webp)

## WIFI Usage

1. First enter ROOT user mode.

```
sudo su
```

2. Turn on WIFI

```
nmcli r wifi on
```

3. Scanning WIFI

```
nmcli dev wifi
```

4. Connecting to wifi networks

```
nmcli dev wifi connect "wifi_name" password "wifi_password"
```

## Bluetooth usage

- When using the Radxa Wireless A8 module, the following blacklists must be added for BT to work properly.

```
root@rock-5-itx:~# cat /etc/modprobe.d/blacklist.conf
blacklist pgdrv
blacklist btusb
blacklist btrtl
blacklist btbcm
blacklist btintel

root@rock-5-itx:~# reboot
```

- Radxa APT includes the broadcom-wifibt-firmware package for Broadcom wireless modules and the intel-wifibt-firmware package for Intel wireless modules. The corresponding packages need to be downloaded.

```
root@rock-5-itx:~# apt-get update -y
root@rock-5-itx:~# apt-get install -y broadcom-wifibt-firmware intel-wifibt-firmware
```

1. Test the status of the Bluetooth module and check the Bluetooth device.

```
root@rock-5-itx:~# systemctl status bluetooth
```

2. Run the Bluetooth device.

```
root@rock-5-itx:~# systemctl start bluetooth
```

3. Detecting Bluetooth devices

```
root@rock-5-itx:~# hciconfig
hci0:   Type: Primary Bus: UART
       BD Address: 10:2C:6B:49:D5:53 ACL MTU: 1021:8 SCO MTU: 64:1
       UP RUNNING
       RX bytes:850 acl:0 sco:0 events:58 errors:0
       TX bytes:2814 acl:0 sco:0 commands:58 errors:0
```

4. Testing: Connecting the Bluetooth speaker, first installing pulseaudio

```
root@rock-5-itx:~# apt-get install -y pulseaudio-module-bluetooth pulseaudio
```

5. Run pulseaudio

```
root@rock-5-itx:~# pulseaudio --start
```

6. Connecting with pulseaudio

```
root@rock-5-itx:~# bluetoothctl
[bluetooth]# default-agent
[bluetooth]# power on
[bluetooth]# scan on
[bluetooth]# trust 41:42:1A:8D:A9:65       #BT-280
[bluetooth]# pair 41:42:1A:8D:A9:65
[bluetooth]# connect 41:42:1A:8D:A9:65
```

7. Now you can listen to music.
