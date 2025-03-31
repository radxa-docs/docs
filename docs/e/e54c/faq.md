---
sidebar_position: 7
---

# E54C 常见问题

1. iStoreOS 系统如何恢复出厂设置

   在系统正常运行的时候，长按 USER 按键 5s，系统会进行恢复出厂设置操作，然后重启。

  <img src="/img/e/e54c/radxa-e54c-hardware-overview.webp" width="800" alt="radxa-e54c pack" />

:::tip
不要一开机就按照 USER 按键，此时系统会进入安全模式，这种模式下只能通过串口进行操作。
:::

2. E54C 的四个网口如何配置

   在 iStoreOS 系统中，您可以通过网页界面灵活配置四个网口的功能。默认情况下，一个端口配置为 WAN 口，其余三个配置为 LAN 口。您可以根据需要更改这些设置，实现多 WAN 口负载均衡或其他网络拓扑。

3. E54C 的供电要求是什么

   E54C 需要使用 12V/3A 或更高功率的电源适配器，使用 5525 DC 接口。请注意，E54C 只支持 12V 输入，不支持 5V 输入，这与 E52C 的供电要求不同。

4. 如何安装 NVMe SSD

   E54C 支持 M.2 2280 规格的 NVMe SSD。安装步骤如下：

   - 确保设备已关机并断开电源
   - 将 M.2 NVMe SSD 插入 M.2 M Key 插槽
   - 使用螺丝固定 SSD
   - 连接电源并启动设备
   - 系统启动后，可以通过 `lsblk` 命令查看是否识别到 SSD

5. 如何使用 HDMI 输出

   E54C 配备 HDMI 2.1 接口，支持高达 8K 分辨率的视频输出。只需使用 HDMI 线缆将 E54C 连接到显示器或电视，系统将自动检测并输出视频信号。

6. 如何连接和使用 GPIO 接口

   E54C 提供 14-Pin 0.1" (2.54mm) GPIO 接口，支持 SPI、UART、I2C 等功能。您可以通过 Linux 系统的 GPIO 工具（如 gpiod）来控制这些接口。详细的引脚定义和使用方法请参考[接口使用说明](./getting-started/interface-usage)。
