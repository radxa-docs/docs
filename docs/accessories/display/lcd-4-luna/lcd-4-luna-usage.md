---
sidebar_position: 6
---

# 瑞莎 4 Luna 高清触摸屏使用教程

瑞莎 4 Luna 高清触摸屏支持即插即用，可在多种操作系统上使用。

## 硬件连接

使用 USB Type-C 数据线将显示屏连接到主板或电脑。确保数据线质量良好，支持数据传输功能。

<div style={{textAlign: 'center'}}>
    <img src="/img/accessories/display/display-4-luna-hardware-connect.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip 使用说明

首次使用显示屏，需要安装显示屏驱动，不然出现开机画面后会处于黑屏状态。

:::

## 驱动安装

首次连接瑞莎 4 Luna 显示屏时，系统会弹出一个可移动磁盘，里面包含了适用于 Linux、Windows 和 macOS 的驱动程序。您可以根据自己的操作系统选择相应的驱动进行安装。

<Tabs queryString="Platform">

<TabItem value="Windows">

进入可移动磁盘的 Windows 文件夹，双击 `AicUsbDisplayDriverV_xxx.exe` 文件进行安装，按照安装向导完成驱动程序的安装。

</TabItem>

<TabItem value="Ubuntu">

进入可移动磁盘的 Linux 文件夹，运行脚本安装驱动。

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```
bash install_for_linux.sh
```

</NewCodeBlock>

</TabItem>

<TabItem value="macOS">

进入可移动磁盘的 macOS 文件夹，双击 `AicUsbDisplayDriverV_xxx.pkg` 文件进行安装，按照安装向导完成驱动程序的安装。

</TabItem>

</Tabs>

## 显示模式

连接并显示后，你可以在系统设置显示屏的显示模式。
