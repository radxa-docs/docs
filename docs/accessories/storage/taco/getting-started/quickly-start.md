---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用瑞莎 Taco 产品。

## 产品外观

| 序号 |    视图     | 序号 |    视图     | 序号 |    视图     |
| :--: | :---------: | :--: | :---------: | :--: | :---------: |
|  左  | Taco 正视图 |  中  | Taco 侧视图 |  右  | Taco 背视图 |

<div style={{textAlign: 'center'}}>
  <img src="/img/accessories/taco/radxa-taco-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

您需要提前准备以下硬件设备：

- 载板：瑞莎 Taco
- 核心板：树莓派 CM5
- 供电：12V DC 电源适配器
- 显示设备：HDMI 数据线和显示器
- 输入设备：USB 键盘和鼠标

说明：若树莓派 CM5 无板载 eMMC，需要额外准备 MicroSD 卡用于系统安装。

:::tip 推荐配件

- [瑞莎 DC12V 60W 电源适配器(推荐使用)](https://radxa.com/products/accessories/power-dc12-60w)
- 标准 12V DC 电源适配器，建议电流 3A 及以上

:::

## 安装系统

请根据树莓派 CM5 是否有板载 eMMC，选择不同的安装方式：

- 若树莓派 CM5 有板载 eMMC，参考 [安装系统到 eMMC](./install-system/emmc-system) 教程
- 若树莓派 CM5 无板载 eMMC，需要安装系统到 MicroSD 卡，参考 [安装系统到 MicroSD 卡](./install-system/sd-system) 教程

## 启动系统

<Tabs queryString="emmc">

<TabItem value="树莓派 CM5 有板载 eMMC">

完成系统安装后，使用 12V DC 电源适配器给瑞莎 Taco 供电，系统将从 eMMC 启动。

</TabItem>

<TabItem value="树莓派 CM5 无板载 eMMC">

完成系统安装后，将 MicroSD 卡安装到瑞莎 Taco 的 microSD 卡槽中，然后使用 12V DC 电源适配器给瑞莎 Taco 供电，系统将从 MicroSD 卡启动。

</TabItem>

</Tabs>

系统启动正常后，电源指示灯绿色亮起。

## 使用系统

将显示器、键盘、鼠标连接到瑞莎 Taco，根据系统提示完成初始设置，即可开始使用。

说明：由于瑞莎 Taco 和树莓派 CM5 搭配使用，发热较大，建议安装散热器提升散热效果。
