---
sidebar_position: 2
---

# WIFI & BT

## WIFI & BT Supported Modules List

| NO. | Model                    | Chip        | WiFi          | BT  | WIFI Throughput                      | Remark |
| --- | ------------------------ | ----------- | ------------- | --- | ------------------------------------ | ------ | --- | -------------------- |
| 1   | Radxa wireless A8        | RTL8852BE   | 2.4G&5G&WIFI6 | 5.0 | up:600 Mbits/sec down: 900 Mbits/sec |        |
| 2   | Intel 0MHK36 (PCIE+USB)  | Intel 3165  | 2.4G&5G       | 4.2 | up:283 Mbits/sec down: 334 Mbits/sec |        |
| 3   | Intel 7265NGW (PCIE+USB) | Intel 7265  | 2.4G&5G       | 4.2 | up:363 Mbits/sec down: 619 Mbits/sec |        | 4   | Intel AXA (PCIE+USB) |
| 4   | Intel AX210 (PCIE+USB)   | Intel AX210 | WiFi 6        | 5.2 | up:859 Mbits/sec down: 813 Mbits/sec |        |

- Radxa CM5 with Radxa CM5 IO board, there is no on-board WiFi/BT module, external module is required. The above are supported and tested WITI/BT cards.
- The M.2 wireless module demonstrated here is: Radxa Wireless Module A8.

![Radxa Wireless Module A8](/img/accessories/network/a8-module-01.webp)

- Installation is as shown in the figure:

![Radxa Wireless Module A8](/img/accessories/network/a8-module-02.webp)

## WIFI Usage

1. Switch to the ROOT user mode.

```
sudo su
```

2. Turn on the WIFI

```
nmcli r wifi on
```

3. Scan WIFI

```
nmcli dev wifi
```

4. Connect to the wifi network

```
nmcli dev wifi connect "wifi_name" password "wifi_password"
```

## Bluetooth Usage

- When using Radxa Wireless A8 module, the following blacklist must be added for BT to work properly.

```
root@radxa-cm5-io:~# cat /etc/modprobe.d/blacklist.conf
blacklist pgdrv
blacklist btusb
blacklist btrtl
blacklist btbcm
blacklist btintel

root@radxa-cm5-io:~# reboot
```

- Radxa APT includes the Broadcom-WiFIbt-Firmware package for broadcom wireless modules and the Intel-WiFIbt-Firmware package for intel wireless modules. You need to download the corresponding software package.

```
root@radxa-cm5-io:~# apt-get update -y
root@radxa-cm5-io:~# apt-get install -y broadcom-wifibt-firmware intel-wifibt-firmware
```

1. Test the status of Bluetooth module and check Bluetooth device.

```
root@radxa-cm5-io:~# systemctl status bluetooth
```

2. Run the Bluetooth device.

```
root@radxa-cm5-io:~# systemctl start bluetooth
```

3. Detect Bluetooth devices

```
root@radxa-cm5-io:~# hciconfig
hci0:   Type: Primary Bus: UART
       BD Address: 10:2C:6B:49:D5:53 ACL MTU: 1021:8 SCO MTU: 64:1
       UP RUNNING
       RX bytes:850 acl:0 sco:0 events:58 errors:0
       TX bytes:2814 acl:0 sco:0 commands:58 errors:0
```

4. Test: Connect Bluetooth speaker, first install pulseaudio

```
root@radxa-cm5-io:~# apt-get install -y pulseaudio-module-bluetooth pulseaudio
```

5. Run pulseaudio

```
root@radxa:~# pulseaudio --start
```

6. Connect using pulseaudio

```
root@radxa-cm5-io:~# bluetoothctl
[bluetooth]# default-agent
[bluetooth]# power on
[bluetooth]# scan on
[bluetooth]# trust 41:42:1A:8D:A9:65       #BT-280
[bluetooth]# pair 41:42:1A:8D:A9:65
[bluetooth]# connect 41:42:1A:8D:A9:65
```

7. Now you can listen to music.

## Where to buy

[** A8 Module Buy Now **]((https://radxa.com/products/accessories/wireless-module-a8#buy)
