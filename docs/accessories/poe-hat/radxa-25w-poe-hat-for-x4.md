---
sidebar_label: "Radxa 25W PoE+ HAT for X4"
sidebar_position: 1
---

# 瑞莎 25W PoE+ HAT for X4

Radxa 25W PoE+ HAT for X4 专为 Radxa X4 设计，可为其提供以太网供电（PoE+）功能，支持通过网线同时实现数据通信和电力传输。

:::info
需搭配使用兼容的以太网供电设备。
:::

![25W PoE for X4](/img/accessories/poe-hat/25w-poe-hat-for-x4-01.webp)

## 兼容性

Radxa 25W PoE+ HAT for X4 专为以下产品设计：

- Radxa X4
- Radxa Dragon Q6A

## 功能

- 符合 IEEE 802.3at 标准
- 宽输入电压范围：37V ～ 57V
- 输出：5V/4.8A、12V/2.1A
  - 仅连接 5V 负载时，PoE 输出高达 5V DC / 4.8A
  - 仅连接 12V 负载时，PoE 输出高达 12V DC / 2.1A
- 配备可编程温度传感器
- 配备 1.45CFM 的可定制冷却风扇，用于处理器冷却
  - 尺寸：20 x 20 毫米
  - 转速：15000 ± 15%RPM
- 12V 电源输出
  - 1x 2-Pin 3.5 mm 间距可插拔接线端子
- 工作温度范围：0°C 至 +50°C

## 接口说明

- ① : 12V DC 输出
  - 1x 2-Pin 3.5 mm 间距可插拔接线端子
- ② : PoE 接口
- ③ : 40-Pin GPIO 接口

![25W PoE for X4 pinout](/img/accessories/poe-hat/25w-poe-hat-for-x4-02.webp)

## 使用方法

瑞莎 25W PoE+ HAT for X4 的包装清单如下：

- 瑞莎 25W PoE+ HAT for X4
- 4x M2.5x9+6 铜柱
- 4x M2.5x4+6 铜柱
- 4x M2.5x5 铜柱

:::tip
如果要与瑞莎 X4 散热器一起使用，只需将 M2.5x9 + 6 铜柱替换为 M2.5x9 + 3 铜柱。
:::

### 安装步骤

1. 将四根 M2.5x9+6 铜柱或 M2.5x9+3 铜柱（如果使用散热器）穿过 SBC 的四个定位孔，并从底部固定。

2. 将瑞莎 25W PoE+ HAT for X4 与 PoE 接口和 40 针接口对齐，并确保 12V 供电接口对齐，小心插入，确保穿过四个铜柱。

3. 在瑞莎 25W PoE+ HAT for X4 的顶部，使用 M2.5x4+6 铜柱或 M2.5x5 铜柱固定到位。

4. 连接以太网线到 PoE 接口，确保另一端连接到支持 PoE+ 的交换机。

  <Tabs queryString="model">
    <TabItem value="x4" label="Radxa X4">

    ![25W PoE x4](/img/accessories/poe-hat/25w-poe-hat-for-x4-x4.webp)

    </TabItem>
    <TabItem value="q6a" label="Dragon Q6A">

    ![25W PoE q6a](/img/accessories/poe-hat/25w-poe-hat-for-x4-q6a.webp)

    </TabItem>

  </Tabs>

## 资料下载

### 产品资料

- [原理图 V1.2](https://dl.radxa.com/accessories/25w-poe/radxa_25w_poe_plus_hat_v1.2_schematic.pdf)
- [3D 文件](https://dl.radxa.com/accessories/25w-poep-hat-for-x4/radxa_25w_poe+_hat_for_x4_v1.2_3d_stp_20241127.zip)
