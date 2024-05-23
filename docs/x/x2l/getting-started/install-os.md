---
sidebar_position: 11
---

# 安装操作系统

首次使用安装操作系统

:::warning
Radxa X2L 没有配备 CMOS 电池。首次开机时，BIOS 会初始化硬件设置，红灯亮起。这将持续约 1 分钟，然后 X2L 重新启动，白灯亮起，BIOS 正常启动。如果没有 CMOS 电池（规格 CR1220），上述情况将重复出现。
:::

## 使用 ROOBI OS 安装操作系统

如果您购买的 X2L 附带有 ROOBI OS 系统，您可以参考[这篇文档](../../../roobi)来使用。

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

<Tabs  groupId="to" queryString>
<TabItem value="nvme" label="安装到 NVMe" default>
将 NVMe 固态硬盘轻轻插入相应的 M.2 M Key 插槽，并使用 M2 x 4 平头螺钉将其固定到位。
</TabItem>
<TabItem value="emmc" label="安装到 eMMC">

:::tip

我们不建议您将系统安装到 eMMC 中。这会使 [ROOBI OS](../../roobi) 失效。

:::

</TabItem>
</Tabs>

将已经完成烧录的 U 盘插入任意 USB 接口中，建议插入 USB 3 接口。

使用 HDMI 线缆将显示屏与主板 HDMI 接口相连接。

在任意 USB 接口插入鼠标和键盘。

### 引导至安装介质

<Tabs  groupId="to" queryString>
<TabItem value="nvme" label="安装到 NVMe" default>
<ul>
<li>将您的设备接上电源</li>
</ul>
</TabItem>
<TabItem value="emmc" label="安装到 eMMC">

<ul>
<p><li>将您的设备接上电源</li> </p>

<li>您可以选择以下任意操作执行：</li>
<br/>
<p>1. 激活 eMMC：在开机之前，按住 <InlineSuccess>eMMC Recovery 按钮</InlineSuccess> 并保持，于此同时按下并立刻松开 <InlineSuccess>电源按钮</InlineSuccess>，直到显示器亮起后即可松开<InlineSuccess>eMMC Recovery 按钮</InlineSuccess>。</p>
<p>2. <a href="../bios/emmc-availability">设置 eMMC 激活状态</a></p>
</ul>

</TabItem>
</Tabs>

- 在显示画面后，立刻点击 `F7` 进入引导选择界面。

![Boot_menu](/img/roobi/boot_menu.webp)

- 选择您的U盘设备，按 `Enter` 选择相应条目，启动安装镜像。

- 根据对应提示并继续安装系统。

### 驱动安装

当手动安装镜像后，您通常需要相对应的驱动，请参考[驱动安装](../driver)
