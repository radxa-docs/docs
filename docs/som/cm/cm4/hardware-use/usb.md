---
sidebar_position: 5
---

# USB Type-A / C 接口

瑞莎 CM4 IO 板板载 1 个 USB 3.0 Type-C、1 个 USB 3.0 Type-A、2 个 USB 2.0 Type-A 接口。

- USB 3.0 Type-C 接口

支持 OTG 和 HOST 模式。

- USB 3.0 Type-A 接口

仅支持 HOST 模式，理论上最大传输速率为 5Gbps，接口内部颜色为蓝色。

- USB 2.0 Type-A 接口

仅支持 HOST 模式，理论上最大传输速率为 480Mbps，接口内部颜色为黑色。

## 硬件连接

USB Type-A/C 接口可以连接鼠标、键盘、U 盘等设备进行使用；

其中 Type-A 接口还支持 OTG 模式，可以通过启用 ADB 来验证功能。

:::tip 接口位置
可以参考 [硬件信息](./hardware_info.md) 教程找到对应硬件接口位置
:::

## HOST 模式

测试 USB 接口的 HOST 模式功能，我们可以测试 USB 接口连接的设备基础功能和 U 盘读写速度。

### 基础功能

我们可以给 USB 接口连接读卡器、鼠标、键盘等设备，通过插拔测试设备是否正常识别和使用。

#### 未接外设

使用 `lsusb` 命令查看当前系统识别的设备。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
lsusb
```
</NewCodeBlock>

终端输出示例：

```text
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID a69c:8d81 AICSemi AIC 8800D80
Bus 001 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

#### 已接外设

连接读卡器、鼠标、键盘等设备到 USB 接口，使用 `lsusb` 命令查看是否新增设备。

<NewCodeBlock tip="radxa@device$" type="device">
```bash
lsusb
```
</NewCodeBlock>

终端输出示例：我在 USB 接口连接了一个读卡器

```text
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID a69c:8d81 AICSemi AIC 8800D80
Bus 001 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 003: ID 067b:2731 Prolific Technology, Inc. USB SD Card Reader
```

通过两者的输出信息对比，可以确定新增的 USB 设备被正常识别，新增的设备 ID 为 `067b:2731`。

正常识别 USB 设备后，您就可以使用设备验证功能是否正常。

### 读写测试

使用 U 盘连接到 USB 接口，使用 `dd` 命令测试 U 盘读写速度。

#### 确认存储设备

使用 `lsblk` 命令确认 U 盘的设备名称。

<NewCodeBlock tip="radxa@device$" type="device">
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

<NewCodeBlock tip="radxa@device$" type="device">
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

<NewCodeBlock tip="radxa@device$" type="device">
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

## OTG 模式

通过启用 ADB 功能来验证瑞莎 CM4 的 OTG 模式功能。

### 启用 ADB 功能

使用 `rsetup` 工具启用 ADB 功能。

:::tip Rsetup 工具使用
Rsetup 工具使用可以参考 [Rsetup 使用](../system-use/rsetup) 教程。
:::

<NewCodeBlock tip="radxa@device$" type="device">
```bash
rsetup
```
</NewCodeBlock>

依次进入 `Hardware` -> `USB OTG services` 选项界面，勾选 `radxa-adbd@23000000.usb` 选项启用 ADB 功能。

### 测试 OTG 功能

使用 Type-C 数据线连接 PC 和瑞莎 CM4 底板的 USB 3.0 Type-C 接口，通过 `adb` 命令测试 OTG 功能。

#### 安装 ADB 工具

<NewCodeBlock tip="Linux$" type="host">
```bash
sudo apt install adb
```
</NewCodeBlock>

#### 查看 ADB 设备

使用 `adb devices` 命令查看 ADB 设备。

<NewCodeBlock tip="Linux$" type="host">
```bash
adb devices
```
</NewCodeBlock>

终端输出示例：说明识别到一个 ADB 设备

```text
List of devices attached
0123456789ABCDEF	device
```

#### 测试 ADB 功能

使用 `adb shell` 命令进入瑞莎 CM4 终端 Shell。

<NewCodeBlock tip="Linux$" type="host">
```bash
adb shell
```
</NewCodeBlock>

成功进入瑞莎 CM4 终端，说明 OTG 功能正常，你可以通过一下常用命令查看瑞莎 CM4 系统信息。

## 接口引脚定义

可以参考 [资源汇总下载](../download.md) 页面的硬件原理图。
