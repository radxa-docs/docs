---
sidebar_position: 10

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/radxa-os/rkdevtool/_emmc.mdx
---

import EMMC from '../../../../../../common/radxa-os/rkdevtool/\_emmc.mdx';

# 安装系统到板载 eMMC

## 线刷系统

<EMMC download_page="../../../download"/>

## 启动系统

完成系统的安装后，连接 HDMI 显示器，重新插拔电源适配器，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-emmc-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : 使用 HDMI 或 DP 数据线连接显示器和主板

② : 使用 USB-A 接口连接鼠标或键盘

③ : 使用 5V DC 电源适配器给主板供电

若主板供电正常，瑞莎 NX5 系统指示灯和瑞莎 NX5 载板的电源指示灯亮绿色；若系统启动正常，瑞莎 NX5 系统指示灯绿色闪烁，瑞莎 NX5 载板的状态指示灯蓝色闪烁。

## 登录系统

当您首次启动系统后，需要使用默认的用户名和密码登录。

Radxa OS 的默认凭据如下：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |
