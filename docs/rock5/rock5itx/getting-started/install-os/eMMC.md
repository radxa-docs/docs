---
sidebar_position: 2
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptool.mdx";
import RKDevTool from "../../../../common/dev/\_rkdevtool.mdx";

# 安装系统到 eMMC

## 进入 Maskrom 模式

<ol>
    <li>拔出 microSD 卡和电源线</li>
    <li>按住 Maskrom 按钮</li>
    <li>通过 USB-A 转 USB-C 线连接PC 主机的 USB，如果如果PC端检测到有设备，则进入到 Maskrom 模式（Radxa ROCK 5 ITX 的 OTG 接口是 TYPE-C,可通过 USB-C 转 USB-A 线连接主机和进入 Maskrom 的主板进行通信）</li>
</ol>

<img src="/img/rock5itx/rock5itx-maskrom-new.webp" alt="maskrom new version" width="500" />

<Tabs groupId="platform" queryString="platform">
    <TabItem value="Windows">
        <p>如操作正常，RKDevTool 会提示 `发现一个MASKROM设备`：</p>
        <img src="/img/configuration/rkdevtool-zh-maskrom.webp" alt="RKDevTool zh maskrom" />
    </TabItem>
    <TabItem value="Linux">
        <p>如操作正常， `rkdeveloptool ld`会提示 进入MASKROM模式：</p>
        <pre>
            <code>PC:~$ sudo rkdeveloptool ld
            DevNo=1	Vid=0x2207,Pid=0x350b,LocationID=109	Maskrom </code>
        </pre>
    </TabItem>
</Tabs>

<p>在 Maskrom 模式下，您可使用<a href="../../low-level-dev/rkdevtool">upgrade-tool</a> 或者 <a href="../../low-level-dev/upgrade-tool">upgrade-tool</a> 来对您的产品进行擦写、线刷等操作。</p>

## 安装系统

<Tabs groupId="platform" queryString="install the system">
    <TabItem value="Windows">
        <RKDevTool series="rock5" />
    </TabItem>
    <TabItem value="Linux">
        <Rkdeveloptool series="rock5"/>
    </TabItem>
</Tabs>

## 启动系统

使用12V DC 电源适配器上电，然后系统开始启动，HDMI显示桌面。

:::tip
系统从上电到开机启动，整个过程持续约53秒，然后进入系统桌面。
:::
