---
sidebar_position: 5
---

# 安装系统

:::caution SATA 存储 JMB585 控制器内核兼容性问题
Taco 底板上的 5x SATA 接口使用 JMB585 PCIe SATA 控制芯片。自 Linux 内核 commit ee95f3c 起，该芯片在部分平台上可能需要额外配置才能正常工作。如果在系统更新后发现 SATA 硬盘无法识别或 AHCI 驱动加载失败，请尝试在启动参数或设备树配置中添加：

```bash
dtoverlay=pcie-32bit-dma-pi5   # 适用于树莓派 5 / CM5 平台
```

如遇问题，请参考硬件文档或联系支持。
:::

<DocCardList />
