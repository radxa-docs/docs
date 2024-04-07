---
sidebar_position: 99
---

# ROCK 5 系列常见问题

## ROCK 5A 常见问题

### ROCK 5A 出货标配是否带 SPI Flash Module？

- ROCK 5A 出售时附带 Radxa SPI Flash 模块。该接口与 Radxa eMMC 模块共用。当使用 eMMC 模块时，无法使用 Radxa SPI Flash 模块。

## ROCK 5B 常见问题

### Rock 5B 将支持 WiFi 6E。 新的 ROCK 5B 主板是否带有 (6E) wifi 芯片。 还是要单独购买？

- 默认情况下不包括 WiFi 卡，因为不同的用户需要不同的 WiFi 速度。 Radxa 团队推荐使用 RTL8852BE 芯片的无线网卡，以在价格和性能之间取得平衡。

### 没有 eMMC 和 TF 卡，ROCK 5B 可以从 PCIe M.2 NVME SSD 启动吗？

- 是的。 ROCK 5B 可以从 PCIe M.2 NVME SSD 启动。ROCK 5B 配备一个 16MB SPI NOR Flash 和 PCIe M.2 M-Key 连接器。SPI NOR Flash 存储 bootloader。 NVME SSD 存储整个系统镜像（至少内核和 rootfs）。[SPI NOR Flash and PCIe NVME SSD boot](/rock5/lowlevel-development/bootloader_spi_flash)

### 散热器是否包含在价格中？

- 默认不包括散热器，需要另购

### 我的新 ROCK 5B 无法启动/卡在无限启动循环中

- ROCK 5B 支持 PD 协议，可以通过握手使适配器输出更高的电压，如 9V、12V、15V、20V，以满足系统总电源负载要求（约 30W，WiFi、SSD、USB 外围设备等）。 目前 PD 协商是在内核驱动中实现的，需要开机到内核运行阶段才能开始协商，但是有些电源适配器等不到 ROCK 5B 的电源协商阶段，超时就断电，造成死循环。我们提供以下建议：

* 强烈建议使用官方电源适配器 [Radxa Power PD 30W](/accessories/pd_30w). Radxa Power PD 30W 在 ROCK 5B 的所有条件下进行了测试。
* 使用更高速的 SD 卡或 eMMC 模块并禁用引导加载程序/内核串行控制台
* 使用直流 12V USB-C 电源
* 检查 Radxa 社区报告的其他电源是否可用请查看主板的基础支持信息。

### ROCK 5B 无法启动，如何进行故障排查

- ROCK 5B 故障排除步骤如下：

1. ROCK 5B 断电，取出 eMMC 模块、SD卡、NVMe SSD
2. 按住 Maskrom Button 按钮（**请查看 ROCK 5B 标注图的标签 25**）[5B Maskrom Button](/rock5/rock5b/getting-started/)。
3. 使用 USB Type A 转 Type C 线将 ROCK 5B 通过 USB Type C 连接到电脑
4. 检查 Windows 设备管理器中是否有新的未知 USB 设备，有，则 ROCK 5B 已被成功识别到。 若没有，请优先尝试其他独立 USB 端口，建议将 ROCK 5B 连接到电脑的背部面板的独立 USB 接口，确保其拥有足够的供电。
