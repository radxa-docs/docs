---
sidebar_position: 9
---

# 自动登录

我们需要修改显示管理器的配置文件，以实现桌面自动登录。

:::tip
设置桌面自动登录可以避免每次启动系统都需要输入用户名和密码。
:::

## 确认显示管理器

打开终端，运行以下命令可以确认当前系统使用的显示管理器。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
cat /etc/X11/default-display-manager
```
</NewCodeBlock>

终端会输出显示管理器的路径：

```
/usr/sbin/lightdm
```

表示当前系统使用的是 LightDM 显示管理器。

## 修改显示管理器配置

打开 LightDM 配置文件，修改自动登录配置。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo vi /etc/lightdm/lightdm.conf
```
</NewCodeBlock>

将以下内容取消注释并修改为当前用户名：

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
autologin-user=radxa
autologin-user-timeout=0
```
</NewCodeBlock>

保存文件并退出编辑器。

## 重启显示管理器

使用以下命令重启显示管理器。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo systemctl restart lightdm
```
</NewCodeBlock>
或者直接使用命令重启系统观察自动登录效果。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo reboot
```
</NewCodeBlock>

## 验证效果

重启系统后，观察是否自动进入桌面环境，无需手动输入用户名和密码。
