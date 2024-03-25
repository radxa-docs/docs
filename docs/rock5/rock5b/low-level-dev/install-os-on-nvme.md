---
sidebar_position: 5
sidebar_class_name: hidden
---

import Etcher from '../../../common/general/\_etcher.mdx'

# 安装系统到 NVME 固态硬盘上

## 方案 1：使用 NVME 转 USB3.0 读卡器或带有 NVME 插槽的电脑

#### 准备工作

- ROCK 5B 主板
- 1x 5V 电源适配器（推荐 [Radxa Power PD30W](../accessories/pd-30w)）
- 一个 M.2 NVME 固态硬盘
- NVME 转 USB3.0 读卡器或带 NVME 插槽的 PC

### 镜像下载

请前往 [资源下载摘要](/rock5/rock5b/getting-started/download.md) 下载相应的镜像文件。

### 使用 etcher 将镜像写入 M.2 NVME 固态硬盘

<Etcher model="rock5b" />

### 方案 2： 写入 ROCK 5B 上的 NVME 固态硬盘

### 准备工作

- ROCK 5B 主板
- 1x 5V 电源适配器（推荐 [Radxa Power PD30W](../accessories/pd-30w)
- 一个 M.2 NVME 固态硬盘
- NVME 转 USB3.0 读卡器或带 NVME 插槽的 PC
- SD 卡或 eMMC 模块

### 将 Debian Linux 镜像安装到 SD 卡或 eMMC 模块中

请参考[SD 卡/eMMC 系统安装指南](../getting-started/install-os) 将系统安装到 SD 卡/eMMC。

### 从连接有 NVME 固态硬盘的 ROCK 5B 上的 SD 卡或 eMMC 模块启动

### 在 ROCK 5B 上运行 Debian 时，下载 ROCK 5B 镜像

### 检查是否检测到 NVME 固态硬盘

在 ROCK 5B 上

```
sudo fdisk -l
```

你可以看到这样的输出信息：

```
Disk /dev/nvme0n1: 232.9 GiB, 250059350016 bytes, 488397168 sectors             #The '/dev/nvme0n1' is your NVME SSD devicpath
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

#### 写镜像

在 ROCK 5B 上：

```
sudo sudo xzcat 'your compressed image path' | dd of='your NVME SSD device path' bs=1M status=progress
#例如： sudo xzcat rock-5b-debian-bullseye-xfce4-arm64-20220906-0626-gpt.img.xz | dd of=/dev/nvme0n1 bs=1M status=progress
```

## 方案 3：擦除 M.2 NVME 固态硬盘

当 M.2 NVME 固态硬盘之前使用安卓（或Linux）镜像写入时，现在我们改用Linux（或安卓）。建议先擦除 M.2 NVME SSD。然后写入目标镜像。

## 从 NVME 固态硬盘启动

将镜像写入 NVME SSD 后，要从 NVME SSD 启动，需要将引导加载程序写入 SPI 闪存。选中[安装到 SPI 以从 NVME SSD 启动](./bootloader_spi_flash)。
