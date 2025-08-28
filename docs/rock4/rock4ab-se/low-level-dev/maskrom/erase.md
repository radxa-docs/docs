---
sidebar_position: 4
description: "通过 Maskrom 清除 eMMC 或者 SPI Flash"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# 清除 eMMC 或者 SPI Flash

<ERASE loader="https://dl.radxa.com/rockpi4/images/loader/spi/rk3399_loader_spinor_v1.15.114.bin"  loader_name="rk3399_loader_spinor_v1.15.114.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

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

</ERASE>
