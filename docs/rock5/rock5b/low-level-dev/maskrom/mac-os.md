---
sidebar_position: 2
description: "MacOS 下通过 USB 刷机"
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV2.mdx";

# Mac OS 主机

## 文件下载

请到[下载页面](../../download) 下载对应的镜像及Loader文件

<Rkdeveloptool model="rock-5b" release_num="b39" desktop="kde" platform="macos" loader="rk3588_spl_loader_v1.08.111.bin">

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

</Rkdeveloptool>
