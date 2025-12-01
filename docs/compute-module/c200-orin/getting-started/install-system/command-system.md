---
sidebar_position: 2
---

# 通过命令行安装系统

使用瑞莎 C200 Orin 开发套件的用户，如果需要进入 Super 模式，请按照该教程安装系统。

:::tip 安装说明

- 仅支持从 NVMe 固态硬盘启动
- 安装将擦除瑞莎定制 BIOS 固件和 NVMe 数据，请提前备份

:::

:::tip 参考资料

- [NVIDIA Jetson Developer Guide](https://docs.nvidia.com/jetson/archives/r36.4.3/DeveloperGuide/IN/QuickStart.html)

:::

## 环境搭建

我们需要将英伟达官方的 `Driver Package (BSP)` 和 `Sample Root Filesystem` 文件下载到本地并解压到指定目录。

### 硬件配置

推荐在 Ubuntu 22.04 的主机上进行系统的安装，若是使用虚拟机运行 Ubuntu 22.04，请确保烧录系统的过程中主板连接到虚拟机。

- Ubuntu 22.04

### 下载文件

访问 [NVIDIA Jetson Linux 36.4.3](https://developer.nvidia.com/embedded/jetson-linux-r3643) 下载页面，下载 `Driver Package (BSP)` 和 `Sample Root Filesystem` 文件。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/download-file.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 解压文件

进入下载目录打开终端，将文件解压到指定目录。

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```
tar xf Jetson_Linux_R36.4.3_aarch64.tbz2
sudo tar xpf Tegra_Linux_Sample-Root-Filesystem_R36.4.3_aarch64.tbz2 -C Linux_for_Tegra/rootfs/
cd Linux_for_Tegra/
```

</NewCodeBlock>

### 安装环境

运行 `l4t_flash_prerequisites.sh` 脚本安装 Jetson Linux 开发环境，安装所有必要的工具和依赖包。

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```
sudo ./tools/l4t_flash_prerequisites.sh
```

</NewCodeBlock>

### 安装组件到根文件系统

运行 `apply_binaries.sh` 脚本将英伟达 Jetson 组件安装到根文件系统。

<NewCodeBlock tip="Ubuntu 22.04" type="host">

```
sudo ./apply_binaries.sh
```

</NewCodeBlock>

## 安装系统

通过命令将系统安装到 NVMe 固态硬盘。

### 硬件连接

1. 将 NVMe 固态硬盘安装到瑞莎 C200 Orin 开发套件的 M.2 M Key 插槽
2. 使用跳线帽或杜邦线将 FC REC 和 GND 引脚短接
3. 使用主板电源适配器给瑞莎 C200 Orin 开发套件供电
4. 使用 USB Type-c 数据线连接主板和电脑

:::tip Recovery 模式

进入 Recovery 模式只需要在开机过程中检测到 FC REC 引脚连接到 GND 即可，烧录系统过程中可拔掉跳线帽或者杜邦线。

:::

<div style={{ textAlign: "center" }}>
  <img
    src="/img/c200/hardware-connection.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 烧录系统

在终端运行下面命令将系统烧录到主板的 NVMe 固态硬盘。

<NewCodeBlock tip="Radxa@c200-orin" type="device">

```
sudo ./tools/kernel_flash/l4t_initrd_flash.sh --external-device nvme0n1p1 -c tools/kernel_flash/flash_l4t_t234_nvme.xml -p "-c bootloader/generic/cfg/flash_t234_qspi.xml" --showlogs --network usb0 jetson-orin-nano-devkit-super internal
```

</NewCodeBlock>

烧录成功后，终端会出现 `Flash is successful` 的提示信息。

说明：若是使用虚拟机运行 Ubuntu 22.04，烧录过程中可能会断开虚拟机和主板的连接，请及时将设备连接到虚拟机，不然会出现连接超时错误！

## 使用系统

烧录系统成功后，系统会重新启动，你可以连接 DP 数据线和显示器，根据系统提示完成初次系统配置。

:::tip 注意事项

初次系统配置完成后，检查短接 FC REC 引脚和 GND 引脚的跳线帽或者杜邦线是否拔掉，避免下次启动直接进入 Recovery 模式。

:::
