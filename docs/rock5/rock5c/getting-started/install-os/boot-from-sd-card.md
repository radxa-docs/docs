---
sidebar_position: 1
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# 安装系统到 MicroSD 卡

## 文件下载

<Images loader={false} system_img={true} spi_img={false} />

## MicroSD 卡准备

将 MicroSD 卡插入到 SD 卡读卡器中，然后将读卡器插入到 PC 的 USB 端口上

## 烧录镜像

<Etcher />

## 启动系统

按照上述步骤成功烧录 microSD 卡系统后， 将 microSD 卡插入到 microSD 卡插槽内（如下图所示），然后上电，系统开始启动，HDMI 连接显示器会显示桌面。

<img
src="/img/rock5c/rock-5c-sd-slot.webp"
alt="microSD slot"
style={{ width: "60%"}}
/>

## 登录系统

系统启动后，使用 radxa 账号登录，密码为 radxa。

:::tip
系统从上电到开机启动，整个过程持续约 40 秒，然后进入系统桌面。
:::
