---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用 Cubie A7Z 的 Android 系统。

# 产品实物

<div style={{textAlign: 'center'}}>
   Cubie A7Z 正面
   <img src="/img/cubie/a7z/a7z-bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
   Cubie A7Z 背面
   <img src="/img/cubie/a7z/a7z-top.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

您需要提前准备以下硬件设备：

- 主板：瑞莎 Cubie A7A
- 系统启动介质：MicroSD 卡
- 读卡器：MicroSD 卡读卡器
- 电源适配器：5V Type-C 电源适配器

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## 硬件连接

将 MicroSD 卡插入读卡器中，然后将读卡器插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 软件准备

给 MicroSD 卡烧录 Phoenix 系统镜像需要用到全志平台提供的工具，该工具可以去[ 资源汇总下载 ](../../download)页面下载软件。

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

## 启动系统

完成系统的安装后，将 MicroSD 卡插入 Cubie A7Z 的 MicroSD 卡槽，然后将 Cubie A7Z 插入 5V USB-C 电源适配器，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7z/a7z-microsd-boot.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
