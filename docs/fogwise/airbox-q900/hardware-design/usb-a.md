---
sidebar_position: 3
---

# USB Type-A 接口

瑞莎 Fogwise® AIRbox Q900 板载 2 个 USB Type-A 接口（其中 1 个为 USB 3.1 Gen2 OTG Type-A，1 个为 USB 3.1 Gen2 HOST Type-A），用于连接 USB 设备。

由于 Fogwise® AIRbox Q900 主板在安装到金属外壳后方向会反转，导致 OTG 和 HOST 端口位置对调：

- 无外壳时：USB 3.1 Gen2 OTG Type-A（上），USB 3.1 Gen2 HOST Type-A（下）
- 有外壳时：USB 3.1 Gen2 OTG Type-A（下），USB 3.1 Gen2 HOST Type-A（上）

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-usb-a-port.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

### 基础功能

使用 USB Type-A 接口连接鼠标、键盘、U 盘等设备使用。

通常我们通过未接和已连接 USB 设备来使用 `lsusb` 命令来对比 USB 外设信息，从而确认设备是否正常识别。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
lsusb
```

</NewCodeBlock>

<details>
  <summary>演示示例：U 盘</summary>
  <p>
- 未接 U 盘

使用 `lsusb` 命令查看当前系统的 USB 设备信息。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
lsusb
```

</NewCodeBlock>

输出示例：

```
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

- 已接 U 盘

使用 `lsusb` 命令查看当前系统的 USB 设备信息。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
lsusb
```

</NewCodeBlock>

输出示例：

```
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 002: ID 3535:6300 aigo  U330
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

其中 `Bus 002 Device 002: ID 3535:6300 aigo U330` 就是 U 盘的设备信息。

  </p>
</details>

### 读写测试

使用 USB Type-A 接口连接读卡器或者 U 盘，通过 `dd` 命令进行读写测试。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo dd if=source_file/device of=target_file/device bs=block_size count=block_number
```

</NewCodeBlock>

:::tip dd 命令参数说明

- `if`：输入文件或设备
- `of`：输出文件或设备
- `bs`：块大小
- `count`：块数量

:::

<details>
  <summary>演示示例：U 盘</summary>
  <p>

提前将 U 盘连接到任意 1 个 USB Type-A 接口。

- 确认存储设备

使用 `lsblk` 命令查看当前系统的存储设备信息（可以通过未接和已连接 U 盘对比确认 U 盘设备信息）。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
lsblk
```

</NewCodeBlock>

输出示例：

```
NAME    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda       8:0    0 114.4G  0 disk
├─sda1    8:1    0   512M  0 part /boot/efi
├─sda2    8:2    0    30M  0 part
└─sda3    8:3    0 113.8G  0 part /
···
sdi       8:128  1  29.3G  0 disk
```

其中 `sdi` 就是 U 盘的设备信息。

- 写入测试

使用 `dd` 命令向 U 盘写入 1G 的数据。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo dd if=/dev/zero of=/dev/sdi bs=1M count=1024
```

</NewCodeBlock>

写入完成后，终端会显示写入的字节数、耗时以及传输速率。

- 读取测试

使用 `dd` 命令向 U 盘读取 1G 的数据。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo dd if=/dev/sdi of=/dev/null bs=1M count=1024
```

</NewCodeBlock>

读取完成后，终端会显示读取的字节数、耗时以及传输速率。

 </p>
</details>

## 接口规格

:::note 技术参考

完整的技术规格和引脚定义可参考 [下载专区](../download.md#硬件设计) 的硬件设计文档!

:::
