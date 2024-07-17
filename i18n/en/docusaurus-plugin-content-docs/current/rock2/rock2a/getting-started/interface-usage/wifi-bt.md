---
sidebar_position: 3
---

# WIFI & Bluetooth

## Using Wi-Fi

- First, enter ROOT user mode.

```
sudo su
```

- Turn on Wi-Fi.

```
nmcli r wifi on
```

- Scan for Wi-Fi networks.

```
nmcli dev wifi
```

- Connect to the Wi-Fi network.

```
nmcli dev wifi connect "wifi_name" password "wifi_password"
```

## Using Bluetooth

- Test the status of the Bluetooth module and check for Bluetooth devices.

```
# systemctl status bluetooth
```

- Run the Bluetooth devices.

```
# systemctl start bluetooth
```

- Detect Bluetooth Devices

```
# hciconfig
hci0:   Type: Primary  Bus: USB
        BD Address: 88:00:01:00:00:A2  ACL MTU: 1021:9  SCO MTU: 255:4
        UP RUNNING
        RX bytes:789 acl:0 sco:0 events:62 errors:0
        TX bytes:3736 acl:0 sco:0 commands:62 errors:0
```

- Testing: Connect to a Bluetooth Speaker, First, install pulseaudio:

```
# apt-get install -y pulseaudio-module-bluetooth pulseaudio
```

- Run pulseaudio

```
# pulseaudio --start
```

- Using pulseaudio to Connect

```
# bluetoothctl
[bluetooth]# default-agent
[bluetooth]# power on
[bluetooth]# scan on
[bluetooth]# trust 41:42:1A:8D:A9:65       #BT-280
[bluetooth]# pair 41:42:1A:8D:A9:65
[bluetooth]# connect 41:42:1A:8D:A9:65
```

- Now you can enjoy listening to music.
