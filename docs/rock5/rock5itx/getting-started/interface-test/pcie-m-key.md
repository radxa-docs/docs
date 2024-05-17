---
sidebar_position: 16
---

# PCIe M Key

## 简介

PCIE M Key 接口是一种用于连接高性能扩展设备的接口标准，通常用于主板上。它是 PCI Express（PCIe）总线的一种物理接口形式之一。M Key 接口通常包含多个通道，支持更高的数据传输速率，使其成为连接高性能设备的理想选择。

## 支持列表

ROCK 5 ITX 理论上支持市面上常见的 SSD, 以下是 Radxa 团队测试过的：

## 接口测试方法

### 查看容量

- 安装 NVME 相关工具

```bash
radxa@rock-5-itx:~$ sudo apt-get install nvme-cli
```

- 查看容量

```bash
radxa@rock-5-itx:~$ sudo nvme list
[sudo] password for radxa: 
Node             SN                   Model                                    Namespace Usage                      Format           FW Rev  
---------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
/dev/nvme0n1     50026B7684E3662B     KINGSTON OM8PDP3256B-A01                 1         256.06  GB / 256.06  GB    512   B +  0 B   EDFK0S03
```

根据上述输出，该 SSD 的存储容量为 256.06 GB。

### 测速

- 安装 FIO 工具

```bash
sudo apt install fio
```

- 写测试

<img src="/img/rock5itx/interface_test/fio-write.webp" alt="fio write" />

- 读测试

<img src="/img/rock5itx/interface_test/fio-read.webp" alt="fio read" />

### 从 NVME 启动系统

请参考以下文档：

- <a href="../install-os/nvme" alt="d" >SD 卡启动系统再刷 NVME </a>
- <a href="../../low-level-dev/maskrom/windows#pcie-m2-ssd">RKDevtool 刷 NVME </a>
