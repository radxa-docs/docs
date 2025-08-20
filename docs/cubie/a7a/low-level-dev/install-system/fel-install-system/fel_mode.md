---
sidebar_position: 1
---

# FEL 模式说明

FEL 是 Allwinner（全志）芯片中的一种低级启动和刷机模式，主要用于设备无法从常规存储介质启动时的系统恢复或调试。

:::tip
参考资料：[FEL 模式](https://linux-sunxi.org/FEL)
:::

## 进入 FEL 模式

主板上电前，按住 Cubie A7A 的 UBOOT 按键，主板上电后，松开 UBOOT 按键就可以进入 FEL 模式。

:::tip
UBOOT 按键具体位置可以查看 [硬件接口](../../../download) 教程的接口说明部分！
:::

① : 按住 Cubie A7A 的 UBOOT 按键

② : 使用 USB Type A to Type C 数据线连接 Cubie A7A 的 USB Type C 接口和 PC 的 USB Type A 接口

③ : 松开 Cubie A7A 的 UBOOT 按键

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-write-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 安装系统镜像

Cubie A7A 进入 FEL 模式后，您可以在该模式下直接给 eMMC / UFS 模块安装系统镜像。

安装系统镜像可以参考：

- [安装系统到 eMMC 模块](./emmc_system)
- [安装系统到 UFS 模块](./ufs_system)
