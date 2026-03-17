---
sidebar_position: 5
---

# eMMC / UFS 模块二合一接口

瑞莎 Dragon Q6A 板载 eMMC / UFS 模块二合一接口，支持 eMMC 和 UFS 模块。

:::danger
严禁使用未经测试的第三方 UFS / eMMC 模块。部分第三方模块可能会导致 SBC 短路损坏，同时我们不会为此类行为导致的硬件损坏提供保修。
:::

## 硬件连接

将 eMMC 模块或 UFS 模块安装到瑞莎 Dragon Q6A 的 eMMC / UFS 模块二合一接口。

**eMMC / UFS 模块安装步骤:**

1. 确保 eMMC / UFS 模块的缺角和主板的 eMMC / UFS 模块二合一接口的缺角丝印方向一致
2. 确保 eMMC / UFS 模块底部卡槽接口和主板的 eMMC / UFS 模块二合一接口对齐
3. 轻微用力按压 eMMC / UFS 模块一端的接口，听到滴的声音说明安装成功，同样的方法按压另一端的接口，确保 eMMC / UFS 模块安装成功

:::tip 接口位置
可以参考 [硬件信息](./hardware-info) 教程找到对应硬件接口位置
:::

## 使用指南

eMMC 模块或 UFS 模块可以作为系统启动介质，也可以作为扩展存储空间。

安装系统可以参考以下教程：

- [安装系统到 eMMC](../getting-started/install-system/emmc-system)

- [安装系统到 UFS](../getting-started/install-system/ufs-system)

## UFS 性能参考

以下为 Dragon Q6A 上使用不同品牌 UFS 模块的实测读写性能，使用 `dd` 命令测试，仅供参考。

| 产品名称           | UFS 颗粒品牌/型号                     | 容量  | 读取速度 | 写入速度 | 测试环境         |
| ------------------ | ------------------------------------- | ----- | -------- | -------- | ---------------- |
| Radxa UFS Module   | Samsung KLUDG4UHGC-B0E1 (UFS 3.1)    | 128GB | 1300 MB/s | 1200 MB/s | Radxa OS (Linux) |
| Radxa UFS Module   | Kioxia THGJFGT1E45BAILB              | 256GB | 1811 MB/s | 557 MB/s | Radxa OS (Linux) |

> 注意：实际读写速度可能因 UFS 模块品牌、容量、固件版本以及测试环境不同而有所差异。以上数据均为实测参考值。

## 接口引脚定义

可以参考 [资源汇总下载](../download) 页面的硬件原理图。
