---
sidebar_position: 10
description: "Buildroot"
---

import SSDISKTOOL from "../../../common/general/\_sddisktool.mdx"

# Buildroot

## 环境准备

需要准备一台 Ubuntu 20.04/22.04 x86_64 主机。

也可以使用虚拟主机

- ubuntu-22.04.5-live-server-amd64 虚拟主机，硬盘可用容量不低于 120G。

## 安装编译依赖包

```
sudo apt update
sudo apt install python2 git rsync gcc g++ make device-tree-compiler bc flex bison lz4 libssl-dev libgmp-dev libmpc-dev expect expect-dev file unzip bzip2 fakeroot bsdmainutils
sudo ln -s /bin/python2 /bin/python
```

## 获取 Rockchip 原始 SDK

- Mega：https://mega.nz/file/kjZExAzL#pzw5des1W_rDzTm-P2iLAJ-n9RLYQY-gEVajpm3U_sQ
- 百度网盘：https://pan.baidu.com/s/1bm4IXy7tJ-sBDVdMxehRAQ?pwd=1pty

## 解压 SDK

在 Ubuntu PC 上，使用如下命令解压 SDK。

```
tar xvf rk3588_linux6.1_rkr4_sdk.repo.tar
.repo/repo/repo sync -l
```

## 添加板子 ROCK 5C 支持

使用 Radxa 维护的 rockchip 仓库。

```
cd device/rockchip
git remote add radxa https://github.com/radxa/device-rockchip.git
git fetch radxa
git checkout -b rk3588-linux-6.1 remotes/radxa/rk3588-linux-6.1
```

使用 Radxa 维护的 u-boot 仓库。

```
cd u-boot
git remote add radxa https://github.com/radxa/u-boot.git
git fetch radxa
git checkout -b next-dev-buildroot remotes/radxa/next-dev-buildroot
```

使用 Radxa 维护的 kernel 仓库。

```
cd kernel
git remote add radxa https://github.com/radxa/kernel.git
git fetch radxa
git checkout -b linux-6.1-stan-rkr4.1-buildroot remotes/radxa/linux-6.1-stan-rkr4.1-buildroot
```

## 构建 SDK

在 SDK 的顶层目录，执行命令：

```
./build.sh
```

然后选中配置文件 `rockchip_rk3588s_rock_5c_defconfig`。

构建完成后，将会在 `rockdev/` 目录下生成镜像。系统镜像文件是 `update.img`。

## 烧录镜像

### 烧录镜像到 eMMC 中

在 Linux/Mac OS 主机上，使用 `upgrade_tool` 工具，通过 Type-A 烧录口，将系统镜像 `update.img` 烧写到 eMMC 中。

```
upgrade_tool uf update.img
```

在 Windows 主机上，使用 `RKDevTool` 工具，通过 Type-A 烧录口，将系统镜像 `update.img` 烧写到 eMMC 中。

### 烧录镜像到 MicroSD Card 中

使用 SDDiskTool 将生成的镜像烧录到 MicroSD Card 中。

<SSDISKTOOL />
