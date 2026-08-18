---
sidebar_position: 1
---

# 射频天线

Radxa ZERO 3W 板载 Radxa D8 / AP6212 WiFi&BT 模块，有一个板载天线和一个外接天线座子，默认使用板载天线, 可以通过 overlay 自由选择使用板载天线或外接天线。

![zero3w antenna1 ](/img/zero/zero3/zero3w-antenna1.webp)

- **1: 板载天线**
- **2: 外接天线**

## 外接天线接口规格

| 项目 | 规格 |
| ---- | ---- |
| 接口类型 | U.FL（兼容 IPEX MHF1 / 1 代 IPEX） |
| 特性阻抗 | 50Ω |
| 适配天线 | U.FL / IPEX MHF1 接口天线（WiFi 2.4GHz / 5GHz 双频） |

## 使用外接天线

如果你需要使用外接天线，需要开启外接天线 overlay，使用 rsetup [设备树配置](../os-config/rsetup#overlays)。

```bash
sudo rsetup
```

![zero3w antenna2 ](/img/zero/zero3/zero3w-antenna2.webp)
