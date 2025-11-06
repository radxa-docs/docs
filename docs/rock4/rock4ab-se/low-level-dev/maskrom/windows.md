---
sidebar_position: 3
description: "Windows 下通过 USB 刷机"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";

# Windows 主机

## 文件下载

- 到资源下载汇总页面下载 [ROCK 4A/4B/4SE 系统镜像](../../download)

- [RK3399 Loader V1.27.126](https://dl.radxa.com/rockpi4/images/loader/rk3399_loader_v1.27.126.bin)

<Rkdevtool rkdevtool_emmc_img="/img/rock3/3b/rock-3b-rkdevtool-maskrom-flash-system.webp" loader_name="rk3399_loader_spinor_v1.15.114.bin" emmc={false} pcie={false} sata={false} >

<Tabs queryString="model">

    <TabItem value="板载 eMMC">

断开主板电源，取下 MicroSD 卡。

详细步骤：

① 若主板有 SPI Flash，需将 SPI Flash 对应引脚接 GND

② 使用 USB Type-A 转 USB Type-A 数据线连接主板和电脑

③ 主板未供电前按住 Maskrom 按键

④ 使用电源适配器给主板供电

⑤ 主板供电后松开 Maskrom 按键

<img src="/img/rock4/rock4-maskrom-onboard-emmc.webp" alt="rock 4 maskrom button" style={{ width: "80%" }} />

    </TabItem>

    <TabItem value="无板载 eMMC">

断开主板电源，移除可启动系统介质（如 MicroSD 卡和 eMMC 模块等）。

详细步骤：

① 若主板有 SPI Flash，需将 SPI Flash 对应引脚接 GND

② 使用 USB Type-A 转 USB Type-A 数据线连接主板和电脑

③ 使用电源适配器给主板供电

④ 安装 eMMC 模块

<img src="/img/rock4/rock4-maskrom-no-board-emmc.webp" alt="rock 4 with no button maskrom wire" style={{ width: "80%" }} />

    </TabItem>

</Tabs>

若主板电源绿灯常亮，说明成功进入 Maskrom 模式。
</Rkdevtool>
