---
sidebar_position: 6
---

# 应用使用

介绍如何在瑞莎 Cubie A7A 上使用 dpkg 和 apt 命令安装和使用应用。

- dpkg 命令

主要用于安装本地 deb 包。

- apt 命令

主要用于从软件源安装软件包。

## 社交应用

### QQ

#### QQ 介绍

QQ 是一款由腾讯开发的即时通讯软件，支持文字、图片、语音、视频等多种沟通方式。

#### QQ 安装

通过[腾讯 QQ 官网](https://im.qq.com/linuxqq/index.shtml)下载 arm64 架构的 deb 包，然后通过 dpkg 安装。

:::caution

您可以通过 `uname -a` 命令查看当前系统的架构。

Cubie A7A 的架构是 aarch64（arm64）。

:::

将实际下载的 deb 包名称替换到命令中。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo dpkg -i QQ_xxx_arm64.deb
```
</NewCodeBlock>

#### QQ 使用

双击 QQ 图标或者终端命令行运行下面命令启动。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
qq
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-qq.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 办公应用

### LibreOffice

#### LibreOffice 介绍

LibreOffice 是一款由文档基金会（The Document Foundation）开发的免费开源跨平台办公软件，支持文字处理、电子表格、演示文稿、矢量绘图、数据库管理、公式编辑等多种办公需求，兼容 Microsoft Office 格式。

#### LibreOffice 安装

通过 apt 安装 LibreOffice。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo apt update
sudo apt install libreoffice
```
</NewCodeBlock>

#### LibreOffice 使用

在应用搜索栏输入 `LibreOffice`，然后选择对应软件启动。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-office.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
