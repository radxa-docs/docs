---
sidebar_position: 3
---

import Etcher from '../../../common/general/\_etcher.mdx'
import NVME from '../../../common/dev/\_nvme.mdx'
import Rkdeveloptool from "../../../common/dev/\_rkdeveloptool.mdx";
import RKDevTool from "../../../common/dev/\_rkdevtool.mdx"

# 安装操作系统

## 准备工作

- 1x microSD 卡(容量 >=8GB)
- 1x microSD 读卡器
- 12V DC 电源适配器

## 镜像下载

请下载[此镜像](https://github.com/radxa-build/rock-5-itx/releases/download/test-build-2/rock-5-itx_debian_bullseye-test_kde_test-build-2.img.xz)，本文档以此为例。

:::tip
请到[资源下载汇总](../getting-started/download)页面获取更多镜像资源。
:::

## 安装系统

<Tabs queryString="install-os">
    <TabItem value="MicroSD">
        <Etcher model="rock5itx" product="Radxa ROCK 5 ITX" power_supply="12V DC" sd_slot="/img/rock5itx/rock5itx-sd-slot.webp" />
    </TabItem>
    <TabItem value="eMMC">
        <h3>进入 Maskrom 模式</h3>
        <ol>
            <li>拔出 microSD 卡和电源线</li>
            <li>按住 Maskrom 按钮</li>
            <li>通过 USB-A 转 USB-C 线连接PC 主机的 USB，如果如果PC端检测到有设备，则进入到 Maskrom 模式（Radxa ROCK 5 ITX 的 OTG 接口是 TYPE-C,可通过 USB-C 转 USB-A 线连接主机和进入 Maskrom 的主板进行通信）</li>
        </ol>
        <img src="/img/rock5itx/rock5itx-maskrom-new.webp" alt="maskrom new version" width="500" />
        <Tabs queryString="maskrom">
        <TabItem value="Windows">
            <p>如操作正常，RKDevTool 会提示 `发现一个MASKROM设备`：</p>
            <img src="/img/configuration/rkdevtool-zh-maskrom.webp" alt="RKDevTool zh maskrom" />
        </TabItem>
        <TabItem value="Linux">
            <p>如操作正常， `rkdeveloptool ld`会提示 进入MASKROM模式：</p>
            <pre>
            <code>PC:~$ sudo rkdeveloptool ld
 DevNo=1	Vid=0x2207,Pid=0x350b,LocationID=109	Maskrom</code>
        </pre>
        </TabItem>
        </Tabs>
        <p>在 Maskrom 模式下，您可使用 <a href="rkdevtool">rkdevtool</a> 或 <a href="upgrade-tool">upgrade-tool</a> 来对您的产品进行擦写、线刷等操作。</p>
        <h3>安装系统到 eMMC</h3>
        <Tabs queryString="install-os-emmc-using-maskrom">
        <TabItem value="Windows">
            <RKDevTool series="rock5" />
        </TabItem>
        <TabItem value="Linux">
            <Rkdeveloptool series="rock5"/>
        </TabItem>
        </Tabs>
        <h3>启动系统</h3>
        <ul>
            <li>使用12V DC 电源适配器上电，然后系统开始启动，HDMI显示桌面。</li>
        </ul>
    </TabItem>
    <TabItem value="NVME">
        <NVME model="rock-5-itx" release_num="b3" install_os_path="../getting-started/install-os" rsetup_path="../os-config/rsetup" />
    </TabItem>
</Tabs>

:::tip
系统从上电到开机启动，整个过程持续约53秒，然后进入系统桌面。
:::
