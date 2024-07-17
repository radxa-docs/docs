---
sidebar_position: 3
---

# WIFI & 蓝牙

## WIFI 的使用

- 首先进入ROOT用户模式。

```
sudo su
```

- 打开WIFI

```
nmcli r wifi on
```

- 扫描WIFI

```
nmcli dev wifi
```

- 连接wifi网络

```
nmcli dev wifi connect "wifi_name" password "wifi_password"
```

## 蓝牙的使用

- 测试蓝牙模块的状态并检查蓝牙设备。

```
# systemctl status bluetooth
```

- 运行蓝牙设备。

```
# systemctl start bluetooth
```

- 检测蓝牙设备

```
# hciconfig
hci0:   Type: Primary  Bus: USB
        BD Address: 88:00:01:00:00:A2  ACL MTU: 1021:9  SCO MTU: 255:4
        UP RUNNING
        RX bytes:789 acl:0 sco:0 events:62 errors:0
        TX bytes:3736 acl:0 sco:0 commands:62 errors:0
```

- 测试：连接蓝牙音箱，首先安装 pulseaudio

```
# apt-get install -y pulseaudio-module-bluetooth pulseaudio
```

- 运行 pulseaudio

```
# pulseaudio --start
```

- 使用 pulseaudio 连接

```
# bluetoothctl
[bluetooth]# default-agent
[bluetooth]# power on
[bluetooth]# scan on
[bluetooth]# trust 41:42:1A:8D:A9:65       #BT-280
[bluetooth]# pair 41:42:1A:8D:A9:65
[bluetooth]# connect 41:42:1A:8D:A9:65
```

- 现在您可以听音乐了。
