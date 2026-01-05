---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用 Cubie A7Z 主板。

## 产品实物

<div style={{textAlign: 'center'}}>
   Cubie A7Z 正面
   <img src="/img/cubie/a7z/a7z-bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
   Cubie A7Z 背面
   <img src="/img/cubie/a7z/a7z-top.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

您需要提前准备以下硬件设备：

- 主板：瑞莎 Cubie A7Z
- 系统启动介质：MicroSD 卡（推荐使用）
- 电源适配器：5V USB-C 电源适配器

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
- [瑞莎散热片适配 Cubie A7Z](https://radxa.com/products/accessories/heatsink-6530b)
  :::

:::warning

由于主板散热能力有限，长时间或高负载运行时 SoC 可能过热降频并导致系统不稳定。建议安装合适的散热片以提高散热、保障稳定运行。

:::

## 安装系统

您可以根据自己的系统启动介质和拥有的硬件设备，参考下面教程进行系统安装：

- [安装系统到 MicroSD 卡](./install-system/microsd)
- [安装系统到板载 UFS](./install-system/ufs)

## 启动系统

完成系统的安装后，需要将对应的系统启动介质安装到 Cubie A7Z 上

<Tabs queryString="system boot">
<TabItem value="MicroSD 卡">

将 MicroSD 卡插入 Cubie A7Z 的 MicroSD 卡槽，然后将 Cubie A7Z 插入 5V USB-C 电源适配器，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7z/a7z-microsd-boot.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="板载 UFS">

若你的主板是含有板载 UFS 的版本，无需安装，直接插上 5V USB-C 电源适配器，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7z/a7z-ufs-boot.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>
</Tabs>

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- Radxa OS

用户账号：radxa

用户密码：radxa

## 系统使用

### 有屏模式

对于有显示器的用户，可以使用 USB-C 转 HDMI / DP 线连接显示器，搭配鼠标和键盘操作系统。

### 无屏模式

对于无显示器的用户，可以通过以下方式登录系统：

1. 使用 USB 串口数据线连接电脑，通过串口查看系统日志和登录系统操作。

2. 修改系统配置文件，让系统自动连接到无线网络，然后进入路由器的管理界面查看 IP 地址，通过 SSH 登录系统。
