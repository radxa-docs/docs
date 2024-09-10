---
sidebar_position: 2
---

# 安装系统到 eMMC/UFS

## 资源下载

镜像及刷机工具请到[资源下载汇总](../../download) 下载.

## 进入烧录模式

使用typec数据线接入Debug 调试口连接到主机，此时会在PC上显示出4个串口设备，打开其中序号排列最后的一个(波特率115200)，按住 FastBoot 按键
之后上电，板子会进入烧录模式，此时串口会有数据输出，运行 `fastboot devices` 命令检测设备

```shell
name@your-pc:$ fastboot devices
14007211532C0033        fastboot
```

## 镜像烧录

linux 用户：

- 下载linux平台烧录工具，查看目录下的PDF文档了解相关内容 [siengine_downloadtool_linux](https://gitlab.com/siengine-ubuntu-sdk/tools/-/blob/test/siengine_downloader/siengine_downloadtool_linux_V7.6.2.tar.gz?ref_type=heads)
- 我们提供了一个简单的烧录脚本[burn.sh](https://gitlab.com/siengine-ubuntu-sdk/tools/-/blob/test/siengine_downloader/burn.sh?ref_type=heads)用于linux 用户下载 Sirider S1 的镜像，请将脚本复制到解压后`siengine_download_tool` 工具所在目录，并将SDK `depoly/build` 下生成的文件复制到同级目录下，执行以下命令，更多命令请查看脚本内容。

```shell
$ ./burn.sh all # 烧录所有LUN
$ ./burn.sh lun0 # 烧录单个LUN
```
windows 用户：

下载windows平台烧录工具[siengine_downloadtool](https://gitlab.com/siengine-ubuntu-sdk/tools/-/blob/test/siengine_downloader/siengine_downloadtool_V7.6.3.rar?ref_type=heads)

更多内容请参考文档 [UG_SE1000_Download_Tool_User_Guide.pdf](https://dl.radxa.com/sirider/s1/siengine_downloadtool_V7.5/UG_SE1000_Download_Tool_User_Guide.pdf)
