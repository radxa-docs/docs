---
sidebar_position: 2
---

import Images from "./\_image.mdx"

# 资源下载汇总

## 硬件设计

Radxa ROCK 5A V1.1 版本

[v1.1 2D dxf](https://dl.radxa.com/rock5/5a/docs/hw/radxa_rock5a_X1.11_2D.dxf)  
[v1.1 3D stp](https://dl.radxa.com/rock5/5a/docs/hw/rock_5a_3d_pcba.rar)  
[v1.1 原理图 pdf](https://dl.radxa.com/rock5/5a/docs/hw/radxa_rock5a_V1.1_sch.pdf)  
[v1.1 位号图 pdf](https://dl.radxa.com/rock5/5a/docs/hw/radxa_rock5a_V1.1_smd.pdf)

## 操作系统镜像

### Loader/SPI Image

<Images loader={true} system_img={false} android_img={false} spi_img={true} miniloader={true} dietpi={false} />

### Linux/Android 系统镜像

<Images loader={false} system_img={true} android_img={true} spi_img={false} miniloader={false} dietpi={true} />

:::caution

非瑞莎官方维护的镜像，瑞莎不能保证完整功能，如遇到问题，请到对应的社区寻求帮助。

:::

更多镜像请查看：[Radxa ROCK 5A Release](https://github.com/radxa-build/rock-5a/releases)

### OpenWRT

OpenWRT 官方支持 Radxa ROCK 5A 设备，您可以从以下链接获取相关固件和资源：

[OpenWRT 技术数据页面：Radxa Rock 5A](https://openwrt.org/toh/hwdata/radxa/radxa_rock_5a)

- [Radxa ROCK 5A OpenWRT ext4 sysupgrade 镜像](https://downloads.openwrt.org/releases/25.12.0/targets/rockchip/armv8/openwrt-25.12.0-rockchip-armv8-radxa_rock-5a-ext4-sysupgrade.img.gz)
- [Radxa ROCK 5A OpenWRT squashfs sysupgrade 镜像](https://downloads.openwrt.org/releases/25.12.0/targets/rockchip/armv8/openwrt-25.12.0-rockchip-armv8-radxa_rock-5a-squashfs-sysupgrade.img.gz)

:::caution

OpenWRT 不是瑞莎官方维护的系统，瑞莎不能保证完整功能，如遇到问题，请到 OpenWRT 社区寻求帮助。

:::

## 质量认证

| 文档                | 下载链接                                                                                               |
| ------------------- | ------------------------------------------------------------------------------------------------------ |
| CE-EMC 测试报告     | [下载](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_CE-EMC_Report.pdf)        |
| CE-EMC 符合性声明   | [下载](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_CE-EMC_Declaration.pdf)   |
| CE-EMC 证书         | [下载](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_CE-EMC_Certificate.pdf)   |
| FCC sDoC 测试报告   | [下载](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_FCC_sDoC_Report.pdf)      |
| FCC sDoC 符合性声明 | [下载](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_FCC_sDoC_Declaration.pdf) |
| FCC sDoC 证书       | [下载](https://github.com/radxa-docs/compliance/raw/main/rock5/rock5a/ROCK5A_FCC_sDoC_Certificate.pdf) |

如需其它法规或地区的认证文件，请联系 Radxa 销售团队，我们可以根据批量订单需求安排新增认证。

## 参考文档
