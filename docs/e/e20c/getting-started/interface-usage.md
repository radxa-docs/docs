---
sidebar_position: 5
---

# 接口使用说明

## 接口预览

<img src="/img/e/e20c/radxa-e20c-hardware-overview.webp" width="800" alt="radxa-e20c pack" />

## 接口使用说明

### SYS LED

系统状态灯，当系统启动后将会有节拍的闪烁，绿灯。

### WAN / LAN LED

WAN / LAN 网口信号灯，其亮灭跟随 WAN / LAN 网口的信号变化。

### User Button

用户按键。

### USB Type-C 5V 电源接口

电源输入，Radxa E20C 固定电压为 5V 输入，可参考[电源选择](/e/e20c/getting-started/power-supply.md)。

### Gigabit Ethernet Port

Radxa E20C 提供两个千兆以太网端口。在 OpenWrt 系统下，这两个接口可以灵活配置为 WAN（广域网接口）或 LAN（局域网接口）端口，为用户提供高度定制的网络解决方案。

#### 唯一 MAC 地址

Radxa E20C 的 MAC 地址是唯一且固定的，在每次断电重启或者软件重启，MAC 都保持不变，且重新刷机后也是保持不变的。

#### 网口测速

- 安装 iperf3 工具

```bash
sudo apt-get install iperf3
```

- 在服务器端运行命令：

```bash
iperf -s
```

- 测速

1. 测试上传速度

```bash
iperf3 -c server-ip -t 60
```

2. 测试下载速度

```bash
iperf3 -c server-ip -t 60 -R
```

### USB Type-C

作为调试口的同时也是烧录口，用以查看日志和访问设备，波特率默认1500000，还有通过这个 TYPE-C 口完成刷机。

### Maskrom Button

Maskrom 按键，用以进入 Maskrom 模式完成刷机。

### USB 2.0 Host

- 反复拔插外设

  反复拔插 USB 外设，确保每次都能正常识别得到，且正常使用

  识别存储设备

  <pre>
    $ lsusb
    <strong>
      Bus 001 Device 003: ID 067b:2731 Prolific Technology, Inc. USB SD Card Reader
    </strong>
  </pre>

  如上所示，这里已经成功识别到了 Micro-SD Card Reader

- 传输速率

  1. 确定 USB 存储设备

  通过 lsblk 确认 USB 存储设备

  ```bash
  $ lsblk
  NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
  sda            8:0    1 29.3G  0 disk
  ```

  如上所示，插入 Radxa E20C 的 USB 存储设备为 /dev/sda

  2. 读取测试

  <pre>
    $ sudo dd if=/dev/sda of=/dev/null bs=1M count=100
    100+0 records in
    100+0 records out
    104857600 bytes (105 MB, 100 MiB) copied, 3.35508 s, 31.3 MB/s
  </pre>

  这个命令将会从 USB 设备读取数据，并将其写入 /dev/null，以便测试读取速度。这里指定了写入的块的大小为 1M，指定了读取 100 个块，因此总共读取了 100 MB 的数据，读取速度为 31.3 MB/s

  3. 写入测试

  <pre>
    $ sudo dd if=/dev/zero of=/dev/sda bs=1M count=100
    100+0 records in
    100+0 records out
    104857600 bytes (105 MB, 100 MiB) copied, 5.12891 s, 20.4 MB/s
  </pre>

  这里指定了写入的块的大小为 1M，写入了 100 个块，总共写入了 100 M 的数据，写入速度为 20.4 MB/s

### microSD Card Slot

#### 简介

Micro SD，全称Micro Secure Digital，是一种小型存储卡，属于Secure Digital（SD）卡的一种变种。它是由SD卡协会（SD Association）制定和推出的，旨在为便携设备提供可扩展的存储解决方案。

### eMMc

#### 识别

```bash
$ lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
mmcblk0      179:0    0   58G  0 disk
|-mmcblk0p1  179:1    0   16M  0 part /config
|-mmcblk0p2  179:2    0  300M  0 part /boot/efi
`-mmcblk0p3  179:3    0 57.6G  0 part /
mmcblk1      179:32   0 14.6G  0 disk
mmcblk1boot0 179:64   0    4M  1 disk
mmcblk1boot1 179:96   0    4M  1 disk
zram0        254:0    0  1.9G  0 disk [SWAP]
```

mmcblk1就是 eMMC 了。

#### 读取测试

```bash
# dd if=/dev/mmcblk1 of=/dev/null bs=64k count=16k
16384+0 records in
16384+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 3.9136 s, 274 MB/s
```

读取速度 274 MB/s

#### 写入测试

```bash
# dd if=/dev/zero of=/dev/mmcblk1 bs=64k count=16k
16384+0 records in
16384+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 20.6661 s, 52.0 MB/s
```

写入速度：52.0 MB/s
