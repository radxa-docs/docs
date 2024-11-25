---
sidebar_position: 3
description: "Windows 下通过 USB 刷机"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";

# Windows 主机

## 文件下载

请到[下载页面](../../download.md) 下载对应的镜像及Loader文件

<Rkdevtool rkdevtool_emmc_img="/img/rock5b/rock-5bp-rkdevtool-maskrom-flash-system.webp" loader_name="rk3588_spl_loader_v1.08.111.bin" emmc={false} pcie={false} sata={false} >

<Tabs queryString="versions">
    <TabItem value="ROCK 5B">
        <ol>
            <li>拔出 microSD 卡和电源线</li>
            <li>按住 Maskrom button</li>
            <li>将 USB A-C 电缆插入 ROCK 5B 的 Type-C 端口，另一端插入电脑，此时正常情况下会进入 Maskrom 状态</li>
        </ol>
        <img src="/img/rock5b/rock-5b-typec-maskrom-400px.webp" alt="rock 5b maskrom wire" width="500" />
    </TabItem>
    <TabItem value="ROCK 5B+">
        <ol>
            <li>拔出 microSD 卡和电源线</li>
            <li>按住 Maskrom button</li>
            <li>将 USB A-C 电缆插入 ROCK 5B+ 的 Type-C 端口，另一端插入电脑，给 ROCK 5B+ 上电，此时正常情况下会进入 Maskrom 状态</li>
        </ol>
        <img src="/img/rock5b/rock-5bp-typec-maskrom.webp" alt="rock 5b maskrom wire" width="500" />
    </TabItem>
</Tabs>

</Rkdevtool>
