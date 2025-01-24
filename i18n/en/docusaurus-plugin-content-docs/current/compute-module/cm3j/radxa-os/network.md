---
sidebar_position: 2
---

# Setting Network

## Connect WiFi

```
nmcli device wifi                                           #Scan WiFi
sudo nmcli device wifi connect <ssid> password <passwd>     #Connect WiFi
```

### Ethernet

Radxa ZERO 3E has Gigabit Ethernet on board, just connect the cable to enable internet access, use the `ip a ` command to view the ip
