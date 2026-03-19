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

A7Z 的 USB-C Power 接口（紧邻 DC 电源圆口）默认工作在 device 模式。如果需要连接无线鼠标接收器、键盘、U 盘等外设，需要通过设备树overlay 将其切换为 host 模式。

#### 步骤一：创建 overlay 文件

```bash
mkdir -p ~/overlay && cd ~/overlay
```

创建文件 `usb-host.dts`，内容如下：

```dts
/dts-v1/;
/plugin/;
/#include <dt-bindings/gpio/gpio.h>
/#include <dt-bindings/gpio/sun4i-gpio.h>
/#include <dt-bindings/pwm/pwm.h>
/#include <dt-bindings/thermal/thermal.h>

/ {
 metadata {
  title = "Enable USB-C Host Mode";
  category = "misc";
  compatible = "radxa,cubie-a7a";
  description = "Enable USB-C Power port as host.";
  exclusive = "PB0", "PK7";
  package = "test";
 };

 &usbc0 {
  usb_port_type = <0x1>; // 0x0: device  0x01: host
 };
};
```

#### 步骤二：编译并安装 overlay

```bash
mkdir -p build
dtc -@ -I dts -O dtb -o build/usb-host.dtb usb-host.dts
sudo cp build/usb-host.dtb /lib/firmware/device-tree/base/overlays/
```

#### 步骤三：启用 overlay

```bash
sudo dtoverlay usb-host
```

#### 步骤四：验证

```bash
lsusb
```

如果能看到连接的设备，说明 host 模式已成功启用。

#### 步骤五：重启后保持生效

编辑 `/boot/extlinux/extlinux.conf`，在 `FDT` 行后添加：

```
FDT /dtb/allwinner/overlay/usb-host.dtb
```

或者通过 rsetup 工具永久启用：

```bash
sudo rsetup
# 选择 Overlays → Install 3rd Party overlay → 勾选 usb-host
```

:::info 兼容性
该方法同样适用于 Cubie A7S 板型。
:::
