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

若输出为其他会话类型，可以在登录界面的右下角选择 **GNOME (Wayland)** 会话（避免选择 Xorg），然后重新登录。

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

添加 PSI 参数。

### 编辑启动参数

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo cp /etc/kernel/cmdline /etc/kernel/cmdline.bak
grep -q 'psi=1' /etc/kernel/cmdline || sudo sed -i 's/$/ psi=1/' /etc/kernel/cmdline
```

</NewCodeBlock>

## 更新启动项

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo kernel-install add $(uname -r) /boot/vmlinuz-$(uname -r)
```

</NewCodeBlock>

最后，重启系统。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo reboot
```

</NewCodeBlock>

## 初始化 Waydroid

首次使用需要初始化 Waydroid，可以点击 Waydroid 图标或者终端使用命令初始化。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo waydroid init
```

</NewCodeBlock>

初始化 Waydroid 会自动下载 `system.img` 和 `vendor.img`。

:::tip 手动初始化 Waydroid

若自动初始化 Waydroid 失败，下载缓慢，可以手动下载 system/vendor 的压缩包并解压到 `/etc/waydroid-extra/images` 目录。

- 获取下载 URL

复制下面 json 文件里面下载 URL，`system.img` 和 `vendor.img` 的下载时间日期需要对应，不然可能出现闪退现象。

[system.img](https://ota.waydro.id/system/lineage/waydroid_arm64/VANILLA.json)

[vendor.img](https://ota.waydro.id/vendor/waydroid_arm64/MAINLINE.json)

- 解压镜像压缩包

打开终端并进入下载的文件目录，将下载的 system/vendor 压缩包解压到 `/etc/waydroid-extra/images` 目录。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo mkdir -p /etc/waydroid-extra/images
sudo unzip lineage-*-system.zip -d /etc/waydroid-extra/images
sudo unzip lineage-*-vendor.zip -d /etc/waydroid-extra/images
rm lineage-*-system.zip lineage-*-vendor.zip
```

</NewCodeBlock>

- 重新初始化 Waydroid

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo waydroid init -f
```

</NewCodeBlock>

:::

## 启动 Waydroid

初始化完成后，启动 Waydroid 容器服务。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo systemctl enable --now waydroid-container
```

</NewCodeBlock>

然后启动 Waydroid 会话并打开界面。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
waydroid session start
waydroid show-full-ui
```

</NewCodeBlock>

## 安装 Android 应用

打开终端并进入安装包所在位置，通过命令行安装 Android 应用。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
waydroid app install xyz.apk
```

</NewCodeBlock>

安装完成后，应用会自动出现在应用菜单中。
