---
sidebar_position: 7
---

# 中文环境

介绍如何在 瑞莎 ROCK 4D 上配置中文语言和系统时区。

:::tip
整个系统并没有完全支持中文，部分系统选项的 UI 语言还是英文
:::

## 配置中文语言

设置中文环境需要先将系统语言设置为中文。

① : 点击 `System Settings`

② : 点击 `Regional Settings`

③ : 修改语言

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/chinese-env-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

将 `Language` 设置为 `简体中文`：

① ： 改变语言

② ： 选择简体中文

③ ： 应用修改后的语言选项

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/chinese-env-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

修改语言后，需要重启系统才能生效；我们可以将时间修改成北京时间，最后重启系统。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/chinese-env-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 配置时区

将系统时间修改成北京时间。

① ： 选择 `Regional Settings` 的 `Date & Time` 选项

② ： 选择 `Time Zone` 选项

③ ： 选择 `Area` 是 `Shanghai` , `Region` 是 `Asia/China` 的选项

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/chinese-env-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

配置好中文语言和时区后，终端输入下面命令重启系统：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo reboot
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
设置成功后的效果图
  <img src="/img/rock4/4d/chinese-env-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
