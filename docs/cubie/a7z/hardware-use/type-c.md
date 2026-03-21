---
sidebar_position: 2
---

# USB Type-C 接口

瑞莎 Cubie A7Z 板载1个 USB 2.0 Type-C 和 1个 USB 3.1 Type-C 接口。

- USB 2.0 Type-C
  - 供电接口：支持 5V 电压输入
  - 数据传输：支持 USB OTG 和 FEL 模式刷机
- USB 3.1 Type-C
  - 显示功能：支持 DisplayPort Alt 模式
  - 数据传输：支持 USB OTG

:::info 接口位置
MicroSD 卡槽具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 使用指南

### USB 2.0 Type-C

正常使用：使用 5V Type-C 电源适配器进行供电，推荐电流 3A 及以上。

刷机模式：使用 USB Type-C 数据线连接主板和 PC 进行供电和数据传输。

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

### USB 3.1 Type-C

正常使用：使用 USB Type-C 接口连接 U 盘等设备进行数据传输。

显示功能：使用 USB Type-C 数据线连接显示器，支持 DisplayPort Alt 模式。

OTG 模式：通过 Rsetup 开启 OTG 模式。

### USB-C Power 接口作为 Host 使用

A7Z 的 USB-C Power 接口（接口①，USB-C 2.0 OTG & Power）默认工作在 device 模式。如果需要连接无线鼠标接收器、键盘、U 盘等外设，需要通过设备树 overlay 将其切换为 host 模式。

#### 步骤一：获取 overlay 参考

可参考 [radxa-overlays](https://github.com/radxa-pkg/radxa-overlays) 仓库中 cubie-a7a 相关的 overlay 写法（如 [cubie-a7a-radxa-25w-poe.dts](https://github.com/radxa-pkg/radxa-overlays/blob/main/arch/arm64/boot/dts/allwinner/overlays/cubie-a7a-radxa-25w-poe.dts)）。

核心设置如下：

```dts
&usbc0 {
 usb_port_type = <0x1>; // 0x0: device  0x01: host
};
```

#### 步骤二：安装 overlay

将写好的 dts 文件放到任意目录，然后通过 rsetup 安装：

```bash
sudo rsetup
# 选择 Overlays → Install 3rd Party overlay → 选中对应的 dts 文件
```

rsetup 会自动编译选中的 dts 文件并启用。启用后需要重启系统使 overlay 生效。

#### 步骤三：重启系统

```bash
sudo reboot
```

#### 步骤四：验证

```bash
lsusb
```

如果能看到连接的设备，说明 host 模式已成功启用。

:::info 兼容性
该方法同样适用于 Cubie A7S 板型。
:::
