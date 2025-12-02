---
sidebar_position: 2
---

# WIFI & BT

## WIFI & BT 支持模块列表

| NO. | Model                  | Chip        | WiFi          | BT  | WIFI Throughput                       | Remark |
| --- | ---------------------- | ----------- | ------------- | --- | ------------------------------------- | ------ |
| 1   | Radxa wireless A8      | RTL8852BE   | 2.4G&5G&WIFI6 | 5.0 | up:600Mbits/sec down:900 Mbits/sec    |        |
| 2   | Intel AX210 (PCIE+USB) | Intel AX210 | WiFi 6        | 5.2 | up: 859 Mbits/sec down: 813 Mbits/sec |        |

- Radxa NX5 IO 没有板载WiFi/BT模块，需要外接模块。以上是支持并测试过的 WITI/BT 卡。
- 这里演示的 M.2 无线模块是： Radxa 无线模块 A8。

[Radxa 无线模块A8](/zh/img/accessories/network/a8-module-01.webp)

- 安装如图所示：

[Radxa 无线模块A8](/zh/img/accessories/network/a8-module-02.webp)

## WIFI 使用

1. 首先进入ROOT用户模式。

```
sudo su
```

2. 打开WIFI

```
nmcli r wifi on
```

3. 扫描WIFI

```
nmcli dev wifi
```

4. 连接wifi网络

```
nmcli dev wifi connect "wifi_name" password "wifi_password"
```
