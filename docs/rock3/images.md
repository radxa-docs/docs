---
sidebar_position: 7
---

# 镜像下载

瑞莎团队以 Debian 为基础开发了 Radxa OS 作为官方操作系统。

如果你想尝试其他镜像，请参阅[第三方镜像](#第三方镜像)。

:::note
注意：许多第三方镜像未经过官方测试，可能存在一些问题。
:::

:::tip
提示：我们将会在[瑞莎论坛](https://forum.radxa.com/)发布每次版本发布的相关信息。
:::

<Tabs queryString="model">
<TabItem value="ROCK 3A">

## ROCK 3A

### 官方镜像

以下系统已由瑞莎官方测试验证：

ROCK 3A: [Build 25](https://github.com/radxa-build/rock-3a/releases/download/b25/rock-3a_debian_bullseye_xfce_b25.img.xz)

更多镜像请查看： [ROCK 3A radxa-build](https://github.com/radxa-build/rock-3a/releases/latest)

### 发布信息

### 其他备选系统

#### 安卓

ROCK 3A 当前使用的是安卓 11，你可以从以下链接中下载镜像：

[ROCK 3A 安卓 11](https://dl.radxa.com/rock3/images/android/rock3a-android11-20220408_1204-gpt.img.xz)

补充信息：

[瑞莎安卓 Manifests](https://github.com/radxa/manifests)

[ROCK 3A 安卓 11 安装指导](https://wiki.radxa.com/Rock3/install/usb-install)

## 第三方镜像

:::caution
ROCK 3B 可以兼容 ROCK 3A 的大部分镜像，但是由于硬件接口差异，功能可能不完善，并且可能出现未知缺陷。
:::

| 系统                                                                                                                                          | 下载                                                                                                                                                                                                                                                             | 版本信息                                                                                                                                                                |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [![Armbian](/img/third-party-images-pic/Armbian.webp)](https://discord.com/channels/855634073376260096/888960277788393553/912495051010084895) | ROCK 3A: [Armbian](https://www.armbian.com/rock-3a/)                                                                                                                                                                                                             | Build 2021-11-23.<br/>用户名 : pi , 密码 : armbian<br/>[Discord讨论组](https://discord.com/channels/855634073376260096/888960277788393553/912495237748899851)           |
| [![Crux](/img/third-party-images-pic/Crux-logo.webp)](http://dl.slarm64.org/crux/images/rock_3/)                                              | [CRUX-ARM](https://dl.slarm64.org/crux/images/rock_3/crux-arm-3.6-aarch64-core-rock_3-6.0.6-build-20221029.img.zst)                                                                                                                                              | Build 2022-10-29.<br/>[README.TXT](http://dl.slarm64.org/slackware/images/rock_3a/README.TXT)<br/>[Forum讨论组](https://forum.radxa.com/t/rock-3-crux-arm-aarch64/7183) |
| [![Manjaro](/img/third-party-images-pic/Manjaro-Logo.webp)](https://manjaro.org/download)                                                     | ROCK 3A: [Manjaro软件发布](https://github.com/manjaro-arm/rock3-a-images/releases)                                                                                                                                                                               | Manjaro Product[安装指南](https://manjaro.org/)<br/>[Discord讨论组](https://discord.com/channels/855634073376260096/866316562520473600/916175047390003270)              |
| Ubuntu 22.04                                                                                                                                  | ROCK 3A: [ubuntu22.04_rk3568_rock3a_kernel5.10.66-20220523_beta3.zip](https://github.com/qxhome/rk3568-kernel5.10-alldrivers/releases/download/ubuntu22.04-kernel5.10-rk3568-rock3a-alldrivers-beta3/ubuntu22.04_rk3568_rock3a_kernel5.10.66-20220523_beta3.zip) | 贡献者： [QXhome](https://forum.radxa.com/t/image-rock3a-kernel-5-10-66/10061)                                                                                          |
| OpenWrt                                                                                                                                       | ROCK 3A: [openwrt-rockchip-armv8-radxa_rock-3a-squashfs-sysupgrade.img.gz](https://github.com/mj22226/openwrt/releases/latest/)                                                                                                                                  | 贡献者： [Marty Jones](https://github.com/mj22226)                                                                                                                      |

</TabItem>
<TabItem value="ROCK 3B">

## ROCK 3B

### 官方镜像

以下系统已由瑞莎官方测试验证：

ROCK 3B：[Build 18](https://github.com/radxa-build/rock-3b/releases/download/b18/rock-3b_debian_bullseye_xfce_b18.img.xz)

更多镜像请查看： [ROCK 3B radxa-build](https://github.com/radxa-build/rock-3b/releases/latest)

</TabItem>
<TabItem value="ROCK 3C">

## ROCK 3C

### 官方镜像

以下系统已由瑞莎官方测试验证：

ROCK 3C: [Build 42](https://github.com/radxa-build/rock-3c/releases/download/b42/rock-3c_debian_bullseye_xfce_b42.img.xz)

</TabItem>
<TabItem value="E25">

## Radxa E25

### 官方镜像

以下系统已由瑞莎官方测试验证：

Radxa E25: [Build 21](https://github.com/radxa-build/radxa-e25/releases/download/b21/radxa-e25_debian_bullseye_cli_b21.img.xz)

### 第三方镜像

| 系统    | 下载链接                                                                                                             | 说明                                                     |
| ------- | -------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| OpenWrt | [Flippy OpenWrt Radxa E25](https://dl.radxa.com/cm3i/e25/openwrt/openwrt_rk3568_e25_R24.01.26_k6.1.75-flippy-87+.7z) | 贡献者：Flippy <br/> 登录账号：root <br/> 密码：password |

</TabItem>
</Tabs>
