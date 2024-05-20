---
sidebar_position: 14
---

# Sata

SATA 是一种计算机总线接口，用于将主机总线适配器连接到硬盘驱动器、光驱和固态驱动器等大容量存储设备。串行 ATA 取代了早期的并行 ATA（PATA）标准，成为存储设备的主要接口。

## 接口测试方法

### 读写测试

- 安装 hdparm 工具

```bash
sudo apt-get install hdparm
```

- 测试读取速度

```bash
sudo hdparm -t /dev/sdX
```

- 测试写入速度

```bash
sudo hdparm -tT --direct /dev/sdX
```

### 组 raid 5 阵列

- 将 4 块 sata 硬盘插入 ROCK 5 ITX sata 接口

- 安装 mdadm

```bash
sudo apt-get update
sudo apt-get install mdadm
```

- 创建 RAID 0 阵列

使用以下命令创建RAID 5阵列。这将创建一个名为/dev/md0的RAID设备：

```bash
sudo mdadm --create /dev/md0 --level=5 --raid-devices=4 /dev/sdX1 /dev/sdX1 /dev/sdX1 /dev/sdX1
```

在执行此命令后，系统会询问是否要继续。输入y并按Enter键。

- 检查 RAID 状态

创建 RAID 后，可以使用以下命令检查其状态：

```bash
cat /proc/mdstat
```

- 格式化 RAID 设备

在使用RAID设备之前，需要对其进行格式化。例如，要使用 ext4 文件系统格式化 RAID 设备，请执行以下命令：

```bash
sudo mkfs.ext4 /dev/md0
```

- 挂载 RAID 设备

创建一个挂载点并挂载RAID设备：

```bash
sudo mkdir /mnt/raid
sudo mount /dev/md0 /mnt/raid
```

- 自动挂载

要在系统启动时自动挂载RAID设备，需要将其添加到 /etc/fstab 文件中。打开文件并添加以下行：

```bash
/dev/md0 /mnt/raid ext4 defaults 0 0
```

- 保存 RAID 配置

最后，保存RAID配置以在重启后保留RAID阵列

```bash
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf
```

- 更新初始化 ramdisk

```bash
sudo update-initramfs -u
```

RAID 0提供了高性能的读写能力，但不提供冗余。如果其中一块硬盘失败，将丢失所有数据。

- 改变用户组

```bash
sudo chown -R radxa:radxa /mnt/raid/
```

- 移除 RAID-5 阵列

```bash
sudo mdadm --remove /dev/md0
sudo mdadm --stop /dev/md0
sudo mdadm --zero-superblock /dev/sda1  # 清除超级块信息
sudo mdadm --zero-superblock /dev/sdb1
sudo mdadm --zero-superblock /dev/sdc1
sudo mdadm --zero-superblock /dev/sdd1
```
