---
sidebar_position: 11
---

# 单独升级内核

本教程介绍如何只升级内核，而不升级整个系统。

## 升级内核

如果只想单独升级内核，而不升级整个系统，可以执行以下命令：

<NewCodeBlock tip="radxa@radxa-dragon-q8b$" type="device">

```bash
sudo apt update
sudo apt install linux-image-radxa-dragon-midstream linux-headers-radxa-dragon-midstream
```

</NewCodeBlock>

安装完成后，重启系统使新内核生效：

<NewCodeBlock tip="radxa@radxa-dragon-q8b$" type="device">

```bash
sudo reboot
```

</NewCodeBlock>

## 验证内核版本

重启后，可以使用以下命令确认当前内核版本：

<NewCodeBlock tip="radxa@radxa-dragon-q8b$" type="device">

```bash
uname -r
```

</NewCodeBlock>
