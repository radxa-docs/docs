---
sidebar_position: 10
---

# 千兆以太网

Radxa CM3 板集成了千兆 PHY 芯片 RTL8211F。 四组差分信号 PHY1_MDI0、PHY1_MDI01、PHY1_MDI02 和 PHY1_MDI03 连接到 B2B 连接器。 在 1000BASE‑T 下运行时，将使用所有四组差分信号。 在 100BASE‑TX 下运行时，仅使用 PHY1_MDI0 和 PHY1_MDI01。

** 参考示意图 **

** 具体信号定义请参考示意图 **

![Ethernet](/img/cm3/ethernet-phy-design.webp)

Radxa CM3 IO Board 采用变压器和以太网网口一体式设计。参考提供设计如下：

![Ethernet](/img/cm3/ethernet_combo.webp)

计算模块上 MDI 信号的走线长度。

| 信号       | 长度       |
| ---------- | ---------- |
| PHY1_MDI0+ | 319.903mil |
| PHY1_MDI0- | 326.000mil |
| PHY1_MDI1+ | 249.671mil |
| PHY1_MDI1- | 277.370mil |
| PHY1_MDI2+ | 394.321mil |
| PHY1_MDI2- | 400.440mil |
| PHY1_MDI3+ | 335.779mil |
| PHY1_MDI3- | 347.346mil |

千兆以太网的 MDI（Medium Dependent Interface）差分信号一般控制差分阻抗在 100 欧姆。
