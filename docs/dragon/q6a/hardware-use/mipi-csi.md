---
sidebar_position: 10
---

# MIPI CSI 接口

瑞莎 Dragon Q6A 板载 **3 个** MIPI CSI 接口，用于连接 MIPI 摄像头：

- **1 个 4-lane MIPI CSI**：Radxa 31P / 0.3mm 间距 FPC 接口
- **2 个 2-lane MIPI CSI**：树莓派 15P / 1.0mm 间距 FPC 接口（与树莓派官方 CSI 摄像头 15P pinout 兼容）

## 接口一览

| 接口       | 通道数 | 连接器类型              | 备注                                            |
| :--------- | :----: | :---------------------- | :---------------------------------------------- |
| 4-lane CSI |   4    | Radxa 31P / 0.3mm FPC   | 适用于高分辨率摄像头（4K / 12M 577 / 13M 214）  |
| 2-lane CSI |   2    | 树莓派 15P / 1.0mm FPC  | 与树莓派官方 CSI 摄像头 15P pinout 兼容，共 2 个 |

## 兼容摄像头

- [Radxa Camera 4K](../accessories/camera-4k.md)
- [Radxa Camera 8M 219](../accessories/camera-8m-219.md)
- [Radxa Camera 12M 577](../accessories/camera-12m-577.md)
- [Radxa Camera 13M 214](../accessories/camera-13m-214.md)

## 接口引脚定义

可以参考 [资源汇总下载](../download) 页面的硬件原理图。
