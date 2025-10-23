---
sidebar_position: 4
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_ufs.mdx';

# 从 MicroSD 卡启动并将系统安装到 UFS

<InstallSystem tag="ufs_module" board="dragon-q6a" download_page="../../../download" download_url="https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-t2/radxa-dragon-q6a_noble_kde_t2.output_4096.img.xz" path_to_image_unxz="radxa-dragon-q6a_noble_kde_t2.output_4096.img.xz" path_to_image="radxa-dragon-q6a_noble_kde_t2.output_4096.img" />

## 启动系统

完成系统的安装后，将 MicroSD 卡取下，确认 UFS 模块已安装到 Dragon Q6A 的 UFS 模块接口中，然后使用 12V Type-C 电源适配器给 Dragon Q6A 供电。

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/dragon-q6a-boot-system-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ：确认 UFS 模块已安装

② ：使用 HDMI 数据线连接显示器和主板

③ ：使用 12V Type-C 电源适配器给 Dragon Q6A 供电

系统启动正常后，电源指示灯绿色亮起，状态指示灯蓝色闪烁。

## 登录系统

当您首次启动系统后，需要使用默认的用户名和密码登录。

Radxa OS 的默认凭据如下：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |

## 使用系统

成功启动系统后，您就可以在 Dragon Q6A 上正式使用瑞莎系统，对于瑞莎系统的简单使用，可参考 [使用系统](../../use_system.md) 教程。

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/dragon-q6a-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
