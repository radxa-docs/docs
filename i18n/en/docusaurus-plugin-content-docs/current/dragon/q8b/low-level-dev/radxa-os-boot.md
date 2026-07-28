---
sidebar_position: 2
---

# Radxa OS Boot Configuration

Radxa OS ships with three default partitions:

| Partition | Default Mount Point | Description                                                                          |
| :-------- | :------------------ | :----------------------------------------------------------------------------------- |
| config    | /config             | Stores system- or device-related configuration                                       |
| EFI       | /boot/efi           | Stores the bootloader, boot configuration, kernel image, initrd, device tree, etc.   |
| rootfs    | /                   | Root filesystem                                                                      |

You can use `lsblk` to inspect the partitions and mount points:

```plaintext
root@radxa-dragon-q8b:~# lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
zram0       253:0    0   3.7G  0 disk [SWAP]
nvme0n1     259:0    0 119.2G  0 disk
├─nvme0n1p1 259:1    0    16M  0 part /config
├─nvme0n1p2 259:2    0     1G  0 part /boot/efi
└─nvme0n1p3 259:3    0 118.2G  0 part /
```

## Boot Configuration Files

Radxa OS boot configuration files are located at:

```plaintext
/boot/efi/loader/entries/
```

Each installed kernel usually maps to one `.conf` file. The file name varies with the kernel version, for example:

```plaintext
/boot/efi/loader/entries/RadxaOS-7.0.11-3-qcom.conf
```

Example contents:

```shell
# cat /boot/efi/loader/entries/RadxaOS-7.0.11-3-qcom.conf
# Boot Loader Specification type#1 entry
# File created by /usr/lib/kernel/install.d/90-loaderentry.install (systemd 259.5-0ubuntu3)
title      Ubuntu 26.04 LTS
version    7.0.11-3-qcom
sort-key   ubuntu
options   root=UUID=711cd5de-9e25-4615-bfe2-0b369aa10dc0 console=ttyMSM0,115200n8 clk_ignore_unused quiet splash loglevel=4 rw earlycon consoleblank=0 console=tty1 coherent_pool=2M irqchip.gicv3_pseudo_nmi=0 cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory swapaccount=1 kasan=off plymouth.enable=0
linux      /RadxaOS/7.0.11-3-qcom/linux
initrd     /RadxaOS/7.0.11-3-qcom/initrd.img-7.0.11-3-qcom
```

Main configuration fields:

| Field              | Description                                                |
| :----------------- | :--------------------------------------------------------- |
| title              | Name shown in the boot menu                                |
| version            | Kernel version                                             |
| options            | Kernel command-line parameters passed to the Linux kernel  |
| linux              | Path to the kernel image                                   |
| initrd             | Path to the initrd image                                   |
| devicetree         | Path to the Device Tree blob                               |
| devicetree-overlay | Path to the Device Tree overlay blob                       |

### Device Tree Usage Rules

Radxa OS follows these rules for the Device Tree:

- By default, the boot configuration does not include a `devicetree` parameter; the system uses the Device Tree provided by BIOS/UEFI.
- After a kernel update, the system may regenerate the boot configuration and explicitly set `devicetree` to the Device Tree shipped with the kernel package.
- After enabling a Device Tree Overlay via `rsetup`, the system updates the boot configuration with the corresponding `devicetree-overlay` parameter.

## Modifying Kernel Boot Parameters

The following example adds the `pcie_aspm=off` parameter.

1. Switch to the root user

   ```shell
   sudo -i
   ```

2. Edit the kernel command line

   Open `/etc/kernel/cmdline`:

   ```shell
   nano /etc/kernel/cmdline
   ```

   Append the new parameter at the end of the line:

   ```plaintext
   pcie_aspm=off
   ```

   Modified example:

   ```plaintext
   root=UUID=711cd5de-9e25-4615-bfe2-0b369aa10dc0 console=ttyMSM0,115200n8 clk_ignore_unused quiet splash loglevel=4 rw earlycon consoleblank=0 console=tty1 coherent_pool=2M irqchip.gicv3_pseudo_nmi=0 cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory swapaccount=1 kasan=off plymouth.enable=0 pcie_aspm=off
   ```

   Notes:

   - All parameters in `/etc/kernel/cmdline` must stay on a single line.
   - Separate parameters with spaces.
   - Do not delete required parameters such as `root=UUID=...`.

3. Regenerate the boot configuration for the current kernel

   ```shell
   kernel-install add "$(uname -r)" "/boot/vmlinuz-$(uname -r)"
   ```

4. Verify the generated configuration

   Locate the entry for the current kernel:

   ```shell
   grep -l "^version[[:space:]]*$(uname -r)$" /boot/efi/loader/entries/*.conf
   ```

   Or inspect the `options` line of every entry:

   ```shell
   grep '^options' /boot/efi/loader/entries/*.conf
   ```

   Make sure the corresponding `options` line includes `pcie_aspm=off`:

   ```plaintext
   # cat /boot/efi/loader/entries/RadxaOS-7.0.11-3-qcom.conf
   # Boot Loader Specification type#1 entry
   # File created by /usr/lib/kernel/install.d/90-loaderentry.install (systemd 259.5-0ubuntu3)
   title      Ubuntu 26.04 LTS
   version    7.0.11-3-qcom
   sort-key   ubuntu
   options    root=UUID=711cd5de-9e25-4615-bfe2-0b369aa10dc0 console=ttyMSM0,115200n8 clk_ignore_unused quiet splash loglevel=4 rw earlycon consoleblank=0 console=tty1 coherent_pool=2M irqchip.gicv3_pseudo_nmi=0 cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory swapaccount=1 kasan=off plymouth.enable=0 pcie_aspm=off
   linux      /RadxaOS/7.0.11-3-qcom/linux
   initrd     /RadxaOS/7.0.11-3-qcom/initrd.img-7.0.11-3-qcom
   devicetree /RadxaOS/7.0.11-3-qcom/sc8280xp-radxa-dragon-q8b.dtb
   ```

5. Reboot and verify

   ```shell
   reboot
   ```

   After boot, confirm the active kernel command line:

   ```shell
   cat /proc/cmdline
   ```

   Or check the kernel log:

   ```shell
   dmesg | grep 'Kernel command line'
   ```

   Expected output should include:

   ```plaintext
   pcie_aspm=off
   ```

   If the boot configuration already contains the parameter but it does not take effect after reboot, confirm that the system is actually booting the entry you just updated.

## Setting the Boot Menu Timeout

The boot menu configuration file is:

```plaintext
/boot/efi/loader/loader.conf
```

Default example — `timeout 3` waits 3 seconds before booting the default entry:

```plaintext
timeout 3
#console-mode keep
```

### Changing the Wait Time

For example, set the wait time to 5 seconds:

```plaintext
timeout 5
```

### Skipping the Boot Menu Wait

If you want to boot the default entry immediately, set the timeout explicitly:

```plaintext
timeout 0
```

Commenting out `timeout` also speeds up booting:

```plaintext
#timeout 3
```