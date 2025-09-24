---
sidebar_position: 2
---

# eMMC / UFS 模块接口

瑞莎 Cubie A7A 板载 eMMC / UFS 二合一模块接口，支持安装 eMMC 或 UFS 模块，可以用于系统启动盘或扩展存储空间。

## 使用指南

eMMC 模块适用于小容量存储（8-128GB）, UFS 模块适用于大容量存储（64GB-1TB）。

- 拓展存储空间

您可以直接将 eMMC 或 UFS 模块安装到 eMMC / UFS 二合一模块接口上，然后启动系统，使用 `lsblk` 命令查看 eMMC 或 UFS 模块是否被识别。

- 作为系统启动盘

eMMC 模块作为系统启动盘使用：可以参考 [安装系统到 eMMC 模块](../getting-started/install-system/emmc-system/) 教程。

UFS 模块作为系统启动盘使用：可以参考 [安装系统到 UFS 模块](../getting-started/install-system/ufs-system/) 教程。

<Tabs queryString="boot_system">

<TabItem value="eMMC 模块">

将 eMMC 模块插入 Cubie A7A 的 eMMC 和 UFS 模块二合一接口中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-emmc-single.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="UFS 模块">

将 UFS 模块插入 Cubie A7A 的 eMMC 和 UFS 模块二合一接口中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-ufs-single.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>
</Tabs>

:::caution
eMMC / UFS 模块安装步骤：

1. 确保 eMMC / UFS 模块的缺角和 Cubie A7A 的 eMMC / UFS 模块接口方向一致
2. 确保 eMMC / UFS 模块底部卡槽接口和 Cubie A7A 的 eMMC / UFS 模块接口对齐
3. 轻微用力按压 eMMC / UFS 模块一端的接口，听到"滴"的声音说明安装成功，同样的方法按压另一端的接口，确保 eMMC / UFS 模块安装成功。
   :::

## 接口规格

:::info 技术参考
完整的技术规格和引脚定义可参考下载专区的 [硬件设计：原理图](../download) 文档
:::
