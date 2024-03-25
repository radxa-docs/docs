---
sidebar_position: 20
---

# Using Radxa Wireless Module A8 on ROCK 5A

## Installation Guide

As shown in the figure, first install the two antennas.

**Note: Please refer to the picture for the installation positions of the square antenna and the rectangular antenna: the square antenna is installed on the rightmost interface of the wireless module A8, and the rectangular antenna is installed on the other interface.**

![Wireless Module A8](/img/accessories/wireless-a8-1.webp)

Connect the wireless module A8 to the M2.E port of ROCK 5A.

![Wireless Module A8](/img/accessories/wireless-a8-2.webp)

**Note: It is best to turn off the power during installation.**

## Configuration

- After starting the computer, open the terminal "Ctrl+Alt+T" to check whether the wireless module A8 is recognized, enter the following command and press the Enter key:

```bash
ip addr show
```

This will display information about all the network interfaces in your system.

- Look for the wireless card: In the command output, look for lines starting with "wlan." These indicate that a wireless card has been recognized as a network interface.  
  For example, you might see a line like this:

```bash
wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
```

Here, "wlan0" is the interface name of the wireless card.

If you see the interface name of the wireless card, it means that it has been successfully recognized. You can use this interface name for further configuration and management of the wireless network connection. If you don't see the interface name of the wireless card, you may need to ensure that the wireless module is properly inserted and the drivers are correctly installed.

## Settings

### Wifi Settings

- After starting the computer, open the terminal "Ctrl+Alt+T" to check whether the wireless module A8 is recognized, enter the following command and press the Enter key:

```bash
ip addr show
```

This will display information about all the network interfaces in your system.

- Look for the wireless card: In the command output, look for lines starting with "wlan." These indicate that a wireless card has been recognized as a network interface.  
  For example, you might see a line like this:

```bash
wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
```

Here, "wlan0" is the interface name of the wireless card.

If you see the interface name of the wireless card, it means that it has been successfully recognized. You can use this interface name for further configuration and management of the wireless network connection. If you don't see the interface name of the wireless card, you may need to ensure that the wireless module is properly inserted and the drivers are correctly installed.

- Connect wifi

  - Set ROOT user mode

  ```
  sudo su
  ```

  - Open wifi

  ```
  nmcli r wifi on
  ```

  - Scan Wifi

  ```
  nmcli dev wifi
  ```

  - Connect network

  ```
  nmcli dev wifi connect "wifi_name" password "wifi_password"
  ```

For network settings and IP settings, you can also refer to [Network Settings](../radxa-os/network).

### Bluetooth Settings

- Test the bluetooth module and check the bluetooth device.

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

Configure the bluetooth device:

```bash
radxa@rock-5a:~$ bluetoothctl
Agent registered
[bluetooth]# default-agent
Default agent request successful
```

Turn on Bluetooth: Enter the following command and press Enter to ensure that Bluetooth is turned on:

```bash
power on
```

Enter the following command and press Enter to start Bluetooth scanning and search for available Bluetooth devices:

```bash
scan on
```

Wait for a while to let bluetoothctl scan and list nearby available Bluetooth devices. The scan results will display the MAC addresses and names of each device.

Find the MAC address of the Bluetooth device you want to connect to and take note of it.

Enter the following command, replacing XX:XX:XX:XX:XX:XX with the actual MAC address of the device you want to connect to, and press Enter:

```bash
connect xx:xx:xx:xx:xx
```
