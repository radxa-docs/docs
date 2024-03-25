---
sidebar_position: 10
---

# 天线切换

ROCK S0 板载 AP6212(WiFi&BT) 模块，有一个板载天线和一个外接天线座子，可以通过 overlay 自由选择使用板载天线或外接天线。

**默认使用板载天线。**

![rocks0 antenna1 ](/img/rockpi/s0/rock-s0-antenna.webp)

- **1: 板载天线**
- **2: 外接天线**

## 切换为外接天线

如果你需要使用外接天线，需要开启外接天线的 overlay，使用 [rsetup](../os-config/rsetup)。

```bash
sudo rsetup
```

![rocks0 antenna2 ](/img/rockpi/s0/rock-s0-antenna2.webp)
