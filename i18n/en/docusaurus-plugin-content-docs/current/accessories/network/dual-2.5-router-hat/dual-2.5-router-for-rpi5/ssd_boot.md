---
sidebar_position: 7
---

# Booting from NVMe SSD

## Overview

Booting your Raspberry Pi 5 directly from the NVMe SSD offers several advantages:

- **Faster Performance**: SSDs provide significantly faster read/write speeds compared to microSD cards
- **Improved Reliability**: SSDs typically have longer lifespans and better durability than microSD cards
- **Increased Storage Capacity**: NVMe SSDs offer much larger storage options

By default, Raspberry Pi 5 devices boot from the microSD card. This guide will walk you through configuring your Raspberry Pi 5 to boot directly from the NVMe SSD connected via the Radxa Dual 2.5G Router HAT.

## Prerequisites

- Raspberry Pi 5 with Radxa Dual 2.5G Router HAT properly installed
- NVMe SSD installed in the M.2 slot of the Router HAT
- Working Raspberry Pi OS installed on a microSD card
- PCIe interface enabled (as described in the [Getting Started](/accessories/dual-2.5-router-hat/dual-2.5-router-for-rpi5/start-use) guide)

## Step 1: Update the Raspberry Pi Firmware

1. Boot your Raspberry Pi 5 from the microSD card
2. Ensure your system is up-to-date:

   ```bash
   sudo apt update
   sudo apt full-upgrade -y
   ```

3. Update the Raspberry Pi firmware to the latest version:

   ```bash
   sudo rpi-update
   ```

   > **Note**: The `rpi-update` command installs experimental firmware. In most cases this is safe, but if you prefer to stay on stable releases, you can skip this step and just ensure your system is fully updated with `apt full-upgrade`.

4. Reboot your system:

   ```bash
   sudo reboot
   ```

## Step 2: Configure the EEPROM to Boot from PCIe

1. After rebooting, open the EEPROM configuration for editing:

   ```bash
   sudo rpi-eeprom-config --edit
   ```

2. This will open a text editor. Add or modify the following lines:

   ```text
   BOOT_ORDER=0xf416
   PCIE_PROBE=1
   ```

   The `BOOT_ORDER=0xf416` setting configures the boot sequence as follows:

   - Try SD card first (4)
   - Then try PCIe storage (1)
   - Then try USB mass storage (6)
   - Finally try network boot (f)

   The `PCIE_PROBE=1` setting ensures that PCIe devices are detected during the boot process.

   ![Editing EEPROM configuration](/img/accessories/network/dual-2.5-router-hat/rpi-ssd-boot.webp)

3. Save the file and exit the editor (in nano, press Ctrl+O to save, then Ctrl+X to exit)

4. Apply the EEPROM configuration update:

   ```bash
   sudo rpi-eeprom-update -a
   ```

5. Reboot to apply the changes:

   ```bash
   sudo reboot
   ```

## Step 3: Install the Operating System on the NVMe SSD

### Option 1: Clone Your Existing SD Card to the SSD

1. After rebooting, ensure your NVMe SSD is detected:

   ```bash
   lsblk
   ```

   Your NVMe SSD should appear as `/dev/nvme0n1` or similar.

2. Install the required tools:

   ```bash
   sudo apt install -y rsync
   ```

3. Create a partition on the NVMe SSD:

   ```bash
   sudo parted -s /dev/nvme0n1 mklabel gpt
   sudo parted -s /dev/nvme0n1 mkpart primary fat32 1MiB 256MiB
   sudo parted -s /dev/nvme0n1 mkpart primary ext4 256MiB 100%
   ```

4. Format the partitions:

   ```bash
   sudo mkfs.vfat -F 32 /dev/nvme0n1p1
   sudo mkfs.ext4 /dev/nvme0n1p2
   ```

5. Mount the partitions:

   ```bash
   sudo mkdir -p /mnt/boot /mnt/rootfs
   sudo mount /dev/nvme0n1p1 /mnt/boot
   sudo mount /dev/nvme0n1p2 /mnt/rootfs
   ```

6. Clone the current system to the SSD:

   ```bash
   sudo rsync -axv /boot/ /mnt/boot/
   sudo rsync -axv / /mnt/rootfs/ --exclude /boot --exclude /proc --exclude /sys --exclude /dev --exclude /mnt
   ```

7. Update the fstab file on the SSD:

   ```bash
   sudo sed -i 's/mmcblk0p/nvme0n1p/g' /mnt/rootfs/etc/fstab
   ```

8. Unmount the partitions:

   ```bash
   sudo umount /mnt/boot /mnt/rootfs
   ```

### Option 2: Fresh Installation Using Raspberry Pi Imager

Alternatively, you can perform a fresh installation directly to the SSD:

1. Shutdown your Raspberry Pi:

   ```bash
   sudo shutdown -h now
   ```

2. Remove the SSD from the Router HAT and connect it to your computer using an M.2 NVMe to USB adapter

3. Use Raspberry Pi Imager to install Raspberry Pi OS directly to the SSD

4. Once complete, reinsert the SSD into the Router HAT

## Step 4: Boot from the NVMe SSD

1. Shut down your Raspberry Pi 5:

   ```bash
   sudo shutdown -h now
   ```

2. Disconnect the power
3. Remove the microSD card
4. Ensure the NVMe SSD is properly seated in the M.2 slot on the Radxa Dual 2.5G Router HAT
5. Reconnect the power

Your Raspberry Pi 5 should now boot directly from the NVMe SSD.

## Troubleshooting

### System Won't Boot from SSD

If your Raspberry Pi 5 doesn't boot from the SSD, try the following:

1. **Reinsert the microSD card** and boot from it
2. Verify the EEPROM configuration:

   ```bash
   sudo rpi-eeprom-config
   ```

   Ensure that `BOOT_ORDER=0xf416` and `PCIE_PROBE=1` are set correctly

3. Check if the SSD is detected:

   ```bash
   lsblk
   ```

4. Ensure the PCIe interface is enabled:

   ```bash
   grep pciex1 /boot/firmware/config.txt
   ```

### Slow Boot Times

If the system takes a long time to boot from the SSD:

1. Ensure you're using PCIe Gen 3 mode as described in the [Getting Started](/accessories/dual-2.5-router-hat/dual-2.5-router-for-rpi5/start-use#optimizing-pcie-performance-optional) guide

2. Check for any boot errors:

   ```bash
   dmesg | grep -i error
   ```

## Performance Optimization

To get the most out of your NVMe SSD boot setup:

1. **Enable TRIM support** for better SSD longevity:

   ```bash
   sudo systemctl enable fstrim.timer
   sudo systemctl start fstrim.timer
   ```

2. **Adjust the scheduler** for better SSD performance:

   ```bash
   echo 'none' | sudo tee /sys/block/nvme0n1/queue/scheduler
   ```

   To make this persistent across reboots, add the following to `/etc/udev/rules.d/60-scheduler.rules`:

   ```bash
   ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/scheduler}="none"
   ```

3. **Consider overclocking** your Raspberry Pi 5 for even better performance (but be aware this may require better cooling)
