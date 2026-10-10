---
sidebar_position: 13
---

# 在系统中更新 BIOS 固件

Dragon Q8B 可以通过 Radxa OS 中的 `Rsetup` 工具更新 BIOS 固件。此方法需要系统能够正常启动并连接网络；如果系统无法启动，请使用 [EDL 线刷 BIOS 固件](../low-level-dev/spi-fw)，线刷不依赖系统启动。

1. 在 Dragon Q8B 的 Radxa OS 中打开终端，运行：

   ```bash
   sudo rsetup
   ```

2. 在 `Rsetup` 中依次选择 `System` -> `Bootloader Management` -> `Update SPI Bootloader`。
3. 选择 `radxa-dragon-q8b`，按照屏幕提示确认并等待更新完成。更新期间请保持供电稳定，不要中断操作。
4. 更新完成后重启设备。可以参考 [查看 BIOS 版本](./check-bios-version) 确认更新结果。

:::tip 找不到 Update SPI Bootloader？
在 `Rsetup` 中选择 `System` -> `System Update`，按照提示更新系统，重启后再次打开 `Rsetup` 进行上述操作。参见 [系统更新](./system-update)。
:::
