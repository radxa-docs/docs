---
sidebar_position: 2
---

# Yocto系统安装

## 安装环境配置

[Linux 环境配置](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/env-setup/flash-env-linux.html)

[Windows 环境配置](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/env-setup/flash-env-windows.html)

## 安装步骤

:::tip
安装系统到UFS之前，UFS需要 [格式化](https://www.ipi.wiki/pages/1200-docs?page=UfsFormat.html)
:::

1. 下载镜像并解压,进入镜像文件夹

- 下载地址:https://github.com/radxa-build/radxa-nio-12l/releases

2. 执行 genio-flash

- 开启 overlay 可以添加 --load-dtbo 参数, 例如: genio-flash --load-dtbo palmshell-nio12-radxa-display-8hd.dtbo
  ![install-yocto](/img/nio/nio12l/install-yocto-system.webp)

3. 按住 download key ,使用 TYPE C 数据线连接 TYPE-C OTG 口和你的 PC,开始烧录后可以松开 download key

:::tip
必须先执行步骤2,再执行步骤3
:::

# 参考文档

[MT8395 (Genio 1200) 开发手册](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/hw/mt8395-soc.html)
