---
sidebar_position: 7
---

# 从 NVMe SSD 启动

## 概述

直接从 NVMe SSD 启动您的树莓派 5 提供了多种优势：

- **更快的性能**：与 microSD 卡相比，SSD 提供显著更快的读/写速度
- **提高的可靠性**：SSD 通常具有更长的使用寿命和更好的耐用性
- **增加的存储容量**：NVMe SSD 提供更大的存储选项

默认情况下，树莓派 5 设备从 microSD 卡启动。本指南将带您通过瑞莎 Dual 2.5G Router HAT 配置您的树莓派 5 直接从 NVMe SSD 启动。

## 先决条件

- 已正确安装瑞莎 Dual 2.5G Router HAT 的树莓派 5
- 在 Router HAT 的 M.2 插槽中安装的 NVMe SSD
- 在 microSD 卡上安装的可用的树莓派 OS
- 已启用 PCIe 接口（如[开始使用](/accessories/dual-2.5-router-hat/dual-2.5-router-for-rpi5/start-use)指南中所述）

## 步骤 1：更新树莓派固件

1. 从 microSD 卡启动您的树莓派 5
2. 确保您的系统是最新的：

   ```bash
   sudo apt update
   sudo apt full-upgrade -y
   ```

3. 将树莓派固件更新到最新版本：

   ```bash
   sudo rpi-update
   ```

   > **注意**：`rpi-update` 命令安装实验性固件。在大多数情况下这是安全的，但如果您希望保持在稳定版本，可以跳过此步骤，只需确保您的系统通过 `apt full-upgrade` 完全更新。

4. 重启您的系统：

   ```bash
   sudo reboot
   ```

## 步骤 2：配置 EEPROM 从 PCIe 启动

1. 重启后，打开 EEPROM 配置进行编辑：

   ```bash
   sudo rpi-eeprom-config --edit
   ```

2. 这将打开一个文本编辑器。添加或修改以下行：

   ```text
   BOOT_ORDER=0xf416
   PCIE_PROBE=1
   ```

   `BOOT_ORDER=0xf416` 设置配置启动序列如下：

   - 先尝试 SD 卡 (4)
   - 然后尝试 PCIe 存储 (1)
   - 然后尝试 USB 大容量存储 (6)
   - 最后尝试网络启动 (f)

   `PCIE_PROBE=1` 设置确保在启动过程中检测 PCIe 设备。

   ![编辑 EEPROM 配置](/img/accessories/network/dual-2.5-router-hat/rpi-ssd-boot.webp)

3. 保存文件并退出编辑器（在 nano 中，按 Ctrl+O 保存，然后按 Ctrl+X 退出）

4. 应用 EEPROM 配置更新：

   ```bash
   sudo rpi-eeprom-update -a
   ```

5. 重启以应用更改：

   ```bash
   sudo reboot
   ```

## 步骤 3：在 NVMe SSD 上安装操作系统

### 选项 1：将现有 SD 卡克隆到 SSD

1. 重启后，确保您的 NVMe SSD 被检测到：

   ```bash
   lsblk
   ```

   您的 NVMe SSD 应该显示为 `/dev/nvme0n1` 或类似名称。

2. 安装所需的工具：

   ```bash
   sudo apt install -y rsync
   ```

3. 在 NVMe SSD 上创建分区：

   ```bash
   sudo parted -s /dev/nvme0n1 mklabel gpt
   sudo parted -s /dev/nvme0n1 mkpart primary fat32 1MiB 256MiB
   sudo parted -s /dev/nvme0n1 mkpart primary ext4 256MiB 100%
   ```

4. 格式化分区：

   ```bash
   sudo mkfs.vfat -F 32 /dev/nvme0n1p1
   sudo mkfs.ext4 /dev/nvme0n1p2
   ```

5. 挂载分区：

   ```bash
   sudo mkdir -p /mnt/boot /mnt/rootfs
   sudo mount /dev/nvme0n1p1 /mnt/boot
   sudo mount /dev/nvme0n1p2 /mnt/rootfs
   ```

6. 将当前系统克隆到 SSD：

   ```bash
   sudo rsync -axv /boot/ /mnt/boot/
   sudo rsync -axv / /mnt/rootfs/ --exclude /boot --exclude /proc --exclude /sys --exclude /dev --exclude /mnt
   ```

7. 更新 SSD 上的 fstab 文件：

   ```bash
   sudo sed -i 's/mmcblk0p/nvme0n1p/g' /mnt/rootfs/etc/fstab
   ```

8. 卸载分区：

   ```bash
   sudo umount /mnt/boot /mnt/rootfs
   ```

### 选项 2：使用 Raspberry Pi Imager 进行全新安装

或者，您可以直接在 SSD 上进行全新安装：

1. 关闭您的树莓派：

   ```bash
   sudo shutdown -h now
   ```

2. 从 Router HAT 上移除 SSD，并使用 M.2 NVMe 转 USB 适配器将其连接到您的计算机

3. 使用 Raspberry Pi Imager 直接将 Raspberry Pi OS 安装到 SSD

4. 完成后，将 SSD 重新插入 Router HAT

## 步骤 4：从 NVMe SSD 启动

1. 关闭您的树莓派 5：

   ```bash
   sudo shutdown -h now
   ```

2. 断开电源
3. 移除 microSD 卡
4. 确保 NVMe SSD 正确插入瑞莎 Dual 2.5G Router HAT 上的 M.2 插槽
5. 重新连接电源

您的树莓派 5 现在应该直接从 NVMe SSD 启动。

## 故障排除

### 系统无法从 SSD 启动

如果您的树莓派 5 无法从 SSD 启动，请尝试以下操作：

1. **重新插入 microSD 卡**并从其启动
2. 验证 EEPROM 配置：

   ```bash
   sudo rpi-eeprom-config
   ```

   确保正确设置了 `BOOT_ORDER=0xf416` 和 `PCIE_PROBE=1`

3. 检查 SSD 是否被检测到：

   ```bash
   lsblk
   ```

4. 确保启用了 PCIe 接口：

   ```bash
   grep pciex1 /boot/firmware/config.txt
   ```

### 启动时间长

如果系统从 SSD 启动需要很长时间：

1. 确保您使用的是 PCIe Gen 3 模式，如[开始使用](/accessories/dual-2.5-router-hat/dual-2.5-router-for-rpi5/start-use#优化-pcie-性能可选)指南中所述

2. 检查是否有启动错误：

   ```bash
   dmesg | grep -i error
   ```

## 性能优化

要从 NVMe SSD 启动设置中获得最大效益：

1. **启用 TRIM 支持**以提高 SSD 寿命：

   ```bash
   sudo systemctl enable fstrim.timer
   sudo systemctl start fstrim.timer
   ```

2. **调整调度器**以提高 SSD 性能：

   ```bash
   echo 'none' | sudo tee /sys/block/nvme0n1/queue/scheduler
   ```

   要在重启后保持此设置，请将以下内容添加到 `/etc/udev/rules.d/60-scheduler.rules`：

   ```bash
   ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/scheduler}="none"
   ```

3. **考虑超频**您的树莓派 5 以获得更好的性能（但请注意，这可能需要更好的散热）
