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

:::tip
当前文档只提供了windows下的系统烧录方式
:::

请参考文档 [UG_SE1000_Download_Tool_User_Guide.pdf](https://dl.radxa.com/sirider/s1/siengine_downloadtool_V7.5/UG_SE1000_Download_Tool_User_Guide.pdf)
