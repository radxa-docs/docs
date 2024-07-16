---
sidebar_position: 2
description: "MacOS 下通过 USB 刷机"
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV2.mdx";
import Images from "../../\_image.mdx"

# Mac OS 主机

## 文件下载

<Images loader={true} system_img={true} spi_img={false} />

<Rkdeveloptool model="radxa-cm3-io" release_num="27" desktop="xfce" platform="macos" loader="rk356x_spl_loader_v1.15.113.bin">

<ol>
    <li>把 CM3 安装到 IO 板上</li>
    <li>移除 MicroSD 卡</li>
    <li>按住 SPI Disable 按键</li>
    <li>将 USB-A 转 MicroUSB 连接线插入 Radxa CM3 IO OTG 端口（Micro USB 端口），另一端插入电脑</li>
    <li>插入电源线上电，如果电源绿灯常亮则成功进入 Maskrom 模式</li>
</ol>

<img src="/img/cm3/cm3-button.webp" alt="cm3 core button" style={{ width: "40%" }} />
<img src="/img/cm3/cm3-with-io.webp" alt="cm3 io with cm3" style={{ width: "40%" }} />

</Rkdeveloptool>
