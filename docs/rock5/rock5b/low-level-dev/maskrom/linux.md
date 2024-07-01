---
sidebar_position: 1
description: "Linux 下通过 USB 刷机"
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV2.mdx";
import Images from "../../\_image.mdx"

# Linux 主机

## 文件下载

<Images loader={true} system_img={true} spi_img={false} />

<Rkdeveloptool model="rock-5b" release_num="39" desktop="kde" platform="linux" loader="rk3588_spl_loader_v1.08.111.bin">

<ol>
    <li>拔出 microSD 卡和电源线</li>
    <li>按住 Maskrom button</li>
    <li>将 USB A-C 电缆插入 ROCK 5B 的 Type-C 端口，另一端插入电脑，此时正常情况下会进入 Maskrom 状态</li>
</ol>
<img src="/img/rock5b/rock-5b-typec-maskrom-400px.webp" alt="rock 5b maskrom wire" width="500" />

</Rkdeveloptool>
