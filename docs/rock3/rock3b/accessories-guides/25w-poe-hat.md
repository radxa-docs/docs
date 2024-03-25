---
sidebar_position: 55
---

# 25W PoE HAT 使用教程

## 材料清单

- 如图

![25W PoE pkg](/img/accessories/poe-hat/25w-poe-pkg.webp)

## 安装流程

请参考 [Radxa 25W PoE HAT](/accessories/radxa-25w-poe)

## 风扇调速

### 启用 25W PoE Overlay

如需要启用温控风扇以及温度传感器，则需要开启对应 Overlay。

请参照[设备树配置](../os-config/rsetup#overlays)，启用名为 "Enable Radxa 25W PoE HAT "的 Overlay。

```bash
  [*] Enable Radxa 25W PoE HAT
```

最后，重启设备以加载 Overlay。

:::info
如果您无法在 `rsetup` 中找到对应的 Overlay，请参考 [System Update Guide](../os-config/rsetup#system-update) 首先进行系统更新，然后再执行以上操作。
:::

### 检查温度传感器读数

执行以下命令后，第二行输出`t=XXYYY`即为当前温度（XX.YYY摄氏度）：

```bash
cat /sys/bus/w1/devices/28-*/w1_slave
```
