---
sidebar_position: 2
---

import UPGRADE_TOOL from "../../../../../../common/dev/\_upgrade-tool.mdx";

# 安装系统到 eMMC

我们可以直接将 Android 系统安装到 eMMC 模块中，请参考 [安装系统到 MicroSD 卡](./boot-from-sd) 章节 。
本篇主要讲述如何通过 Maskrom 模式将 <strong> update 格式</strong>的 Android 系统安装到 ROCK 4A/4B/4A+/4B+/4SE eMMC 上。

## 文件下载

到资源下载汇总页面下载 [ROCK 4A/4B/4SE 系统镜像](../../../../download)

## 进入 Maskrom 模式

<Tabs queryString="model">

    <TabItem value="板载 eMMC 的">

        <ol>
            <li>移除 MicroSD 卡，断开电源</li>
            <li>如果板上有一个 SPI Nor Flash，则将 SPI Nor Flash 短路</li>
            <li>使用 USB-A 转 USB-A 线从 OTG 端口连接 PC 主机</li>
            <li>按住 Maskrom 按键</li>
            <li>插入电源线上电并释放 Maskrom 按键，如果电源绿灯常亮则成功进入 Maskrom 模式</li>
        </ol>

        <img
            src="/img/rock4/rock4p-maskrom_button.webp"
            alt="rock 4 maskrom button"
            style={{ width: "80%" }}
        />

    </TabItem>

    <TabItem value="不板载 eMMC 的">

        <ol>
            <li>移除 MicroSD 卡，断开电源</li>
            <li>如果板上有一个 SPI Nor Flash，则将 SPI Nor Flash 短路</li>
            <li>使用 USB-A 转 USB-A 线从 OTG 端口连接 PC 主机</li>
            <li>插入电源线上电，如果电源绿灯常亮则成功进入 Maskrom 模式</li>
            <li>插入 eMMC module</li>
        </ol>

    </TabItem>

</Tabs>

## 安装系统

<Tabs queryString="platform">
    <TabItem value="MacOS/Linux">
        <ul>
            <li>请下载并解压以下文件以安装 upgrade_tool：</li>
            <ul>
                <li><a href="https://dl.radxa.com/tools/linux/Linux_Upgrade_Tool_V2.1.zip">upgrade_tool v2.1</a></li>
            </ul>
            <br />
            <li>确认开发板已经进入 Maskrom 模式</li>
            <br />
            <pre>
                $ sudo upgrade_tool ld
                Program Log will save in the /root/upgrade_tool/log/
                List of rockusb connected(1)
                DevNo=1	Vid=0x2207,Pid=0x330c,LocationID=19	Mode=Maskrom
                            </pre>
                            <li>烧录 update 系统镜像</li>
                            <br />
                            <pre>
                $ sudo upgrade_tool uf rock4xx-android-xx-update.img
            </pre>
            <li>烧录完成后系统会自动启动</li>
        </ul>
    </TabItem>
    <TabItem value="Windows">
        <ul>
            <li>请下载并解压以下文件以安装 RKDevTool：</li>
            <ul>
                <li><a href="https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip">RKDevTool v2.96</a> (含中文使用文档)</li>
                <li><a href="https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip">DriverAssistant v5.0</a></li>
            </ul>
            <br />
            <li>选择 "升级固件"</li>
            <li>点击 "固件" 选择 <strong>update</strong> 格式的 Android Image</li>
            <li>点击 "升级"</li>
            <li>闪存完成后，系统将自动启动</li>
            <img
                src="/img/rock4/rock4-rkdevtool-update-format-android-image.webp"
                style={{ width: "80%" }}
                alt="rock4 flash the update format image by rkdevtool"
            />
        </ul>
    </TabItem>
</Tabs>
