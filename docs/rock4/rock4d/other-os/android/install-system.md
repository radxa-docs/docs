---
sidebar_position: 3
---

# 安装系统

目前最新的 SPI 文件支持启动 Android 和 Linux，请在 [资源汇总下载](../../download.md) 中下载最新的 SPI 文件。

microSD 卡和 NVMe 启动系统相比于 UFS 启动系统步骤不同，请按照下面步骤操作。

## microSD 卡

通过 microSD 卡安装/启动 Android 系统。

1. 确保 ROCK 4D 烧录最新的 SPI 文件
2. 参考 Linux [安装系统到 microSD 卡](../../getting-started/install-system/boot_sd.md) 教程将 Android 系统镜像烧录到 microSD 卡中
3. 将 microSD 卡插入 ROCK 4D，启动系统

## NVMe 固态硬盘

通过 NVMe 固态硬盘安装/启动 Android 系统。

1. 确保 ROCK 4D 烧录最新的 SPI 文件
2. 参考 Linux [安装系统到 NVMe](../../getting-started/install-system/nvme-system) 教程将 Android 系统镜像烧录到 NVMe 固态硬盘中
3. 将 NVMe 固态硬盘插入 ROCK 4D，启动系统

## UFS 模块

通过 UFS 模块安装/启动 Android 系统。

注意：UFS 启动 Android 系统需要先烧录 Android 的 [update.img 系统镜像](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20251014/Rock4d-Android14-rk6-gms-ufs-20251014-update.zip)到 UFS 模块中，烧录完成后，就可以参考 Linux [安装系统到 UFS](../../getting-started/install-system/ufs-system) 教程将 Android 的最新 gpt 系统镜像烧录到 UFS 模块中。

1. 确保 ROCK 4D 烧录最新的 SPI 文件
2. 在 Linux 系统中使用 [upgrade_tool_v2.30](https://dl.radxa.com/tools/linux/upgrade_tool_v2.30_for_linux.zip) 将 Android 的 [update.img 系统镜像](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20251014/Rock4d-Android14-rk6-gms-ufs-20251014-update.zip) 烧录到 UFS 模块中

:::tip

下载的 update.img 系统镜像请解压后使用。

:::

<NewCodeBlock tip="Linux$" type="host">
```
sudo ./upgrade_tool uf <xx-update.img-path>
```
</NewCodeBlock>

3. 将 UFS 模块插入 ROCK 4D，启动系统
4. 若需要使用最新的 Android 系统，可以参考 [安装系统](../../getting-started/install-system/ufs-system/) 教程将 Android 的最新 gpt 系统镜像烧录到 UFS 模块中
