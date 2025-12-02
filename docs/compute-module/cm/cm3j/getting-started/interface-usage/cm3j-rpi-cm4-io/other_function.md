---
sidebar_position: 12
---

# 功能引脚

## 使用介绍

### nRPIBOOT

短接下图所示引脚可以实现 recovery 功能，进入 loader 下载模式。

![J2](/img/cm3j/j2.webp)

### BT_nDis / WL_nDis

![J3](/img/cm3j/j3.webp)

在系统启动前将 BT_nDis 引脚接地，可以禁用蓝牙功能。

在系统启动前将 WL_nDis 引脚接地，可以禁用 WIFI 功能。

### GLOBAL_EN / RUN_PG

![J1](/img/cm3j/j1.webp)

将 GLOBAL_EN 接地，可实现关机的功能。

将 RUN_PG 接地，系统会实现重启功能。
