---
sidebar_position: 1
---

# Windows 主机

## 文件下载

### Loader 下载

进入[资源下载汇总](../../../download)页面下载对应的 Loader 文件。

### 系统镜像下载

进入[资源下载汇总](../../../download)页面下载对应的操作系统镜像压缩包,下载完成后解压系统镜像压缩包，得到的 `*.img` 后缀文件就是后面安装系统镜像需要的文件。

:::tip
下载的系统镜像是一个压缩文件，需要解压后才能通过镜像烧录软件写入到 eMMC
:::

## 硬件连接

### 所需设备

- 一根 USB Type-A 转 USB Type-C 数据线
- 一个插针或者一根牙签
- 12V/2A DC电源适配器（ DC5525 ）

### 进入 Maskrom 模式

:::tip
Maskrom 模式是嵌入式设备的“硬件急救箱”，通过直接操作芯片底层接口实现设备修复。

Maskrom 模式是 Rockchip 芯片内置的底层恢复模式，当设备无法从任何启动介质( eMMC、 SD 卡等)加载有效引导程序时自动进入。

此模式允许通过 RockUSB 协议重新烧写设备固件。
:::

Radxa E24C 有一个专用的 Maskrom 按键，在系统启动过程中检测到该键被按下，系统会自动进入 Maskrom 模式！

1. 使用 USB Type-C 接口连接 Radxa E24C，USB Type-A 连接 PC

2. 使用插针或者牙签按住 Maskrom 按键

3. 插上 12V/2A DC 电源适配器

4. 松开 Maskrom 按键

正常情况下进入 Maskrom 模式电源指示灯会常亮，若现象不符合，可以重新按照步骤进行操作！

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/e24c-maskrom.webp" style={{width: '80%', maxWidth: '700'}} />
</div>

## 安装系统到 eMMC

### Maskrom 设备识别

:::tip
有关 RKDevTool 工具的使用，可以参考[RKDevTool使用](./rkdevtool)
:::

打开 RKDevTool 工具，软件会自动检测进入 Maskrom模式的设备。

- 若检测到 Maskrom 设备，可以进行下一步操作

- 若没有检测到 Maskrom 设备，可以重复进入 Maskrom 模式操作

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-06.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

### 安装系统

在 RKDevTool 分别进行以下操作：

- ① : 选择 Loader 文件
- ② : 选择系统镜像
- ③ : 选择 eMMC 系统存储介质
- ④ : 勾选 `Write by Address`
- ⑤ : 开始执行操作(写入 Loader 和系统)
- ⑥ : 操作反馈的信息

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-07.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

### 使用系统

参考[快速上手](../../introduction)教程的登陆系统操作！
