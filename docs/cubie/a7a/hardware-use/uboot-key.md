---
sidebar_position: 4
---

# UBOOT 按键

瑞莎 Cubie A7A 板载 UBOOT 按键，用于进入 FEL 模式。

:::tip
UBOOT 按键具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 使用指南

FEL 是 Allwinner（全志）芯片中的一种低级启动和刷机模式，主要用于设备无法从常规存储介质启动时的系统恢复或调试。

### 进入 FEL 模式

主板上电前，按住 Cubie A7A 的 UBOOT 按键，主板上电后，松开 UBOOT 按键就可以进入 FEL 模式。

① : 按住 Cubie A7A 的 UBOOT 按键

② : 使用 USB Type A to Type C 数据线连接 Cubie A7A 的 USB Type C 接口和 PC 的 USB Type A 接口

③ : 松开 Cubie A7A 的 UBOOT 按键

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-write-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 安装系统镜像

Cubie A7A 进入 FEL 模式后，您可以在该模式下给 eMMC / UFS 模块安装系统镜像。

安装系统镜像可以参考：

- [安装系统到 eMMC 模块](../low-level-dev/fel-install-system/emmc_system)
- [安装系统到 UFS 模块](../low-level-dev/fel-install-system/ufs_system)
