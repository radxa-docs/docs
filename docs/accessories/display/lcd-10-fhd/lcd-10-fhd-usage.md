---
sidebar_position: 2
---

# 瑞莎 10 寸高清触摸屏使用指南

我们需要使用专门的排线链接主板和触摸屏，确认硬件连接正确后，使用 Rsetup 工具使能 10 寸显示屏。

## 硬件准备

- FPC 排线
- 瑞莎 10 寸高清触摸屏
- 适配的主板

## 硬件连接

使用主板的 MIPI DSI 接口连接触摸屏，连接方式如下：以 ROCK 4D 为例，其它主板类似

①： 连接主板的 MIPI DSI 接口，金手指（金属接触点）朝向主板方向

②： 连接显示器的接口，金手指（金属接触点）朝向显示器方向

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-dsi.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 软件配置

在终端命令行输入 `rsetup` 命令，使用 Rsetup 工具设置显示器选项。

<NewCodeBlock tip="radxa@device$" type="device">
```
rsetup
```
</NewCodeBlock>

1. 通过方向键选择 `Overlays` 选项，然后按回车键确认选择。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-overlays-dsi-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. 通过方向键选择 `Manage overlays` 选项，然后按回车键确认选择。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-overlays-dsi-2.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. 通过方向键选择 `Enable Radxa Display 10 HD` 选项，然后按空格键勾选 `Enable Radxa Display 10HD` 选项，最后按回车确认选择。

:::tip
选项框中出现 `*` 表示该选项已启用
:::

4. 重启系统，配置生效，显示器会正常显示。
