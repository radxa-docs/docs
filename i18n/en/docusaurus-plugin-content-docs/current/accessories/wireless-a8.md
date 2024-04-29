---
sidebar_position: 6
---

# Radxa Wireless Module A8

The Radxa Wireless Module A8 is a standard M.2 2230 form factor wireless module using the Realtek RTL8852BE chip, supporting Wi-Fi 6 and Bluetooth 5.2.

The Radxa Wireless Module A8 is currently available in two versions.

- V1.0

![Radxa Wireless Module A8 V1.0](/img/accessories/a8-module-01.webp)

- V2.0

![Radxa Wireless Module A8 V2.0](/img/accessories/a8-module-03.webp)

## Hardware

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

### WLAN

- IEEE 802.11 a/b/g/n/ac/ax Wireless LANs
- IEEE 802.11 ac/ax supports 2T2R and is compliant with the Wave 2 technology standard for Multi-User Multiple-Input Multiple-Output (MU-MIMO) technology.
- IEEE 802.11 n supports standard MIMO (Multiple Input Multiple Output) and is available in both the 2.4 GHz and 5 GHz bands.
- Maximum PHY data rates are up to 286.8 Mbps with 20MHz bandwidth, 573.5Mbps with 40MHz bandwidth, and 1201Mbps with 80MHz bandwidth.
- Backward compatible with 802.11a/b/g devices when operating at 802.11n data rates
- Backward compatible with 802.11a/n/ac devices when operating at 802.11ax data rates
- Supports IEEE 802.11i, including WPA, WPA2, WPA3 security protocols, and also supports WAPI security protocols.
- 802.11g has a maximum data rate of 54Mbps, 802.11n has a maximum data rate of 300Mbps, and 802.11ax has a maximum data rate of 1201Mbps.

### Bluetooth

- Support Bluetooth V5.2
- Compatible with Bluetooth V2.1 + EDR
- Supports WLAN and Bluetooth coexistence
- Supports Bluetooth Low Energy (BLE) mode
- Supports all Bluetooth packet types at Basic Rate (BR) and Enhanced Data Rate (EDR)

## ID Table

| Version | WLAN VID | WLAN PID | Bluetooth VID | Bluetooth PID |
| ------- | -------- | -------- | ------------- | ------------- |
| V1.0    | 10EC     | B852     | 0BDA          | B85B          |
| V2.0    | 10EC     | B852     | 13D3          | 3570          |

## Support List

| Version                             | V1.0    | V1.0    | V1.0    | V2.0                      | V2.0      | V2.0    |
| ----------------------------------- | ------- | ------- | ------- | ------------------------- | --------- | ------- |
| 系统                                | Linux   | Android | Windows | Linux                     | Android   | Windows |
| Radxa X2L                           | Support | N/A     | Support | Supported by kernel > 6.7 | N/A       | Support |
| Radxa ROCK 3A                       | Support | Support | N/A     | Support                   | Debugging | N/A     |
| Radxa ROCK 3B                       | Support | Support | N/A     | Support                   | Debugging | N/A     |
| Radxa ROCK 5A                       | Support | Support | N/A     | Support                   | Support   | N/A     |
| Radxa ROCK 5B                       | Support | Support | N/A     | Support                   | Support   | N/A     |
| Radxa ROCK 5 ITX                    | Support | Support | N/A     | Support                   | Support   | N/A     |
| Radxa CM3I with Radxa CM3I IO Board | Support | Support | N/A     | Support                   | Support   | N/A     |
| Radxa NX5 with Radxa NX5 IO Board   | Support | Support | N/A     | Support                   | Support   | N/A     |
| Radxa CM5 with Radxa CM5 IO Board   | Support | Support | N/A     | Support                   | Support   | N/A     |

### Block Diagram

![A8 Block Diagram](/img/accessories/wireless-a8-block-diagram.webp)

### Dimensions

![A8 2D](/img/accessories/radxa-wireless-module-2d.webp)

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
