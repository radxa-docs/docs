---
sidebar_position: 10
---

import BIOS from '../../../common/orion-common/low-level-dev/\_bios.mdx';

# 更新 BIOS 固件

<BIOS board="星睿 O6" power="20V Type-C 电源适配器" download_page="../../download" tag="o6" />

## 使用烧录器更新 BIOS 固件

对于需要从损坏的 BIOS 中恢复或偏好直接硬件访问的高级用户，可以使用 Serial Flash 编程器（如 CH341A ）将BIOS固件（cix_flash_all.bin）直接刷写到 SPI NOR Flash 芯片中。此方法完全绕过操作系统，即使在设备无法启动的情况下也能工作。

### 拆卸 SPI Flash 芯片

拆卸 SPI Flash 芯片步骤：

① : 找到主板上 SPI Flash 芯片的安装位置

② : 打开 SPI Flash 右边的卡扣盖子

③ : 打开 SPI Flash 左边的卡扣盖子

完成以上步骤后，使用镊子将 SPI Flash 芯片从主板上取下

<div style={{textAlign: 'center'}}>
    <img src="/img/orion/o6/o6_spi_uninstall.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 烧录 BIOS 固件

有关详细的步骤说明和硬件要求，请参阅社区成员 Meco 提供的全面 [论坛指南](https://forum.radxa.com/t/guide-flash-bios-with-ch341a-macos-linux/26742)。

论坛指南教程所需要的 `cix_flash_all.bin` 文件位于下载 BIOS 包中。

### 安装 SPI Flash 芯片

① : 将 SPI Flash 芯片安装到主板上

② : 将 SPI Flash 左边的卡扣盖子安装回去

③ : 将 SPI Flash 右边的卡扣盖子安装回去

:::tip 安装时注意芯片安装的方向和位置

- 芯片的圆圈对应引脚 1 ，图中用红色小圆圈标注出来了。
- 安装 SPI Flash 的底座有一个三角箭头，对应 SPI Flash 的引脚 1

你可以通过以上两种方式确认 SPI Flash 的安装方向和位置。
:::

<div style={{textAlign: 'center'}}>
    <img src="/img/orion/o6/o6_spi_install.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
