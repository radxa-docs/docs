---
sidebar_position: 1
---

<details>
  <summary>什么是 Maskrom 模式</summary>
	Maskrom模式，也称为Loader模式，是一种特殊的启动模式，一般用于恢复或维修有问题的设备。这种模式允许用户直接与设备的硬件进行交互，而不需要经过操作系统。在Maskrom模式下，用户可以通过电脑或其他设备与设备进行通信，并执行一系列命令来解决设备的问题。 可以通过下面的命令看设备是否处于 Maskrom 模式（下面的返回值是 Maskrom 状态下的返回值).

    # MacOS 端:

    执行 lsusb 后的结果
    Output:Bus 000 Device 004: ID 2207:350b Fuzhou Rockchip Electronics Co., Ltd. Composite Device

    # Linux 端:

    执行 lsusb 后的结果
    Output:Bus 001 Device 030: ID 2207:350b Fuzhou Rockchip Electronics Company

    # Windows 端:

    打开 RKDevTool，就会看到设备处于 Found One MASKROM Device（找到一个 MASKROM 设备）状态。

</details>

### 如何进入Maskrom 状态

- 按住 **Maskrom button**
- 将 USB A-C 电缆插入 ROCK 5B 的 Type-C 端口，另一端插入电脑。此时正常情况下会进入 Maskrom 状态

![MaskRom Key](/img/rock5b/rock-5b-typec-maskrom-400px.webp)
