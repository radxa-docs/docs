---
sidebar_position: 20
---

# ROCK 5A使用Radxa Wireless Module A8教程

## 安装教程

- 如图所示，先安装两根天线。

**注意：正方形天线和长方形天线的安装位置请参考图片：正方形天线安装在无线模块A8的最右边接口，长方形则安装在另一个接口。**

![Wireless Module A8](/img/accessories/wireless-a8-1.webp)

- 将wireless module A8连接到ROCK 5A的M2.E口。

![Wireless Module A8](/img/accessories/wireless-a8-2.webp)

**注意：安装时最好关闭电源。**

## 设置

### Wifi设置

- 启动电脑后，打开终端“Ctrl+Alt+T”检查无线模块A8是否被识别出，输入以下命令并按下回车键：

```bash
ip addr show
```

这将显示系统中所有网络接口的信息。

- 查找无线网卡：在命令输出中，找到以 "wlan" 开头的行，这表示无线网卡被识别为一个网络接口。
  例如，您可能会看到像这样的行：

```bash
wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
```

这里的 "wlan0" 就是无线网卡的接口名称。

如果您看到无线网卡的接口名称，说明它已被成功识别。您可以使用这个接口名称进行进一步的配置和管理无线网络连接。如果您没有看到无线网卡的接口名称，可能需要确保无线模块已正确插入，并且驱动程序正确安装。

- 连接 Wifi

  - 先进入到ROOT用户模式

  ```
  sudo su
  ```

  - 打开 Wifi

  ```
  nmcli r wifi on
  ```

  - 扫描 Wifi

  ```
  nmcli dev wifi
  ```

  - 连接网络

  ```
  nmcli dev wifi connect "wifi_name" password "wifi_password"
  ```

关于网络设置以及IP设置，你也可以参考[网络设置](../radxa-os/network)。

### 蓝牙设置

- 测试蓝牙模块情况，检查蓝牙设备。

```bash
radxa@rock-5a:~$ systemctl status bluetooth
● bluetooth.service - Bluetooth service
     Loaded: loaded (/lib/systemd/system/bluetooth.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2023-06-12 07:48:19 UTC; 1h 21min ago
       Docs: man:bluetoothd(8)
   Main PID: 511 (bluetoothd)
     Status: "Running"
      Tasks: 1 (limit: 9502)
     Memory: 4.7M
        CPU: 2.971s
     CGroup: /system.slice/bluetooth.service
             └─511 /usr/libexec/bluetooth/bluetoothd

radxa@rock-5a:~$ hciconfig
hci0:   Type: Primary  Bus: USB
        BD Address: 2C:05:47:79:75:2F  ACL MTU: 1021:6  SCO MTU: 255:12
        UP RUNNING INQUIRY
        RX bytes:599069 acl:0 sco:0 events:6208 errors:0
        TX bytes:9267 acl:0 sco:0 commands:281 errors:0
```

进入蓝牙设备控制：

```bash
radxa@rock-5a:~$ bluetoothctl
Agent registered
[bluetooth]# default-agent
Default agent request successful
```

打开蓝牙：输入以下命令并按下回车键，以确保蓝牙处于打开状态：

```bash
power on
```

输入以下命令并按下回车键开始蓝牙扫描，以搜索可用的蓝牙设备：

```bash
scan on
```

等待一段时间，让bluetoothctl扫描并列出附近可用的蓝牙设备。扫描结果将显示每个设备的MAC地址和名称。

找到要连接的蓝牙设备的MAC地址，并记下它。

输入以下命令并将MAC地址替换为您要连接的设备的实际MAC地址，然后按下回车键：

```bash
connect xx:xx:xx:xx:xx
```
