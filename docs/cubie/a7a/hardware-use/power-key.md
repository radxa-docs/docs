---
sidebar_position: 4
---

# 电源按键

瑞莎 Cubie A7A 板载电源按键，用于控制 Cubie A7A 的电源。

:::tip
电源按键具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 使用指南

若 Cubie A7A 正常供电，电源指示灯（绿色）会亮起；断电或关机时，电源指示灯（绿色）熄灭。

- 短按电源按键：- 默认情况 - 未连接显示器，短按电源按键直接关机；- 连接显示器，短按电源按键弹出电源菜单选项。- 自定义功能 - 通过 `① : System Settings` -> `② : Power Management` -> `③ : Energy Saving` -> `④ : Button events handling` 选项，可以自定义电源按键的功能，最后点击 `⑤ : Apply` 保存设置。
<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/power-button-function.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

- 长按电源按键：

触发 Cubie A7A 的重启。

## 接口规格

:::info 技术参考
完整的技术规格和引脚定义可参考下载专区的 [硬件设计：原理图](../download) 文档
:::
