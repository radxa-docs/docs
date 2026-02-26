---
sidebar_position: 2
---

# 网络设置

## 连接WiFi

```bash
nmcli device wifi                                           #扫描WiFi
sudo nmcli device wifi connect <ssid> password <passwd>     #连接WiFi
```

## 以太网连接

Radxa ZERO 3E 板载千兆以太网，只需要将网线连接即可开启上网，使用`ip a `指令可以查看 ip。
