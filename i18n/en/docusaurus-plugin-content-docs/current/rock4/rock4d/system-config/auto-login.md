---
sidebar_position: 0
---

# Auto Login

Auto login automatically logs in to the system username at startup without requiring manual password entry.

:::tip
After enabling auto login, you may experience a black screen when using VNC remote control. It is recommended to enable auto login only for users with a direct display connection.

If you need to use VNC remote control, you may want to disable the auto login feature.
:::

## Enable Auto Login

Enter the `rsetup` command in the terminal to enable auto login using the Rsetup tool:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
rsetup
```
</NewCodeBlock>

1. Use the arrow keys to select the `User Settings` option, then press Enter to confirm.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-auto-login-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. Use the arrow keys to select the `Configure auto login` option, then press Enter to confirm.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-auto-login-2.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Use the arrow keys to select the `Enable auto login` option, press Space to check `gdm.service`, then press Enter to confirm.

:::tip
A `*` in the checkbox indicates the option is enabled.
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-auto-login-3.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

4. Reboot the system for the auto login configuration to take effect.
