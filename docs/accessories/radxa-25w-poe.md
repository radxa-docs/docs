---
sidebar_position: 34
---

# 瑞莎 25W 供电模块

Radxa 25W PoE HAT 可以为与之兼容的 Radxa SBC 添加通过以太网供电启动的能力。

:::info
需搭配使用兼容的以太网供电设备。
:::

![25W PoE](/img/accessories/poe-hat/25w-poe.webp)

## 兼容性

Radxa 25W PoE HAT 支持以下 Radxa 产品：

- Radxa ROCK 3A
- Radxa ROCK 3B
- Radxa ROCK 3C
- Radxa ROCK 4C+
- Radxa ROCK 5A
- Radxa ROCK 5B

## 功能

- 符合 IEEE 802.3af/at 标准
- 输出：5V/4.8A、12V/2.1A
  - 仅连接 5V 负载时，PoE 输出高达 5V DC / 4.8A
  - 仅连接 12V 负载时，PoE 输出高达 12V DC / 2.1A
- 配备可编程温度传感器
- 配备 1.45CFM 的可定制冷却风扇，用于处理器冷却
  - 尺寸：20 x 20 毫米
  - 转速：15000 ± 15%RPM

## 机械尺寸图

![25W PoE MD](/img/accessories/poe-hat/25w-poe-md.webp)

## 使用方法

Radxa 25W PoE 的包装清单如下：

![25W PoE pkg](/img/accessories/poe-hat/25w-poe-pkg.webp)

使用步骤

1. 将四根 M2.5 x 4 铜柱穿过 Radxa SBC 的四个定位孔，并分别固定在 M2.5 x 9 铜柱上，以确保固定牢固。

![25W PoE copper pillars on-board](/img/accessories/poe-hat/copper-pillars-on-board.webp)

2. 将 Radxa 25W PoE HAT 与 PoE 接口和 40 针接口对齐，小心插入，确保穿过四个 M2.5 x 9 铜柱。

![25W PoE connected](/img/accessories/poe-hat/25w-poe-connected.webp)

3. 在 Radxa 25W PoE HAT 的顶部，将四根 M2.5 x 4 铜柱与四根 M2.5 x 9 铜柱对齐，然后旋转固定到位。以下是图解结果：

  <Tabs queryString="model">
    <TabItem value="5a_4c+" label="ROCK 5A, ROCK 4C+">

    ![25W PoE 5A](/img/accessories/poe-hat/25w-poe-5a.webp)

    </TabItem>
    <TabItem value="5b_3b" label="ROCK 5B, ROCK 3B">

    ![25W PoE 5B](/img/accessories/poe-hat/25w-poe-5b.webp)

    </TabItem>
    <TabItem value="3a_3c" label="ROCK 3A, ROCK 3C">

    ![25W PoE 3A](/img/accessories/poe-hat/25w-poe-3c.webp)

    </TabItem>

  </Tabs>

4. 启用 25W PoE Overlay

如需要启用温控风扇以及温度传感器，则需要开启对应 Overlay。

请参照设备树配置，启用名为 "Enable Radxa 25W PoE HAT "的 Overlay。

<!-- 请参照[设备树配置](/radxa-os/rsetup/devicetree#how-to-enable-an-overlay)，启用名为 "Enable Radxa 25W PoE HAT "的 Overlay。 -->

```bash
  [*] Enable Radxa 25W PoE HAT
```

最后，重启设备以加载 Overlay。

:::info
如果您无法在 `rsetup` 中找到对应的 Overlay，请使用 `rsetup -> system-update` 首先进行系统更新，然后再执行以上操作。

<!-- 如果您无法在`rsetup`中找到对应的 Overlay，请参考 [System Update Guide](/radxa-os/rsetup#system-update) 首先进行系统更新，然后再执行以上操作。 -->

:::

5. 检查温度传感器读数

执行以下命令后，第二行输出`t=XXYYY`即为当前温度（XX.YYY摄氏度）：

```bash
cat /sys/bus/w1/devices/28-*/w1_slave
```
