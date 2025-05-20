---
sidebar_position: 1
---

# 安装系统到 MicroSD 卡

## 1. 系统下载

进入[资源下载汇总](../../download)页面下载对应的操作系统镜像压缩包,下载完成后解压系统镜像压缩包，得到的 `*.img` 后缀文件就是后面安装系统镜像需要的文件。

:::tip
下载的系统镜像是一个压缩文件，需要解压后才能通过镜像烧录软件写入到 SD 卡
:::

## 2. 硬件连接

将 MicroSD 卡插入读卡器中，然后将读卡器插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-sd-insert.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## 3. 镜像烧录工具

我们推荐使用瑞莎合作伙伴 Balena 开发的开源镜像烧录工具 Etcher，该软件使用简单，功能强大，支持 Windows/Linux/macOS 系统使用。

### 3.1 使用Etcher

进入官网下载系统对应平台的软件：[balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

进入下载页面后，选择对应的系统平台进行 Etcher 软件下载。

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

:::tip
Windows 和 Linux 只需要打开对应程序就可以使用，无需安装！
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-down-etcher-00.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

### 3.2 安装系统镜像

- 选择主板对应的系统镜像

点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- 选择MicroSD卡对应的磁盘

点击 `Select target` 选项，选择自己接入 PC 的读卡器对应磁盘设备。

:::danger
请勿选错磁盘，否则 Etcher 将格式化被选中的磁盘，造成重要数据丢失！
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

① ： 选择需要安装系统镜像的磁盘设备

② ： 点击 `Select 1` 选项确认设备选择

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- 开始写入系统镜像

点击 `Flash` 选项，等待软件自动进行系统镜像的写入和校验。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-04.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统写入完成
  <img src="/img/e/e24c/etcher-05.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统校验完成
  <img src="/img/e/e24c/etcher-07.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

成功写入系统镜像后，关闭 Etcher 软件！

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-06.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## 4. 启动系统

在 MicroSD 卡上完成系统镜像的写入后，我们可以将读卡器上的 MicroSD 卡装入 Radxa E24C 的 MicroSD 卡槽中，然后使用 12V DC 电源适配器启动系统。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-insert-sd.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## 5. 系统信息

我们提供 Debian Linux 和 OpenWrt 两大操作系统，用户根据自己的系统使用对应的用户名和密码进行系统登陆。

- Debian Linux

用户账号：radxa

用户密码：radxa

- OpenWrt

用户账号：root

用户密码：password
