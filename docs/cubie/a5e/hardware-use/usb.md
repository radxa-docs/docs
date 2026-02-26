---
sidebar_position: 4
---

# USB Type-A / C 接口

瑞莎 Cubie A5E 板载 1 个 USB 3.0 Type-A 接口和 1 个 USB 2.0 Type-C 接口。

- USB 3.0 Type-A

  - 数据传输：支持 HOST 模式

- USB 2.0 Type-C
  - 数据传输：支持 OTG 模式和 FEL 模式刷机
  - 供电：支持 5V 供电

:::tip USB 3.0 Type-A 接口
由于 USB3.0 Type-A 接口和 PCIe 接口存在复用引脚，默认是关闭 USB 3.0 功能，使用 USB 2.0 功能。

开启 USB3.0 Type-A 接口需要进入 `rsetup` 设置界面，在 `Overlays` -> `Manage overlays`选项中启用 `Enable USB 3.0 and disable PCIe` 选项才可以开启 USB3.0 接口。
:::

## 使用指南

:::tip 接口位置
可以参考 [硬件信息](./hardware-info.md) 教程找到对应硬件接口位置
:::

### USB 2.0 Type-C

#### 主板供电

使用 5V Type-C 电源适配器进行供电，推荐电流 3A 及以上。

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)

:::

#### 刷机模式

主板进入 FEL 模式，使用 USB Type-C 数据线连接主板和 PC 进行供电。

:::info 进入 FEL 模式

需要在主板上电过程中检测到 UBOOT 按键被按下，主板才会进入 FEL 模式。

详细步骤:

① : 按住主板的 UBOOT 按键

② : 使用数据线连接主板的 OTG 接口和 PC

③ : 松开主板的 UBOOT 按键

<div style={{textAlign: 'center'}}>
  <img src="/img/common/other-system/fel-image/a5e-fel-mode.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

:::

### USB 3.0 Type-A

#### 基础功能

使用 USB 3.0 Type-A 接口连接鼠标、键盘等设备，测试系统是否正常识别和使用设备。

通过未接外设和已接外设对比测试，判断 USB 3.0 Type-A 接口是否可以正常识别设备；识别设备后，判断设备使用是否正常。

- 未接外设

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

- 已接外设

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

正常识别 USB 设备后，您就可以使用设备，验证设备使用是否正常。

#### 读写测试

使用 USB 3.0 Type-A 接口连接读卡器或 U 盘，使用 `dd` 命令测试读写速度。

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
