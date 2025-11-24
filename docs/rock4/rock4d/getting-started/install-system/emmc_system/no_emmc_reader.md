---
sidebar_position: 4
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_emmc.mdx';

# 从 MicroSD 卡启动并将系统安装到 eMMC

:::tip eMMC 系统启动提示
仅 ROCK 4D 无 SPI Flash 版本支持 eMMC 启动，板载 SPI Flash 的版本不支持 eMMC 启动。
:::

<InstallSystem tag="emmc_module" board="radxa-4d" download_page="../../../download" download_url="https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b3/radxa-rk3576_bookworm_kde_b3.output_512.img.xz" path_to_image_unxz="radxa-rk3576_bookworm_kde_b3.output_512.img.xz" path_to_image="radxa-rk3576_bookworm_kde_b3.output_512.img" />

## 启动系统

完成系统的安装后，将 MicroSD 卡取下，确认 eMMC 模块已安装到 ROCK 4D 的 eMMC 模块接口中，然后使用电源适配器给 ROCK 4D 供电，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/rock4/4d/rock-4d-boot-system-emmc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ：安装 eMMC 模块

② ：使用 HDMI 数据线连接显示器和主板

③ ：使用电源适配器给 ROCK 4D 供电

系统启动正常后，蓝色和绿色 LED 灯会同时亮起，大概过几秒左右，绿灯常亮、蓝色指示灯会闪烁。

## 登录系统

当您首次启动系统后，需要使用默认的用户名和密码登录。

Radxa OS 的默认凭据如下：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |
