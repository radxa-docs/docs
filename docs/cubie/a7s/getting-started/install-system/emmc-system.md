---
sidebar_position: 2
---

import DDUse from '../../../../common/radxa-os/install-system/\_use_dd_emmc.mdx';

# 安装系统到 eMMC

:::note 说明
教程适用于 Cubie A7S 板载 eMMC 版本的用户
:::

<DDUse tag="emmc_board" board="cubie-a7s" download_url="https://github.com/radxa-build/radxa-a733/releases/download/rsdk-t2/radxa-a733_bullseye_kde_t2.output_512.img.xz" path_to_image_unxz="radxa-a733_bullseye_kde_t2.output_512.img.xz" path_to_image="radxa-a733_bullseye_kde_t2.output_512.img"  download_page="../../download"/>

## 启动系统

完成系统的安装后，将主板关机，断开主板电源，按照以下操作完成系统启动：

① : 将 MicroSD 卡从主板上取下

② : 使用 USB-C 转 HDMI 或 DP 数据线连接显示器和主板

③ : 使用 USB-A 接口连接鼠标或键盘：若有 USB-A 拓展坞，可以通过拓展坞连接鼠标和键盘

④ : 使用 5V Type-C 电源适配器给主板供电

若主板供电正常，主板电源指示灯绿色亮起；若系统启动正常，状态指示灯蓝色闪烁。

成功启动系统后，显示器会显示系统桌面，你可以根据系统信息登录并使用系统。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-debian11-succ.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 系统信息

使用官方系统镜像时，请使用以下默认登录凭据：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |

## 登录系统

根据系统信息登录并使用系统。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-debian11-desktop.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 使用系统

成功启动系统后，您就可以在 Cubie A7S 上正式使用瑞莎系统，对于瑞莎系统的简单使用，可参考 [系统使用](../../system-config) 教程。
