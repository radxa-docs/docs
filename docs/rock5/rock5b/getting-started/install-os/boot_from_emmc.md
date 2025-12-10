---
sidebar_position: 2
---

import Etcher from '../../../../common/general/\_etcherV2.mdx';

# 安装系统到 eMMC Module (仅适用于 ROCK 5B)

## 文件下载

请到 [资源下载汇总](../../download) 下载对应的镜像文件

## eMMC Module 准备

将 [eMMC Module](../../../../accessories/emmc_module) 插入到 [eMMC Reader](../../../../accessories/emmc_reader) 中，然后将 Reader 插入到 PC 的 USB 端口上

:::tip

若为板载 eMMC 请参考 [USB 刷机部分](../../low-level-dev/install-os/rkdevtool_emmc.md) 进行刷机操作。

:::

## 镜像烧录

<Etcher/>

## 启动系统

按照上述步骤成功烧录 eMMC Module 后， 将 eMMC Module 插入到 eMMC Module 插槽内(如下图所示)，然后上电，电源指示灯显示绿色，系统开始启动，启动正常后，指示灯开始闪烁，一段时间后 HDMI 显示桌面。

<img
src="/img/rock5b/rock5b-interface-3.webp"
alt="eMMC slot"
style={{ width: "60%"}}
/>

## 登录系统

系统启动后，使用 radxa 账号登录，密码为 radxa。

:::tip
系统从上电到开机启动，整个过程持续约 40 秒，然后进入系统桌面。
:::
