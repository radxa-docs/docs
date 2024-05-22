---
sidebar_position: 4
---

# Create RAID Arrays with mdadm

mdadm is a Linux software RAID tool that can be used to create, manage, and monitor software RAID arrays. In this guide, we will show you how to create RAID 0, RAID 1, RAID 5 and RAID 10 arrays using mdadm.

## Install mdadm

Before getting started, make sure that mdadm is installed. If it is not installed, you can install it using the following commands:

```shell
sudo apt update
sudo apt install mdadm
```

## Create a RAID 0 Array

RAID 0 is a striped array that divides data into blocks and distributes it across multiple disks. RAID 0 provides faster read and write speeds but does not provide redundancy. To create a RAID 0 array, you will need at least 2 disks. Follow these steps:

1. Use the `lsblk` command to view the available disks:

    ```shell
    lsblk
    ```

2. Use the `mdadm` command to create a RAID 0 array:

    ```shell
    sudo mdadm --create --verbose /dev/md0 --level=0 --raid-devices=2 /dev/sda /dev/sdb
    ```

    Replace `/dev/sda` and `/dev/sdb` with your disk names.

3. Format the RAID 0 array:

    ```shell
    sudo mkfs.ext4 /dev/md0
    ```

4. Mount the RAID 0 array:

    ```shell
    sudo mkdir /mnt/raid0
    sudo mount /dev/md0 /mnt/raid0
    ```

While RAID 0 can provide more space and better performance, the entire system is very unreliable. If a failure occurs, there is no way to recover the data. Therefore, RAID 0 is generally only used in situations where data security is not a high priority.

## Create a RAID 1 Array

RAID 1 is a mirrored array that copies data to multiple disks. RAID 1 provides redundancy but slower read and write speeds. To create a RAID 1 array, you will need at least 2 disks. Follow these steps:

1. Use the `lsblk` command to view the available disks:

    ```shell
    lsblk
    ```

2. Use the `mdadm` command to create a RAID 1 array:

    ```shell
    sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sda /dev/sdb
    ```

    Replace `/dev/sda` and `/dev/sdb` with your disk names.

3. Format the RAID 1 array:

    ```shell
    sudo mkfs.ext4 /dev/md0
    ```

4. Mount the RAID 1 array:

    ```shell
    sudo mkdir /mnt/raid1
    sudo mount /dev/md0 /mnt/raid1
    ```

## Create a RAID 5 Array

RAID 5 is a striped array that divides data into blocks and distributes it across multiple disks, but it adds parity operations. To create a RAID 5 array, you will need at least 3 disks. Follow these steps:

1. Use the `lsblk` command to view the available disks:

    ```shell
    lsblk
    ```

2. Use the `mdadm` command to create a RAID 5 array:

    ```shell
    sudo mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sda /dev/sdb /dev/sdc
    ```

    Replace `/dev/sda`, `/dev/sdb`, and `/dev/sdc` with your disk names.

3. Format the RAID 5 array:

    ```shell
    sudo mkfs.ext4 /dev/md0
    ```

4. Mount the RAID 5 array:

    ```shell
    sudo mkdir /mnt/raid5
    sudo mount /dev/md0 /mnt/raid5
    ```

RAID 5 provides better performance and redundancy, but there is some performance loss when writing data. If a disk fails, the RAID 5 array can continue to work, but when replacing the failed disk, the entire array needs to be rebuilt, which may take some time and is also easy to damage other disks.

## Create a RAID 10 Array

RAID 10, also known as RAID 1+0, first mirrors (RAID 1) and then stripes (RAID 0). To create a RAID 10 array, you will need at least 4 disks. Follow these steps:

1. Use the `lsblk` command to view the available disks:

    ```shell
    lsblk
    ```

2. Use the `mdadm` command to create a RAID 10 array:

    ```shell
    sudo mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sda /dev/sdb /dev/sdc /dev/sdd
    ```

    Replace `/dev/sda`, `/dev/sdb`, `/dev/sdc`, and `/dev/sdd` with your disk names.

3. Format the RAID 10 array:

    ```shell
    sudo mkfs.ext4 /dev/md0
    ```

4. Mount the RAID 10 array:

    ```shell
    sudo mkdir /mnt/raid10
    sudo mount /dev/md0 /mnt/raid10
    ```

RAID 10 provides better performance and redundancy, but requires more disks. If a disk fails, the RAID 10 array can continue to work, and the rebuild speed is faster than the RAID 5 array.
