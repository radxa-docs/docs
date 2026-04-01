---
sidebar_position: 5
---

# Create RAID Array with mdadm

This guide introduces how to use `mdadm` to create Linux software RAID arrays on the Radxa Taco, suitable for combining multiple SATA hard drives into RAID 0, RAID 1, RAID 5, or RAID 10.

`mdadm` is a commonly used Linux software RAID management tool that can be used to create, assemble, check, and maintain RAID arrays.

## Prerequisites

Before starting, please confirm the following conditions:

- Completed [Install SATA Hard Drive](./install-sata)
- System can normally recognize the target hard drives
- Data on the target hard drives has been backed up

:::warning Warning

Creating a RAID will clear existing data on the selected disks. Before executing commands, please reconfirm the device names to avoid accidentally operating on the system disk or other disks with existing data.

:::

## Install mdadm

Before starting, make sure mdadm is installed. If not yet installed, use the following command to install:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo apt update
sudo apt install mdadm
```

</NewCodeBlock>

## Create RAID 0 Array

RAID 0 is a striped array that splits data into blocks and distributes them across multiple disks. RAID 0 provides faster read/write speeds but has no redundancy. To create a RAID 0 array, you need at least 2 disks. Follow these steps:

1. Use the `lsblk` command to view available disks:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
lsblk
```

</NewCodeBlock>

2. Use the `mdadm` command to create a RAID 0 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mdadm --create --verbose /dev/md0 --level=0 --raid-devices=2 /dev/sda /dev/sdb
```

</NewCodeBlock>

Please replace `/dev/sda` and `/dev/sdb` with your disk names.

3. Format the RAID 0 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkfs.ext4 /dev/md0
```

</NewCodeBlock>

4. Mount the RAID 0 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkdir /mnt/raid0
sudo mount /dev/md0 /mnt/raid0
```

</NewCodeBlock>

Although RAID 0 can provide more space and better performance, the entire system is very unreliable. If a failure occurs, no补救 can be taken. Therefore, RAID 0 is generally only used in situations where data security requirements are not high.

## Create RAID 1 Array

RAID 1 is a mirrored array that copies data to multiple disks. RAID 1 provides redundancy but has slower read/write speeds. To create a RAID 1 array, you need at least 2 disks. Follow these steps:

1. Use the `lsblk` command to view available disks:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
lsblk
```

</NewCodeBlock>

2. Use the `mdadm` command to create a RAID 1 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sda /dev/sdb
```

</NewCodeBlock>

Please replace `/dev/sda` and `/dev/sdb` with your disk names.

3. Format the RAID 1 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkfs.ext4 /dev/md0
```

</NewCodeBlock>

4. Mount the RAID 1 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkdir /mnt/raid1
sudo mount /dev/md0 /mnt/raid1
```

</NewCodeBlock>

## Create RAID 5 Array

RAID 5 is a striped array that splits data into blocks and distributes them across multiple disks, but adds parity operations. To create a RAID 5 array, you need at least 3 disks. Follow these steps:

1. Use the `lsblk` command to view available disks:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
lsblk
```

</NewCodeBlock>

2. Use the `mdadm` command to create a RAID 5 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sda /dev/sdb /dev/sdc
```

</NewCodeBlock>

Please replace `/dev/sda`, `/dev/sdb`, and `/dev/sdc` with your disk names.

3. Format the RAID 5 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkfs.ext4 /dev/md0
```

</NewCodeBlock>

4. Mount the RAID 5 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkdir /mnt/raid5
sudo mount /dev/md0 /mnt/raid5
```

</NewCodeBlock>

RAID 5 provides better performance and redundancy, but there is some performance loss when writing data. If one disk is damaged, the RAID 5 array can continue working. However, when replacing the damaged disk, the entire array needs to be rebuilt, which may take some time. The rebuild process is also prone to damaging other disks.

## Create RAID 10 Array

RAID 10, also known as RAID 1+0, first performs mirroring (RAID 1), then stripes (RAID 0). To create a RAID 10 array, you need at least 4 disks. Follow these steps:

1. Use the `lsblk` command to view available disks:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
lsblk
```

</NewCodeBlock>

2. Use the `mdadm` command to create a RAID 10 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sda /dev/sdb /dev/sdc /dev/sdd
```

</NewCodeBlock>

Please replace `/dev/sda`, `/dev/sdb`, `/dev/sdc`, and `/dev/sdd` with your disk names.

3. Format the RAID 10 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkfs.ext4 /dev/md0
```

</NewCodeBlock>

4. Mount the RAID 10 array:

<NewCodeBlock tip="radxa@radxa-taco$" type="device">

```bash
sudo mkdir /mnt/raid10
sudo mount /dev/md0 /mnt/raid10
```

</NewCodeBlock>

RAID 10 provides better performance and redundancy, but requires more disks. If one disk is damaged, the RAID 10 array can continue working, and the rebuild speed is faster than RAID 5 arrays.
