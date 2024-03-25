---
sidebar_position: 6
---

# Radxa Wireless Module A8

Radxa Wireless Module A8 is a standard M.2 2230 Wireless Module based on Realtek RTL8852BE, a highly integrated single-chip that support 2-stream Wi-Fi 6 (802.11ax) solutions with multi-user MIMO (Multiple-Input, Multiple-Output) with Wireless LAN (WLAN) PCI Express network interface controller with integrated Bluetooth 5 USB interface controller. It combines a WLAN MAC, a 2T2R capable WLAN baseband, and RF in a single chip.

![Radxa Wireless Module A8](/img/accessories/a8-module-01.webp)

## Compatibility

- Radxa ROCK 3A
- Radxa ROCK 3B
- Radxa ROCK 5B
- Radxa ROCK 5A

## Tutorial

### Installation

For products that support the A8 module, Radxa has integrated the corresponding driver in the official image. You can directly insert the wireless module into the M.2 E Key connector to use it.

Take the use under the official Debian system of ROCK 5B as an example, the installation is as shown in the figure:

![Radxa Wireless Module A8](/img/accessories/a8-module-02.webp)

### Wi-Fi usage

1. After entering the system, open the terminal

2. Enter the following command to enable Wi-Fi

```bash
sudo nmcli r wifi on
```

:::tip
When you use the sudo command for the first time, you need to enter the password of the login account.
:::

3. Enter the following command to scan Wi-Fi

```bash
sudo nmcli dev wifi
```

4. Enter the following command to connect to the Wi-Fi network

```bash
sudo nmcli dev wifi connect "wifi_name" password "wifi_password"
```

Among them, `wifi_name` is the name (SSID) of the Wi-Fi you want to connect to, and `wifi_password` is the password of the Wi-Fi.

In addition, you can also perform visual operations through the WiFi control provided by the Linux desktop.

### Bluetooth usage

1. Test the Bluetooth module and check the Bluetooth device.

```bash
sudo systemctl status bluetooth
```

2. Run the Bluetooth device.

```bash
sudo systemctl start bluetooth
```

3. Detect Bluetooth devices

```bash
sudo hciconfig

hci0: Type: Primary Bus: UART
        BD Address: 10:2C:6B:49:D5:53 ACL MTU: 1021:8 SCO MTU: 64:1
        UP RUNNING
        RX bytes:850 acl:0 sco:0 events:58 errors:0
        TX bytes:2814 acl:0 sco:0 commands:58 errors:0
```

4. Test Bluetooth function

   To connect a Bluetooth speaker:

   First install `pulseaudio`

   ```bash
   sudo apt-get install -y pulseaudio-module-bluetooth pulseaudio
   ```

   Run `pulseaudio`

   ```bash
   sudo pulseaudio --start
   ```

   Connect using `pulseaudio`

   ```bash
   sudo bluetoothctl

   [bluetooth]#default-agent
   [bluetooth]# power on
   [bluetooth]# scan on
   [bluetooth]# trust 41:42:1A:8D:A9:65 #BT-280
   [bluetooth]# pair 41:42:1A:8D:A9:65
   [bluetooth]# connect 41:42:1A:8D:A9:65
   ```

## Hardware

### Features

- IEEE 802.11a/b/g/n/ac/ax compatible WLAN
- Support Bluetooth 5 system (BT 5.2 Logo Compliant)
- Complete 802.11n MIMO solution for 2.4GHz and 5Ghz band
- Maximum PHY data rate up to 286.8 Mbps using 20MHz bandwidth, 573.5Mbps using 40MHz bandwidth, and 1201Mbps using 80MHz bandwidth
- Backward compatible with 802.11a/b/g devices while operating at 802.11n data rates
- Backward compatible with 802.11a/n/ac devices while operating at 802.11ax data rates
- Compliance with Windows operating system host-implemented FIPS 140-2 security requirements
- Support 20/40/80MHz 5GHz
- supports WLAN-Bluetooth coexistence
- supports low power Bluetooth
- Compatible with Bluetooth v2.1+EDR

### Block Diagram

![A8 design](/img/accessories/wireless-a8-block-diagram.webp)

### Specifications

| Features              | Description                                                                                      |
| --------------------- | ------------------------------------------------------------------------------------------------ |
| Name                  | Radxa Wireless Module A8                                                                         |
| Product Description   | IEEE 802.11a/b/g/n/ac/ax Wireless LAN 2T2R and Bluetooth 5.2 Combo Module (M.2 2230)             |
| Chipset               | RTL8852BE                                                                                        |
| Host Interface        | Wi-Fi: PCIe BT: USB                                                                              |
| Dimension             | 22mm x 30mm x 2.25mm                                                                             |
| Form Factor           | M.2 2230 E Key                                                                                   |
| Antenna               | I-PEX MHF4 Connector Receptacle (20449) ANT1(Main): WiFi/Bluetooth  TX/RX ANT2(AUX): WiFi  TX/RX |
| Operating Temperature | 0 to +70°C                                                                                       |
| Weight                | 3g                                                                                               |

### Dimensions

![A8 2D](/img/accessories/radxa-wireless-module-2d.webp)
