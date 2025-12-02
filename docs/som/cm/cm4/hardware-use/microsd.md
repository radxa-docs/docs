---
sidebar_position: 2
---

# MicroSD 卡槽

瑞莎 CM4 IO 板板载 MicroSD 卡槽，兼容 MicroSD / MicroSDHC / MicroSDXC 卡，可用作系统启动盘或扩展存储空间。

## 硬件连接

将 MicroSD 卡槽安装到瑞莎 CM4 IO 板的 MicroSD 卡槽上。

:::tip 接口位置
可以参考 [硬件信息](./hardware_info.md) 教程找到对应硬件接口位置
:::

## 使用指南

MicroSD 卡可以作为系统启动介质，也可以作为扩展存储空间。

### 系统启动介质

MicroSD 卡存在正常启动的系统时，瑞莎 CM4 会默认从 MicroSD 卡启动系统。

### 拓展存储空间

通过其他系统启动介质启动系统或者将 MicroSD 卡启动优先级降低，不通过 MicroSD 卡启动系统。

:::tip 引导说明
对于部分主板，可以通过软件设置系统引导顺序，将其它系统启动介质的系统作为启动盘
:::

## 接口引脚定义

可以参考 [资源汇总下载](../download.md) 页面的硬件原理图。
