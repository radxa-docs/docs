---
sidebar_position: 10
description: "Buildroot 构建"
---

import SSDISKTOOL from "../../../common/general/\_sddisktool.mdx"

# Buildroot 构建

## 环境准备

需要准备一台 Ubuntu 20.04/22.04 x86_64 主机。

也可以使用虚拟主机

- ubuntu-22.04.5-live-server-amd64 虚拟主机，硬盘可用容量不低于 120G。

## 安装编译依赖包

<NewCodeBlock tip="Host-Linux$" type="host">
```
sudo apt update
sudo apt install python2 git rsync gcc g++ make device-tree-compiler bc flex bison lz4 libssl-dev libgmp-dev libmpc-dev expect expect-dev file unzip bzip2 fakeroot bsdmainutils
sudo ln -s /bin/python2 /bin/python
```
</NewCodeBlock>

## 获取 Rockchip 原始 SDK

- Mega
- [百度网盘](https://pan.baidu.com/s/1G8xA7AsLqQMqrsurMKBGyA?pwd=u7ac)

## 解压 SDK

在 Ubuntu PC 上，使用如下命令解压 SDK。

<NewCodeBlock tip="Host-Linux$" type="host">
```
tar xvf rk3576_linux6.1_rkr4_sdk.repo.tar
.repo/repo/repo sync -l
```
</NewCodeBlock>

## 添加板子 ROCK 4D 支持

使用 Radxa 维护的 rockchip 仓库。

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd device/rockchip
git remote add radxa https://github.com/radxa/device-rockchip.git
git fetch radxa
git checkout -b rk3576-linux-6.1 remotes/radxa/rk3576-linux-6.1
```
</NewCodeBlock>

使用 Radxa 维护的 kernel 仓库。

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd kernel
git remote add radxa https://github.com/radxa/kernel.git
git fetch radxa
git checkout -b linux-6.1-stan-rkr4.1-buildroot remotes/radxa/linux-6.1-stan-rkr4.1-buildroot
```
</NewCodeBlock>

使用 Radxa 维护的 rkwifibt 仓库。

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd external/rkwifibt
git remote add radxa https://github.com/radxa/rkwifibt.git
git fetch radxa
git checkout -b develop remotes/radxa/develop
```
</NewCodeBlock>

使用 Radxa 维护的 buildroot 仓库。

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd buildroot
git remote add radxa https://github.com/radxa/buildroot.git
git fetch radxa
git checkout -b rockchip/2024.02 remotes/radxa/rockchip/2024.02
```
</NewCodeBlock>

## 构建 SDK

在 SDK 的顶层目录，执行命令：

<NewCodeBlock tip="Host-Linux$" type="host">
```
./build.sh
```
</NewCodeBlock>

然后选中配置文件 `rockchip_rk3576_rock_4d_defconfig`。

构建完成后，将会在 `rockdev/` 目录下生成镜像。系统镜像文件是 `update.img`。

## 烧录镜像

### 烧录镜像到 UFS / EMMC 中

在 Linux/Mac OS 主机上，使用 [upgrade_tool](https://dl.radxa.com/tools/linux/Linux_Upgrade_Tool_V2.1.zip) 工具，通过 Type-A 烧录口，将系统镜像 `update.img` 烧写到 UFS / EMMC 中。

<NewCodeBlock tip="Host-PC$" type="host">
```
upgrade_tool uf update.img
```
</NewCodeBlock>

在 Windows 主机上，使用 `RKDevTool` 工具，通过 Type-A 烧录口，将系统镜像 `update.img` 烧写到 UFS / EMMC 中。

- ① : 让设备进入 Maskrom 模式

- ② : 选择 `Upgrade Firmware` 选项

- ③ : 点击 `Firmware` 选项，选择您编译出来的 `update.img`

- ④ : 点击 `Upgrade` 按钮，开始烧录系统镜像

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/other-os-burn-img.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 烧录镜像到 MicroSD Card 中

使用 SDDiskTool 将生成的镜像烧录到 MicroSD Card 中。

<SSDISKTOOL />
