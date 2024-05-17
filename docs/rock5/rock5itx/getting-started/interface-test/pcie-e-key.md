---
sidebar_position: 17
---

# PCIe E Key

## 简介

PCIe E Key 是用于连接嵌入式设备的接口，通常用于连接存储卡、WiFi模块、蓝牙模块等设备。

## 支持的配件

### WIFI & BT 支持模块列表

| NO. | Model                                              | Chip        | WiFi          | BT  | WIFI Throughput                       | Remark                                              |
| --- | -------------------------------------------------- | ----------- | ------------- | --- | ------------------------------------- | --------------------------------------------------- |
| 1   | ROCK Pi Wireless Module A1 (SDIO+UART) --- AP6236  | BCM43436B0  | 2.4G          | 4.2 | up:23.5 Mbits/sec down:40.4 Mbits/sec |                                                     |
| 2   | ROCK Pi Wireless Module A2 (SDIO+UART) --- AP6256  | BCM43456    | 2.4G&5G       | 5.0 | up:196 Mbits/sec down: 187 Mbits/sec  |                                                     |
| 3   | ROCK Pi Wireless Module A3 (SDIO+UART) --- AP6398S | BCM43598    | 2.4G&5G       | 5.0 | up:336 Mbits/sec down: 315 Mbits/sec  |                                                     |
| 4   | Radxa wireless A8                                  | RTL8852BE   | 2.4G&5G&WIFI6 | 5.0 | up:600Mbits/sec down:900 Mbits/sec    |                                                     |
| 5   | Intel 0MHK36 (PCIE+USB)                            | Intel 3165  | 2.4G&5G       | 4.2 | up:283 Mbits/sec down: 334 Mbits/sec  |                                                     |
| 6   | Intel 7265NGW (PCIE+USB)                           | Intel 7265  | 2.4G&5G       | 4.2 | up:363 Mbits/sec down: 619 Mbits/sec  |                                                     |
| 7   | Intel AX210 (PCIE+USB)                             | Intel AX210 | WiFi 6        | 5.2 | up: 859 Mbits/sec down: 813 Mbits/sec | Only WIFI is supported currently, BT is not working |

- ROCK 5 ITX 没有板载WiFi/BT模块，需要外接模块。以上是支持并测试过的 WITI/BT 卡。
- 这里演示的 M.2 无线模块是： Radxa 无线模块 A8。

#### WIFI 的使用

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

#### 蓝牙的使用

- 使用 Radxa 无线 A8 模块时，必须添加以下黑名单才能使 BT 正常工作。

```
root@rock-5-itx:~# cat /etc/modprobe.d/blacklist.conf
blacklist pgdrv
blacklist btusb
blacklist btrtl
blacklist btbcm
blacklist btintel

root@rock-5-itx:~# reboot
```

- Radxa APT 包括用于Broadcom无线模块的broadcom-wifibt-firmware软件包和用于Intel无线模块的intel-wifibt-firmware软件包。需要下载相应的软件包。

```
root@rock-5-itx:~# apt-get update -y
root@rock-5-itx:~# apt-get install -y broadcom-wifibt-firmware intel-wifibt-firmware
```

- 测试蓝牙模块的状态并检查蓝牙设备。

```
root@rock-5-itx:~# systemctl status bluetooth
```

- 运行蓝牙设备。

```
root@rock-5-itx:~# systemctl start bluetooth
```

- 检测蓝牙设备

```
root@rock-5-itx:~# hciconfig
hci0:   Type: Primary Bus: UART
       BD Address: 10:2C:6B:49:D5:53 ACL MTU: 1021:8 SCO MTU: 64:1
       UP RUNNING
       RX bytes:850 acl:0 sco:0 events:58 errors:0
       TX bytes:2814 acl:0 sco:0 commands:58 errors:0
```

- 测试：连接蓝牙音箱，首先安装pulseaudio

```
root@rock-5-itx:~# apt-get install -y pulseaudio-module-bluetooth pulseaudio
```

- 运行 pulseaudio

```
root@rock-5-itx:~# pulseaudio --start
```

- 使用 pulseaudio 连接

```
root@rock-5-itx:~# bluetoothctl
[bluetooth]# default-agent
[bluetooth]# power on
[bluetooth]# scan on
[bluetooth]# trust 41:42:1A:8D:A9:65       #BT-280
[bluetooth]# pair 41:42:1A:8D:A9:65
[bluetooth]# connect 41:42:1A:8D:A9:65
```

- 现在您可以听音乐了。

### 瑞莎 M.2 E 型转 SATA 板

![M.2 E key to SATA Breakout Board](/img/accessories/m2e-to-sata-1.webp)

- 该拓展版直接插在M2.E接口上，然后将SATA设备连接到扩展板上即可。
