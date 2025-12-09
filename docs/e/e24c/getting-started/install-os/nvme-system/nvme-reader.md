---
sidebar_position: 5
---

import BalenaEtcherUse from '../../../../../common/radxa-os/install-system/\_use_etcher_nvme.mdx';

# 使用固态硬盘盒安装系统

<BalenaEtcherUse download_page={"../../../download"}/>

## 启动系统

:::tip NVMe 启动

NVMe 固态硬盘启动系统需要烧录 SPI 启动固件才能启动，若没有烧录 SPI 启动固件，请参考 [擦除 / 烧录 SPI Flash](./spi-flash.md) 教程。

:::

完成系统的安装后，将 NVMe SSD 安装到瑞莎 E24C 的 NVMe SSD 插槽中，然后使用 12V DC 电源适配器给瑞莎 E24C 供电，即可启动系统。

详细步骤：

1. 安装 NVMe SSD

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
