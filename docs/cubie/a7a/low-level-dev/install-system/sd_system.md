---
sidebar_position: 1
---

# 安装系统到 MicroSD 卡

主要介绍如何将系统安装到 MicroSD 卡中。

:::warning
安装系统会格式化 MicroSD 卡，如果有重要数据请提前备份！
:::

## 硬件准备

您需要提前准备以下硬件：

- 开发板：瑞莎 Cubie A7A
- 系统启动介质：MicroSD 卡
- 读卡器：MicroSD 卡读卡器
- 电源适配器：5V Type-C 电源适配器

:::tip
推荐配件：

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## 硬件说明

Cubie A7A 主板支持标准 PD 协议的 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

- 电源适配器

当系统镜像烧录到 MicroSD 卡后，可以使用 Type-C 电源适配器给 Cubie A7A 供电，避免后期开发功率不足的问题。

## 硬件连接

将 MicroSD 卡插入读卡器中，然后将读卡器插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 软件准备

给 MicroSD 卡烧录系统镜像需要用到全志平台提供的工具，该工具可以去[ 资源汇总下载 ](../../download)页面下载软件。

**PhoenixCard**：基于 Windows 平台的工具，可以用来制作 MicroSD 卡启动盘。

## 安装系统

解压下载的 PhoenixCard 压缩包，进入 PhoenixCard 目录，以管理员身份运行 `PhoenixCard.exe` 程序。

① : 选择 `Image` 选项，找到系统镜像对应的文件（选择实际解压的系统文件）

② : 选择 `Start up` 选项，表示制作的卡种类选择为启动卡

③ : 勾选 MicroSD 卡对应的磁盘选项

④ : 点击 `Burn` 按钮开始制作启动盘

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-phoenixcard-windows.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

等待软件烧录完成，烧录完成后，可以关闭 PhoenixCard 工具。

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统；

出厂系统镜像默认存在两个用户账号，分别是 `root` 和 `radxa`。

- root

用户账号：root

用户密码：radxa

- radxa

用户账号：radxa

用户密码：radxa
