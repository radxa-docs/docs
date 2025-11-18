---
sidebar_position: 4
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_ufs.mdx';

# 从 U 盘启动并将系统安装到 UFS

教程仅适用于星睿 O6N，星睿 O6 无 UFS 模块连接座。

<InstallSystem boot_device="U 盘" tag="ufs_module" board="orion-o6n" download_page="../../../download" download_url="https://github.com/radxa-build/orion-o6/releases/download/rsdk-t2/orion-o6_bookworm_gnome_t2.output_4096.img.xz" path_to_image_unxz="orion-o6_bookworm_gnome_t2.output_4096.img.xz" path_to_image="orion-o6_bookworm_gnome_t2.output_4096.img" />

## 启动系统

完成系统的安装后，将 U 盘取下，确认 UFS 模块已安装到瑞莎星睿 O6N 的 UFS 模块接口中，然后使用 12V DC 电源适配器给瑞莎星睿 O6N 供电。

详细步骤：

1. 确认 UFS 模块已安装

2. 使用 HDMI / DP 数据线连接显示器和主板

3. 使用 12V DC 电源适配器给瑞莎星睿 O6N 供电

系统启动正常后，电源指示灯绿色亮起，状态指示灯蓝色闪烁。

## 登录系统

当您首次启动系统后，需要使用默认的用户名和密码登录。

Radxa OS 的默认凭据如下：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |

## 使用系统

成功登录系统后，您就可以在瑞莎星睿 O6N 上进行系统配置与开发。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6n/orion-o6n-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
