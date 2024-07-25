---
sidebar_position: 50
---

# PXE 使用教程

- PXE 的全称是 Preboot Execute Environment，是指通过网络引导系统启动的功能

** 局域网内需要有 PXE 服务器提供服务，Radxa X4 即可通过 PXE 服务器进行各类系统的安装和启动 (PXE服务器的架设此文档不包含)**

## PXE 功能设置

- 上电开机时，按住 DEL 键进入 BIOS 设置页面
- 在 Advanced --> Network Stack Configuration 页面下，enable PXE 相关选项 (以 IPV4 网络 PXE 服务器为例)，如图所示。设置完成后按 F4 保存退出。

![PXE_Setting_01](/img/x/x4/pxe_setting_01.webp)

## PXE 功能使用

- Radxa X4 使用网线接入含 PXE 服务器的网络。
- 上电开机，按住 F7 键进入 Boot Menu，根据网络情况选择PXE IP4
- 回车后系统会自动扫描 PXE 服务器，连接上 PXE 服务器后会出现操作系统选择界面(取决于服务器配置)，如图所示

![PXE_Setting_02](/img/x/x4/pxe_setting_02.webp)

![PXE_Setting_03](/img/x/x2l/pxe_setting_03.webp)

![PXE_Setting_04](/img/x/x2l/pxe_setting_04.webp)

- 根据需求选择并安装操作系统(以 Windows10 系统安装为例)，
- 选择 1 后加载安装 Windows 系统必备的文件，加载完成后进入 Windows 安装界面，后续的操作与安装标准 Windows 系统一致。

![PXE_Setting_05](/img/x/x2l/pxe_setting_05.webp)

![PXE_Setting_06](/img/x/x2l/pxe_setting_06.webp)
