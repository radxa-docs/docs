---
sidebar_position: 2

doc_kind: wrapper
source_of_truth: local
imports_resolve_to:
  - docs/som/cm/cm5/radxa-os/install-os.mdx
  - docs/som/cm/cm5/android/install-os.mdx
  - docs/som/_install_uninstall_coreboard_guide.mdx
---

import Installdebian from "../radxa-os/install-os.mdx";
import Installandroid from "../android/install-os.mdx";
import InstallCoreBoard from "../../../\_install_uninstall_coreboard_guide.mdx";

# 系统安装

## 组装

<InstallCoreBoard />

# 系统安装

<Tabs queryString="target">
  <TabItem value="Radxa-OS" label="Radxa-os">

<Installdebian />

  </TabItem>
  <TabItem value="Android" label="Android">

<Installandroid />

  </TabItem>
</Tabs>

## 登录系统

官方镜像默认有两个账号：

1. 用户名: radxa 密码: radxa

2. 用户名: rock 密码: rock

更多信息请参考 [RadxaOS](../radxa-os)
