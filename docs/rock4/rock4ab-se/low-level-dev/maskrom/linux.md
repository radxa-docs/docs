---
sidebar_position: 1
description: "Linux 下通过 USB 刷机"
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV2.mdx";

# Linux 主机

## 文件下载

到资源下载汇总页面下载 [ROCK 4A/4B/4SE 系统镜像](../../download)

<Rkdeveloptool model="rock-4se" release_num="38" desktop="xfce" platform="linux" loader="rk3399_loader_spinor_v1.15.114.bin">

<Tabs queryString="model">

    <TabItem value="板载 eMMC 的">

        <ol>
            <li> 移除 MicroSD 卡， 断开电源 </li>
            <li> 如果板上有一个 SPI Nor Flash，则将 SPI Nor Flash 短路 </li>
            <li>使用 USB-A 转 USB-A 线从 OTG 端口连接 PC 主机</li>
            <li>按住 Maskrom 按键 </li>
            <li>插入电源线上电并释放 Maskrom 按键，如果电源绿灯常亮则成功进入 Maskrom 模式</li>
        </ol>

        <img src="/img/rock4/rock4p-maskrom_button.webp" alt="rock 4 maskrom button" style={{ width: "80%" }} />

    </TabItem>

    <TabItem value="不板载 eMMC 的">

        <ol>
            <li> 移除 MicroSD 卡， 断开电源 </li>
            <li> 如果板上有一个 SPI Nor Flash，则将 SPI Nor Flash 短路 </li>
            <li>使用 USB-A 转 USB-A 线从 OTG 端口连接 PC 主机</li>
            <li>插入电源线上电，如果电源绿灯常亮则成功进入 Maskrom 模式</li>
            <li>插入 eMMC module </li>
        </ol>

    </TabItem>

</Tabs>

<img src="/img/rock4/rock4-maskrom.webp" alt="rock 4 with no button maskrom wire" style={{ width: "80%" }} />

</Rkdeveloptool>
