---
sidebar_position: 2
---

import InstallSystem from '../../../../../../common/radxa-os/install-system/\_use_dd_nvme.mdx';

# 从 SD 卡安装系统到 NVMe

<InstallSystem tag="pcie_fpc" board="cubie-a7a" download_url="https://github.com/radxa-build/radxa-cubie-a7a/releases/download/rsdk-b2/radxa-cubie-a7a_bullseye_kde_b2.output_512.img.xz" path_to_image_unxz="radxa-cubie-a7a_bullseye_kde_b2.output_512.img.xz" path_to_image="radxa-cubie-a7a_bullseye_kde_b2.output_512.img" />

## 启动系统

完成系统的安装后，将主板关机，断开主板电源，按照以下操作完成系统启动：

① : 将 MicroSD 卡从主板上取下

② : 将 NVMe SSD 通过 PCIe FPC 接口搭配 M.2 M Key HAT 安装到主板上

③ : 使用 HDMI 数据线连接显示器和主板

④ : 使用 USB-A 接口连接鼠标或键盘：若有 USB-A 拓展坞，可以通过拓展坞连接鼠标和键盘

⑤ : 使用 5V Type-C 电源适配器给主板供电

若主板供电正常，主板电源指示灯绿色亮起；若系统启动正常，状态指示灯蓝色闪烁。

成功启动系统后，显示器会显示系统桌面。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-debian11-succ.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- radxa

用户账号：radxa

用户密码：radxa

## 登录系统

根据系统信息登录并使用系统。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-debian11-desktop.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 使用系统

成功启动系统后，您就可以在 Cubie A7A 上正式使用瑞莎系统，对于瑞莎系统的简单使用，可参考 [系统使用](../../../../system-config) 教程。
