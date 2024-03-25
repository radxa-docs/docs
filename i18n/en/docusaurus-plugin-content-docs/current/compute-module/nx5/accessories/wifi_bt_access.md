---
sidebar_position: 2
---

# WIFI & BT

## List of WIFI & BT support modules

| NO. | Model                  | Chip        | WiFi          | BT  | WIFI Throughput                       | Remark |
| --- | ---------------------- | ----------- | ------------- | --- | ------------------------------------- | ------ |
| 1   | Radxa wireless A8      | RTL8852BE   | 2.4G&5G&WIFI6 | 5.0 | up:600Mbits/sec down:900 Mbits/sec    |        |
| 2   | Intel AX210 (PCIE+USB) | Intel AX210 | WiFi 6        | 5.2 | up: 859 Mbits/sec down: 813 Mbits/sec |        |

- Radxa NX5 IO does not have onboard WiFi/BT module and requires an external module. These are the WITI/BT cards that have been supported and tested.
- The M.2 wireless module demonstrated here is: Radxa wireless Module A8.

[Radxa wireless module A8](/zh/img/accessories/a8-module-01.webp)

- Installation is shown as follows:

[Radxa wireless module A8](/zh/img/accessories/a8-module-02.webp)

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
