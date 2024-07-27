---
sidebar_position: 11
---

# 安装操作系统

## 手动安装操作系统

### 制作安装介质

:::tip
需要在您的其他 Windows 的设备上操作。
:::

1. 从官方网站下载镜像

   - [Windows 10](https://www.microsoft.com/software-download/windows10)
   - [Windows 11](https://www.microsoft.com/zh-cn/software-download/windows11)
   - [Ubuntu](https://ubuntu.com/download)
   - [Debian](https://www.debian.org/download)
   - [Fedora](https://fedoraproject.org/workstation/download)

2. 将镜像写入到 U 盘。

- 可选择使用 [Rufus](https://rufus.ie/)，将安装镜像烧录到 U 盘中，选择您下载的镜像以及设备（您的 U 盘）之后，点击**开始**，请耐心等待刻录过程结束。如果一切顺利，您成功的制作了一个安装介质。

<img alt="rufus01-cn.webp" src="../../../img/x/x2l/rufus01-cn.webp" width="320"/>

- 可选使用 [balenaEtcher](https://etcher.balena.io/#download-etcher)，将安装镜像烧录到 U 盘中，选择您下载的镜像以及目标磁盘（您的 U 盘），点击**现在烧录!**，请耐心等待刻录过程结束。如果一切顺利，您成功的制作了一个安装介质。
  <img alt="balenaEtcher01-cn.webp" src="../../../img/x/x2l/balenaEtcher01-cn.webp" width="730"/>

### 上电前操作

:::tip
请注意，Radxa X4是否配备板载eMMC取决于您购买的具体配置。
:::

<Tabs  groupId="to" queryString>
<TabItem value="nvme" label="安装到 NVMe" default>
将 M.2 2230 NVMe 固态硬盘轻轻插入相应的 M.2 M Key 插槽，并使用 M2 x 4 平头螺钉将其固定到位。
</TabItem>
<TabItem value="emmc" label="安装到 eMMC">

</TabItem>
</Tabs>

将已经完成烧录的 U 盘插入任意 USB 接口中，建议插入 USB 3 接口。

使用 Micro HDMI 转 HDMI 线缆将显示屏与主板 Micro HDMI 接口相连接。

在任意 USB 接口插入鼠标和键盘。

### 引导至安装介质

- 将瑞莎 X4 接上电源

- 在显示画面后，立刻点击 `F7` 进入引导选择界面。

![Boot_menu](/img/roobi/boot_menu.webp)

- 选择您的U盘设备，按 `Enter` 选择相应条目，启动安装镜像。

- 根据对应提示并继续安装系统。

### 驱动安装

当手动安装镜像后，您通常需要相对应的驱动，请参考[驱动安装](../driver)
