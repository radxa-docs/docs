---
sidebar_position: 7
---

# 常见问题

## 打开串口设备失败

若打开串口出现 `Error: Permission denied, cannot open /dev/ttyUSB0` 错误提示！

您可以按照以下步骤排查问题：

1. 检查串口设备是否正确连接 PC

2. 检查串口设备权限

以 Linux 系统为例，若串口设备权限不足，您需要在终端命令行运行以下命令，让当前用户有权限访问设备。

- 查看串口设备信息

以 `/dev/ttyUSB0` 作为演示：

<NewCodeBlock tip="Linux$" type="host">

```
ls -l /dev/ttyUSB0
```

</NewCodeBlock>

若系统存在该设备，您会看到类似以下的输出：

```
crw-rw---- 1 root dialout 188, 0 Sep 10 21:24 /dev/ttyUSB0
```

- 添加当前用户到 `dialout` 组

<NewCodeBlock tip="Linux$" type="host">

```
sudo usermod -a -G dialout $USER
```

</NewCodeBlock>

- 重新登录

<NewCodeBlock tip="Linux$" type="host">

```
newgrp dialout
```

</NewCodeBlock>

3. 检查串口设备是否被其他程序占用

## 为什么 Radxa OS 默认使用 GDM 而不是 SDDM？

Radxa OS 默认使用 GDM（GNOME Display Manager）替代 SDDM（Simple Desktop Display Manager），主要原因如下：

**SDDM 的局限性：**

- 在 HDMI 未连接的 headless 模式下，SDDM 无法正常启动图形界面
- 这会导致用户无法通过远程桌面或 VNC 等方式登录系统

**GDM 的优势：**

- 在各种连接状态下（包括 headless 模式）都能稳定运行
- 提供更好的兼容性和可靠性

如果您希望切换回 SDDM，请按以下步骤操作：

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo dpkg-reconfigure sddm
```

</NewCodeBlock>

在弹出的配置界面中，选择 `sddm` 作为默认显示管理器，然后重启系统即可使更改生效。

## 网络连接出现自动断开的现象

可以修改 `/usr/share/glib-2.0/schemas/org.gnome.settings-daemon.plugins.power.gschema.xml` 文件的参数，禁用休眠时间。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
vim /usr/share/glib-2.0/schemas/org.gnome.settings-daemon.plugins.power.gschema.xml
```

</NewCodeBlock>

修改文件中的 `sleep-inactive-ac-timeout` 和 `sleep-inactive-battery-timeout` 参数默认值为 `0`，然后重启系统即可使更改生效。
