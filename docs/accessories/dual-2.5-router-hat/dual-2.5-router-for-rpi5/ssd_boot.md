---
sidebar_position: 7
---

# 如何从 SSD 启动

默认情况下，Raspberry Pi设备不会从 PCIE 存储中启动。要从 PCIE 启动，需要在 Bootloader 配置中更改 BOOT_ORDER 。

1. 首先从 SD 卡启动系统

2. 系统起来后执行下面的命令：

   ```bash
   sudo rpi-update
   ```

3. 使用下面的的命令编辑 EEPROM 配置：

   ```bash
   sudo rpi-eeprom-config --edit
   ```

   添加下面的内容：

   ```bash
   BOOT_ORDER=0xf416
   PCIE_PROBE=1
   ```

   ![ssd boot](/img/accessories/dual-2.5-route-hat/rpi-ssd-boot.webp)

4. 然后执行 `sudo rpi-eeprom-update -a`

5. 使用 `sudo reboot` 重启系统以更新 EEPROM 。

6. 重启后，断电，拔掉 SD 卡，向瑞莎 Dual 2.5G Router HAT 上的 M.2 M-Key 接口插入已经安装好系统的 SSD 硬盘。

7. 上电，系统就会正常从 SSD 硬盘启动。
