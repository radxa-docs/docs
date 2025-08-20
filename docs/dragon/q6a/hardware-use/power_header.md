---
sidebar_position: 2
---

# 电源接口

瑞莎 Dragon Q6A 支持三种供电方式：

① 通过标准 12V Type-C 接口供电（推荐）

② 通过 12V 外部电源输入接口供电

③ 通过 PoE+ HAT 供电（此处不介绍）

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_power.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

## 硬件连接

### 通过 12V USB Type-C 接口供电（推荐）

使用标准 12V USB Type-C 电源适配器（兼容 PD 协议）连接到主板的 USB Type-C 接口。

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
- 标准 12V Type-C 电源适配器，建议电流 2A 以上
  :::

### 通过 12V 外部电源输入接口供电

使用 12V 电源的正极和负极连接到主板的 12V 和 GND 引脚。

:::danger
请勿接错或者接反电源，不当操作可能导致设备硬件损坏。
:::

## 正常启动

系统正常启动后，绿色的电源指示灯常亮，蓝色的电源指示灯闪烁。

## 接口引脚定义

可以参考 [资源汇总下载](../download) 页面的硬件原理图。
