---
sidebar_position: 9
---

# Waydroid 使用指南

Waydroid 是一个基于 Wayland 的 Android 桌面环境，可以在 Dragon Q6A 上运行 Android 应用。

Waydroid 通过容器方式运行完整 Android 系统，并与桌面环境深度集成，使 Android 应用像原生应用一样运行。

:::tip

- [Waydroid 官方文档](https://docs.waydro.id/)
  :::

## 使用前提

Waydroid 只能在 Wayland 窗口系统下运行，可以使用命令检查当前会话类型。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
echo $XDG_SESSION_TYPE
```

</NewCodeBlock>

输出结果为 `wayland` 时，说明当前会话类型为 Wayland，可以运行 Waydroid。

若输出为其他会话类型，可以在登录界面的右下角选择 GNOME 桌面环境，然后重新登录。

## 安装 Waydroid

### 添加 Waydroid 仓库

添加 Waydroid 官方仓库。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
curl -s https://repo.waydro.id | sudo bash
```

</NewCodeBlock>

### 安装 Waydroid

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo apt update
sudo apt install waydroid -y
```

</NewCodeBlock>

## PSI 内核参数

如果启动 Android 时卡在开机动画，可添加 PSI 参数。

### 编辑启动参数

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo sed -i 's/$/ psi=1/' /etc/kernel/cmdline
```

</NewCodeBlock>

## 更新启动项

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo kernel-install add $(uname -r) /boot/vmlinuz-$(uname -r)
```

</NewCodeBlock>

最后，重启系统。

## 初始化 Android 系统

首次使用需要初始化系统镜像，可以点击 Waydroid 图标或者终端使用命令初始化。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo waydroid init
```

</NewCodeBlock>

初始化系统镜像会自动下载 system.img 和 vendor.img，下载的镜像文件会位于 `/var/lib/waydroid/images` 目录。

## 安装 Android 应用

通过命令行安装 Android 应用。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
waydroid app install xxx.apk
```

</NewCodeBlock>

安装完成后，应用会自动出现在 Linux 桌面应用菜单中。
