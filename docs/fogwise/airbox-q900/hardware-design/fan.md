---
sidebar_position: 12
---

# 风扇接口

瑞莎 Fogwise® AIRbox Q900 板载风扇接口，用于连接风扇。

:::tip 金属外壳

瑞莎 Fogwise® AIRbox Q900 金属外壳内置 PWM 风扇。

:::

## 硬件连接

将金属外壳的 PWM 风扇接口连接到瑞莎 Fogwise® AIRbox Q900 的风扇接口。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-fan-connect.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 软件使能

使用瑞莎系统自带的 Rsetup 工具使能风扇，并推荐使用温控控制风扇散热。

:::tip Rsetup 使用指南

- 选中选项 ： 对应选项会高亮显示
- 确认选择 ： 按 `Enter`
- 取消选择 ： 按 `ESC`
- 切换选项 ： 按 `Up` 、 `Down` 、 `Left` 、 `Right` 控制
- 多选界面 ： 按 `Space` 选择，按 `Enter` 确认选择；选择对应功能后，对应选项框会出现一个 `*` ,表示该选项已启用

:::

在终端命令行运行 `rsetup` 命令启动 Rsetup 工具：

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```bash
rsetup
```

</NewCodeBlock>

在 Rsetup 工具中依次进入 `Hardware` -> `Thermal governor`。

1. 通过方向键找到 [ ] `step_wise` 选项
2. 按空格出现 [*] `step_wise` 说明已选中该功能
3. 按 `Enter` 确认并保存设置，使能风扇温控方式。
