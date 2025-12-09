---
sidebar_position: 10
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_nvme.mdx';

# 从 MicroSD 卡启动并将系统安装到 NVMe SSD

<InstallSystem boot_device="MicroSD 卡" board="e24c" download_page="../../../download" download_url="https://github.com/radxa-build/radxa-rk3528/releases/download/rsdk-t2/radxa-rk3528_bookworm_kde_t2.output.img.xz" path_to_image_unxz="radxa-rk3528_bookworm_kde_t2.output.img.xz" path_to_image="radxa-rk3528_bookworm_kde_t2.output.img" />

## 启动系统

:::tip NVMe 启动

NVMe 固态硬盘启动系统需要烧录 SPI 启动固件才能启动，若没有烧录 SPI 启动固件，请参考 [擦除 / 烧录 SPI Flash](./spi-flash.md) 教程。

:::

完成系统的安装后，将 MicroSD 卡取下，确认 NVMe SSD 已安装到瑞莎 E24C 的 NVMe SSD 插槽中，然后使用 12V DC 电源适配器给瑞莎 E24C 供电。

详细步骤：

1. 确认 NVMe SSD 已安装

2. 使用 HDMI / DP 数据线连接显示器和主板

3. 使用 12V DC 电源适配器给瑞莎 E24C 供电

## 登录系统

当您首次启动系统后，需要使用默认的用户名和密码登录。

Radxa OS 的默认凭据如下：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |

## 使用系统

成功登录系统后，您就可以在瑞莎 E24C 上进行系统配置与开发。
