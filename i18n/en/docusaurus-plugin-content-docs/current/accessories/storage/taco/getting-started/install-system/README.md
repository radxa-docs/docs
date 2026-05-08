---
sidebar_position: 5
---

# Install System

:::caution SATA Storage JMB585 Controller Kernel Compatibility
The 5x SATA interfaces on the Taco carrier board use the JMB585 PCIe SATA controller chip. Since Linux kernel commit ee95f3c, this chip may require additional configuration to work properly on certain platforms. If SATA drives are not detected or the AHCI driver fails to load after a system update, try adding to your boot configuration:

```bash
dtoverlay=pcie-32bit-dma-pi5   # For Raspberry Pi 5 / CM5 platforms
```

If you encounter issues, please refer to the hardware documentation or contact support.
:::

<DocCardList />
