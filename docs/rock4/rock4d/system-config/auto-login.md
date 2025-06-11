---
sidebar_position: 0
---

# 自动登录

自动登录是指系统启动时自动登录系统用户名，无需手动输入密码进入系统。

:::tip
设置系统自动登录后，VNC 远程控制系统可能会出现黑屏现象，建议使用显示器的用户启用自动登录功能。

若需要使用 VNC 远程控制系统，可以禁用自动登录功能。
:::

## 启用自动登录

在终端命令行输入 `rsetup` 命令，使用 Rsetup 工具启用自动登录功能：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
rsetup
```
</NewCodeBlock>

1. 通过方向键选择 `User Settings` 选项，然后回车确认选择。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-auto-login-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. 通过方向键选择 `Configure auto login` 选项，然后回车确认选择。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-auto-login-2.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. 通过方向键选择 `Enable auto login` 选项，然后按空格勾选 `gdm.service`，最后按回车确认选择。

:::tip
选项框中出现 `*` 表示该选项已启用。
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-auto-login-3.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

4. 重启系统，系统自动登录配置生效。
