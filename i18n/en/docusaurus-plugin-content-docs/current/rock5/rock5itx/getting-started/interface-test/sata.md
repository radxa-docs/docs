---
sidebar_position: 14
---

# Sata

SATA is a computer bus interface that connects host bus adapters to mass storage devices such as hard disk drives, optical drives, and solid-state drives. Serial ATA succeeded the earlier Parallel ATA (PATA) standard to become the predominant interface for storage devices.

## Interface test methods

### Read and write tests

- Install the hdparm utility

```bash
sudo apt-get install hdparm
``

- Testing read speed

``bash
sudo hdparm -t /dev/sdX
```

- Testing write speed

```bash
sudo hdparm -tT --direct /dev/sdX
```

### Group raid 5 array

- Inserting 4 sata drives into the ROCK 5 ITX sata interface

- Install mdadm

```bash
sudo apt-get update
sudo apt-get install mdadm
```

- Creating a RAID 0 Array

Use the following command to create a RAID 5 array. This will create a RAID device named /dev/md0:

```bash
sudo mdadm --create /dev/md0 --level=5 --raid-devices=4 /dev/sdX1 /dev/sdX1 /dev/sdX1 /dev/sdX1 /dev/sdX1
```

After executing this command, the system will ask if you want to continue. Type y and press Enter.

- Checking the RAID Status

After creating a RAID, you can use the following command to check its status:

```bash
cat /proc/mdstat
```

- Formatting a RAID device

Before using a RAID device, it needs to be formatted. For example, to format a RAID device using the ext4 file system, execute the following command:

````bash
sudo mkfs.ext4 /dev/md0
``

- Mounting the RAID Device

Create a mount point and mount the RAID device:

```bash
sudo mkdir /mnt/raid
sudo mount /dev/md0 /mnt/raid
``

- Automounting

To automatically mount the RAID device when the system boots, you need to add it to the /etc/fstab file. Open the file and add the following line:

```bash
/dev/md0 /mnt/raid ext4 defaults 0 0
````

- Saving the RAID Configuration

Finally, save the RAID configuration to preserve the RAID array after a reboot

```bash
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf
```

- Update initialise ramdisk

```bash
sudo update-initramfs -u
```

RAID 0 provides high performance read and write capability, but does not provide redundancy. If one of the drives fails, all data will be lost.

- Change the user group

```bash
sudo chown -R radxa:radxa /mnt/raid/
```

- Remove a RAID-5 array

```bash
sudo mdadm --remove /dev/md0
sudo mdadm --stop /dev/md0
sudo mdadm --zero-superblock /dev/sda1 # clear superblock information
sudo mdadm --zero-superblock /dev/sdb1
sudo mdadm --zero-superblock /dev/sdc1
sudo mdadm --zero-superblock /dev/sdd1
```
