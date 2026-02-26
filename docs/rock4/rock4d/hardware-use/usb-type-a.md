---
sidebar_position: 3
---

# USB Type-A 接口

瑞莎 ROCK 4D 板载 4 个 USB Type-A 接口，其中 2 个 USB 3.0 接口，2 个 USB 2.0 接口。

- USB 3.0 Type-A

理论上最大传输速率为 5Gbps，接口内部颜色通常为蓝色。

其中上方的 USB 3.0 Type-A 接口支持 OTG 和 HOST 模式，下方的 USB 3.0 Type-A 接口仅支持 HOST 模式。

- USB 2.0 Type-A

理论上最大传输速率为 480Mbps，接口内部颜色通常为黑色。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-typea.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

分别测试 USB 3.0/2.0 Type-A HOST 模式和 OTG 模式。

可以给每个 USB Type-A 接口连接鼠标、键盘等 USB 设备，反复插拔测试，判断 ROCK 4D 是否正常识别和工作。

### USB HOST 测试

#### 未接 USB 外设

使用 `lsusb` 命令查看 USB 设备列表。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
lsusb
```
</NewCodeBlock>

终端输出示例：

```text
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID a69c:8d80 aicsemi AIC Wlan
Bus 003 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

#### 已接 USB 外设

使用 `lsusb` 命令查看 USB 设备列表，观察是否识别到连接的 USB 外设。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
lsusb
```
</NewCodeBlock>

终端输出示例：我在 USB 接口连接了一个读卡器

```text
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID a69c:8d80 aicsemi AIC Wlan
Bus 003 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 003: ID 067b:2731 Prolific Technology, Inc. USB SD Card Reader
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

两者对比，可以观察到连接了 USB 外设后，`Bus 002 Device 003` 的 ID 发生了变化，说明 USB 外设被正确识别。

### USB 读写测试

使用 U 盘连接到 USB 2.0 或 USB 3.0 Type-A 接口，可以使用 `dd` 命令测试 USB 读写性能。

#### 确认存储设备

使用 `lsblk` 命令确认 U 盘的设备名称。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
lsblk
```
</NewCodeBlock>

终端输出示例：其中 `sda` 为 我当前 U 盘设备名称，请根据实际情况替换。

```text
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda           8:0    1   58G  0 disk
mtdblock0    31:0    0   16M  0 disk
mmcblk1     179:0    0   58G  0 disk
├─mmcblk1p1 179:1    0   16M  0 part /config
├─mmcblk1p2 179:2    0  300M  0 part /boot/efi
└─mmcblk1p3 179:3    0 57.6G  0 part /
zram0       253:0    0  1.9G  0 disk [SWAP]
```

#### 测试写入性能

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo dd if=/dev/zero of=/dev/sda bs=1M count=100
```
</NewCodeBlock>

- `dd` : Linux 系统中的一个命令行工具，用于复制和转换文件。
- `if=/dev/zero` : 指定输入文件为 `/dev/zero`，这是一个特殊的文件，会提供无限的零字节数据。
- `of=/dev/sda` : 指定输出文件为 `/dev/sda`，即 U 盘设备。
- `bs=1M` : 指定块大小为 1MB。
- `count=100` : 指定复制 100 个块。

这个命令会将 100MB 的零字节数据写入 U 盘，显示写入速度。

终端输出示例：

```text
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 3.40424 s, 30.8 MB/s
```

#### 测试读取性能

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo dd if=/dev/sda of=/dev/null bs=1M count=100
```
</NewCodeBlock>

- `dd` : Linux 系统中的一个命令行工具，用于复制和转换文件。
- `if=/dev/sda` : 指定输入文件为 `/dev/sda`，即 U 盘设备。
- `of=/dev/null` : 指定输出文件为 `/dev/null`，这是一个特殊的文件，会丢弃所有写入的数据。
- `bs=1M` : 指定块大小为 1MB。
- `count=100` : 指定复制 100 个块。

这个命令会将 U 盘的 100MB 数据读取到 `/dev/null`，并显示读取速度。

终端输出示例：

```text
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 4.0582 s, 25.8 MB/s
```

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

### USB 2.0 Type-A

| Pin# | Name        | Pin# | Name        | Pin# | Name |
| :--: | :---------- | :--: | :---------- | :--: | :--- |
|  1   | 5V_USB_HOST |  5   | 5V_USB_HOST |  9   | GND  |
|  2   | USB20_2DM   |  6   | USB20_3DM   |  10  | GND  |
|  3   | USB20_2DP   |  7   | USB20_3DP   |  11  | GND  |
|  4   | GND         |  8   | GND         |  12  | GND  |

### USB 3.0 Type-A

| Pin# | Name           | Pin# | Name           | Pin# | Name          |
| :--: | :------------- | :--: | :------------- | :--: | :------------ |
|  1   | 5V_USB_OTG0    |  9   | USB3_OTGOSSTXP |  17  | USB3_OTG1_TXN |
|  2   | USB3_OTG0DM    |  10  | 5V_USB_HOST    |  18  | USB3_OTG1_TXP |
|  3   | USB3_OTG0DP    |  11  | USB3_HOST1DM   |  19  | GND           |
|  4   | GND            |  12  | USB3_HOST1DP   |  20  | GND           |
|  5   | USB3_OTG0SSRXN |  13  | GND            |  21  | GND           |
|  6   | USB3_OTG0SSRXP |  14  | USB3_OTG1_RXN  |  22  | GND           |
|  7   | GND            |  15  | USB3_OTG1_RXP  |      |               |
|  8   | USB3_OTGOSSTXN |  16  | GND            |      |               |
