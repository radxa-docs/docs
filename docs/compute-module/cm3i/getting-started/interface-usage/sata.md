---
sidebar_position: 12
---

# SATA 接口

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
