---
sidebar_position: 2
---

# Radxa OS 启动配置说明

Radxa OS 默认包含 3 个分区：

| 分区    | 默认挂载点 | 说明                                                                                |
| :----- | :--------- | :---------------------------------------------------------------------------------- |
| config | /config    | 存放系统或设备相关配置                                                              |
| EFI    | /boot/efi  | 存放引导程序、启动配置、内核镜像、initrd、设备树等文件                              |
| rootfs | /          | 根文件系统                                                                          |

可以使用 `lsblk` 查看分区及挂载情况：

```plaintext
root@radxa-dragon-q8b:~# lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
zram0       253:0    0   3.7G  0 disk [SWAP]
nvme0n1     259:0    0 119.2G  0 disk
├─nvme0n1p1 259:1    0    16M  0 part /config
├─nvme0n1p2 259:2    0     1G  0 part /boot/efi
└─nvme0n1p3 259:3    0 118.2G  0 part /
```

## 启动配置文件

Radxa OS 的启动配置文件位于：

```plaintext
/boot/efi/loader/entries/
```

每个已安装的内核通常对应一个 `.conf` 文件。文件名会随内核版本变化，例如：

```plaintext
/boot/efi/loader/entries/RadxaOS-7.0.11-3-qcom.conf
```

示例内容如下：

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

主要配置项如下：

| 配置项              | 说明                          |
| :------------------ | :---------------------------- |
| title               | 启动菜单中显示的名称          |
| version             | 内核版本                      |
| options             | 传递给 Linux 内核的启动参数   |
| linux               | 内核镜像路径                  |
| initrd              | initrd 镜像路径               |
| devicetree          | Device Tree 文件路径          |
| devicetree-overlay  | Device Tree Overlay 文件路径  |

### Device Tree 使用规则

Radxa OS 对 Device Tree 的处理规则如下：

- 默认情况下，启动配置中不包含 `devicetree` 参数，系统使用 BIOS/UEFI 提供的 Device Tree。
- 更新内核后，系统可能重新生成启动配置，并通过 `devicetree` 明确指定内核软件包中的 Device Tree。
- 使用 `rsetup` 启用 Device Tree Overlay 后，系统会更新启动配置，加入对应的 `devicetree-overlay` 参数。

## 修改内核启动参数

下面以添加 `pcie_aspm=off` 参数为例。

1. 切换到 root 用户

   ```shell
   sudo -i
   ```

2. 修改内核命令行配置

   编辑 `/etc/kernel/cmdline`：

   ```shell
   nano /etc/kernel/cmdline
   ```

   在原有参数末尾添加：

   ```plaintext
   pcie_aspm=off
   ```

   修改后的内容示例：

   ```plaintext
   root=UUID=711cd5de-9e25-4615-bfe2-0b369aa10dc0 console=ttyMSM0,115200n8 clk_ignore_unused quiet splash loglevel=4 rw earlycon consoleblank=0 console=tty1 coherent_pool=2M irqchip.gicv3_pseudo_nmi=0 cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory swapaccount=1 kasan=off plymouth.enable=0 pcie_aspm=off
   ```

   注意：

   - `/etc/kernel/cmdline` 中的所有参数应保持在同一行。
   - 参数之间使用空格分隔。
   - 请勿删除原有的 `root=UUID=...` 等必要参数。

3. 重新生成当前内核的启动配置

   ```shell
   kernel-install add "$(uname -r)" "/boot/vmlinuz-$(uname -r)"
   ```

4. 检查生成结果

   找到当前内核对应的启动配置：

   ```shell
   grep -l "^version[[:space:]]*$(uname -r)$" /boot/efi/loader/entries/*.conf
   ```

   也可以直接检查所有启动项中的 `options`：

   ```shell
   grep '^options' /boot/efi/loader/entries/*.conf
   ```

   确认对应配置的 `options` 行中已经包含 `pcie_aspm=off`：

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

5. 重启并验证

   ```shell
   reboot
   ```

   系统启动后，可以通过以下命令查看实际生效的内核参数：

   ```shell
   cat /proc/cmdline
   ```

   或者检查内核日志：

   ```shell
   dmesg | grep 'Kernel command line'
   ```

   预期输出中应包含：

   ```plaintext
   pcie_aspm=off
   ```

   如果启动配置中已经包含该参数，但重启后没有生效，应确认系统实际启动的是不是刚刚更新的内核启动项。

## 设置启动菜单超时时间

启动菜单配置文件为：

```plaintext
/boot/efi/loader/loader.conf
```

默认配置示例：其中 `timeout 3` 表示启动菜单等待 3 秒后自动启动默认选项。

```plaintext
timeout 3
#console-mode keep
```

### 修改等待时间

例如，将等待时间修改为 5 秒：

```plaintext
timeout 5
```

### 跳过启动菜单等待

如果希望不等待并直接启动默认选项，建议明确设置：

```plaintext
timeout 0
```

注释掉 `timeout` 也可以加速启动：

```plaintext
#timeout 3
```