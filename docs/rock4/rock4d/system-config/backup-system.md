---
sidebar_position: 9
---

# 备份系统

主要介绍在线脚本备份和离线备份系统（使用 `dd` 命令）的方法，方便用户根据自己需求选择备份方式。

最终备份的系统文件为 `img` 格式。

:::caution
使用前请确保已备份重要数据。
脚本备份仅在瑞莎官方系统上测试通过，不支持安卓系统。
:::

## 在线系统备份

在线系统备份是指在开发板上备份正在运行的系统。

:::tip
脚本备份仅支持 Linux 系统，推荐使用该方式备份 Debian 和 Ubuntu 系统。
:::

### 下载脚本

在开发板上使用 `curl` 命令下载脚本。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
curl -sL https://rock.sh/rockpi-backup -o rockpi-backup.sh
```
</NewCodeBlock>

### 添加可执行权限

给脚本添加可执行权限。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
chmod +x rockpi-backup.sh
```
</NewCodeBlock>

您可以使用 `-h` 参数查看脚本帮助信息。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo ./rockpi-backup.sh -h
```
</NewCodeBlock>

终端输出示例：

```
Usage:
  sudo ./rockpi-backup.sh [-o path|-e pattern|-u|-m path]
    -o Specify output position, default is $PWD.
    -e Exclude files matching pattern for rsync.
    -u Unattended, no need to confirm in the backup process.
    -m Back up the root mount point, and support backups from other disks as well.
```

### 备份系统

使用 root 权限运行脚本:运行脚本过程中需要手动确认安装依赖和确认继续备份操作。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo ./rockpi-backup.sh
```
</NewCodeBlock>

:::tip
脚本文件会进行以下操作：

1. 检查 root 权限
2. 检查并安装依赖
3. 读取运行系统内核名称，根据内核名设置文件名。
4. 检查分区详情
5. 将根路径挂载点设置为 /
6. 寻找到与根路径相同磁盘的其他分区
7. 安装自动扩容脚本到根分区
8. 根据文件名创建磁盘文件
9. 克隆非根分区
10. 使用 rsync 同步根分区内容，并排除当前所输出的文件
11. 清理与完成

:::

备份完成后，脚本会提示备份文件的路径！

终端输出类似信息：

```
Backup done, the file is /home/radxa/rock-4d-s16-backup-250612-0930.img
```

## 离线系统备份

离线系统备份是指将开发板的系统以可移动介质的方式连接到 PC 上备份。

:::tip
离线系统备份需要将系统启动盘转为可移动介质，再连接到 PC 上备份。

不同启动介质转可移动介质：

- MicroSD 卡

将 MicroSD 卡通过读卡器转为可移动介质。

- 非板载 eMMC 模块

将 eMMC 模块通过 eMMC 读卡器转为可移动介质。

- 非板载 UFS 模块

将 UFS 模块通过 UFS 读卡器转为可移动介质。

- M.2 NVMe SSD

将 M.2 NVMe SSD 通过 M.2 固态硬盘盒转为可移动介质。

:::

### 连接 PC

将开发板的系统启动盘转为可移动介质后，连接到 PC 上备份（推荐在 Ubuntu 系统下备份）。

### 确认磁盘

使用 `lsblk` 命令确认可移动磁盘信息。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
lsblk
```
</NewCodeBlock>

终端输出类似信息：其中 `sda` 为演示的开发板系统盘，您可以通过安全插拔可移动介质来判断对应设备信息。

```
sda           8:0    1    58G  0 disk
├─sda1        8:1    1    16M  0 part /media/wml/config
├─sda2        8:2    1   300M  0 part
└─sda3        8:3    1  57.6G  0 part
nvme0n1     259:0    0 953.9G  0 disk
├─nvme0n1p1 259:1    0 952.8G  0 part /var/snap/firefox/common/host-hunspell
│                                     /
└─nvme0n1p2 259:2    0     1G  0 part /boot/efi
```

### 备份系统

在 PC 上打开终端，使用 `dd` 命令备份系统：命令中的参数可以根据实际情况进行修改。

<NewCodeBlock tip="PC-Host$" type="host">
```
sudo dd if=/dev/sda of=rock-4d-spi-backup.img bs=4M status=progress
```
</NewCodeBlock>

- `/dev/sda`：开发板对应的磁盘。
- `rock-4d-spi-backup.img`：指定输出文件名称。
- `bs=4M`：块大小。
- `status=progress`：输出备份的进度和速度。

整个备份过程会提示备份进度和速度，备份完成后，会提示备份文件的路径。

终端输出类似信息：

```
62205722624 bytes (62 GB, 58 GiB) copied, 1609 s, 38.7 MB/s
14839+0 records in
14839+0 records out
62239277056 bytes (62 GB, 58 GiB) copied, 1609.85 s, 38.7 MB/s
```

## 恢复系统

通过上述方法备份的 `*.img` 系统文件，可以参考 [安装系统](../getting-started/install-system/) 教程进行系统恢复。
