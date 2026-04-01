---
sidebar_position: 5
---

# 使用 mdadm 创建 RAID 阵列

介绍如何在瑞莎 Taco 上使用 `mdadm` 创建 Linux 软件 RAID 阵列，适用于将多块 SATA 硬盘组合为 RAID 0、RAID 1、RAID 5 或 RAID 10。

`mdadm` 是 Linux 常用的软件 RAID 管理工具，可用于创建、组装、检查和维护 RAID 阵列。

## 使用前提

开始前，请确认以下条件：

- 已完成 [安装 SATA 硬盘](./install-sata)
- 系统可以正常识别目标硬盘
- 目标硬盘中的数据已经备份

:::warning 注意

创建 RAID 会清除所选磁盘上的现有数据。执行命令前，请务必再次确认设备名称，避免误操作系统盘或其他已有数据盘。

:::

## 安装 mdadm

在开始之前，请确保已安装 mdadm。如果尚未安装，请使用以下命令安装：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo apt update
sudo apt install mdadm
```

</NewCodeBlock>

## 创建 RAID 0 阵列

RAID 0 阵列是一种条带化阵列，它将数据分成块并将其分布在多个磁盘上。RAID 0 提供了更快的读写速度，但没有冗余。要创建 RAID 0 阵列，至少需要 2 个磁盘，请执行以下步骤：

1. 使用 `lsblk` 命令查看可用的磁盘：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
lsblk
```

</NewCodeBlock>

2. 使用 `mdadm` 命令创建 RAID 0 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mdadm --create --verbose /dev/md0 --level=0 --raid-devices=2 /dev/sda /dev/sdb
```

</NewCodeBlock>

请将 `/dev/sda` 和 `/dev/sdb` 替换为您的磁盘名称。

3. 格式化 RAID 0 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkfs.ext4 /dev/md0
```

</NewCodeBlock>

4. 挂载 RAID 0 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkdir /mnt/raid0
sudo mount /dev/md0 /mnt/raid0
```

</NewCodeBlock>

虽然 RAID 0 可以提供更多的空间和更好的性能，但是整个系统是非常不可靠的，如果出现故障，无法进行任何补救。所以，RAID 0 一般只是在那些对数据安全性要求不高的情况下才被人们使用。

## 创建 RAID 1 阵列

RAID 1 阵列是一种镜像阵列，它将数据复制到多个磁盘上。RAID 1 提供了冗余，但读写速度较慢。要创建 RAID 1 阵列，至少需要 2 个磁盘，请执行以下步骤：

1. 使用 `lsblk` 命令查看可用的磁盘：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
lsblk
```

</NewCodeBlock>

2. 使用 `mdadm` 命令创建 RAID 1 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sda /dev/sdb
```

</NewCodeBlock>

请将 `/dev/sda` 和 `/dev/sdb` 替换为您的磁盘名称。

3. 格式化 RAID 1 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkfs.ext4 /dev/md0
```

</NewCodeBlock>

4. 挂载 RAID 1 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkdir /mnt/raid1
sudo mount /dev/md0 /mnt/raid1
```

</NewCodeBlock>

## 创建 RAID 5 阵列

RAID 5 阵列是一种条带化阵列，它将数据分成块并将其分布在多个磁盘上，但它增加了奇偶校验的操作。要创建 RAID 5 阵列，至少需要 3 个磁盘，请执行以下步骤：

1. 使用 `lsblk` 命令查看可用的磁盘：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
lsblk
```

</NewCodeBlock>

2. 使用 `mdadm` 命令创建 RAID 5 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sda /dev/sdb /dev/sdc
```

</NewCodeBlock>

请将 `/dev/sda`、`/dev/sdb` 和 `/dev/sdc` 替换为您的磁盘名称。

3. 格式化 RAID 5 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkfs.ext4 /dev/md0
```

</NewCodeBlock>

4. 挂载 RAID 5 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkdir /mnt/raid5
sudo mount /dev/md0 /mnt/raid5
```

</NewCodeBlock>

RAID 5 阵列提供了更好的性能和冗余，但是在写入数据时会有一些性能损失。如果有一个磁盘损坏，RAID 5 阵列可以继续工作，但是在替换损坏的磁盘时，需要对整个阵列进行重建，这可能需要一些时间，重建过程中也很容易损坏其他磁盘。

## 创建 RAID 10 阵列

RAID 10 阵列又称为 RAID 1+0，先进行镜像（RAID 1），再进行条带存放（RAID 0）。要创建 RAID 10 阵列，至少需要 4 个磁盘，请执行以下步骤：

1. 使用 `lsblk` 命令查看可用的磁盘：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
lsblk
```

</NewCodeBlock>

2. 使用 `mdadm` 命令创建 RAID 10 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sda /dev/sdb /dev/sdc /dev/sdd
```

</NewCodeBlock>

请将 `/dev/sda`、`/dev/sdb`、`/dev/sdc` 和 `/dev/sdd` 替换为您的磁盘名称。

3. 格式化 RAID 10 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkfs.ext4 /dev/md0
```

</NewCodeBlock>

4. 挂载 RAID 10 阵列：

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkdir /mnt/raid10
sudo mount /dev/md0 /mnt/raid10
```

</NewCodeBlock>

RAID 10 阵列提供了更好的性能和冗余，但是需要更多的磁盘。如果有一个磁盘损坏，RAID 10 阵列可以继续工作，而且重建速度比 RAID 5 阵列更快。
