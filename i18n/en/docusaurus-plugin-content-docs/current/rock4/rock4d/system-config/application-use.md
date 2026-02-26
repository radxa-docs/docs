---
sidebar_position: 6
---

# Application Usage

This guide explains how to install and use applications on the Radxa ROCK 4D using the dpkg and apt commands.

- **dpkg command**

  Primarily used for installing local .deb packages.

- **apt command**

  Primarily used for installing packages from software repositories.

## Social Applications

### QQ

#### About QQ

QQ is an instant messaging software developed by Tencent, supporting various communication methods including text, images, voice, and video.

#### Installing QQ

Download the arm64 architecture deb package from the [Tencent QQ official website](https://im.qq.com/linuxqq/index.shtml), then install it using dpkg.

:::caution

You can check your system's architecture using the `uname -a` command.

ROCK 4D's architecture is aarch64 (arm64).

:::

Replace the actual downloaded deb package name in the command.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo dpkg -i QQ_xxx_arm64.deb
```
</NewCodeBlock>

#### Using QQ

Double-click the QQ icon or run the following command in the terminal to start.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
qq
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/qq.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Office Applications

### LibreOffice

#### About LibreOffice

LibreOffice is a free, open-source, cross-platform office suite developed by The Document Foundation. It supports various office needs including word processing, spreadsheets, presentations, vector graphics, database management, and formula editing. It is compatible with Microsoft Office formats.

#### Installing LibreOffice

Install LibreOffice using apt.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo apt update
sudo apt install libreoffice
```
</NewCodeBlock>

#### Using LibreOffice

Type `LibreOffice` in the application search bar, then select the corresponding application to launch it.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/libreoffice.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
