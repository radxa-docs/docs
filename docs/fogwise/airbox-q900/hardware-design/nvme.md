---
sidebar_position: 8
---

# M.2 M Key 2230 插槽

瑞莎 Fogwise® AIRbox Q900 板载 1 个 M.2 M Key 2230 插槽，支持 M.2 2230 SSD，用于存储系统数据。

## 硬件连接

主板关机后，将 M.2 2230 SSD 插入 M.2 M Key 2230 插槽并使用螺丝固定即可使用。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-nvme.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

### 查看 NVMe 设备信息

使用 `lsblk` 命令查看当前系统的 NVMe 设备信息。

<NewCodeBlock tip="radxa@airbox$" type="device">
```
lsblk
```
</NewCodeBlock>

输出示例：

```
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
···
nvme0n1     259:39   0 119.2G  0 disk
├─nvme0n1p1 259:40   0   100M  0 part
├─nvme0n1p5 259:41   0     4G  0 part
├─nvme0n1p6 259:42   0     4G  0 part
└─nvme0n1p7 259:43   0 111.1G  0 part
```

### 测试读写速度

使用 `dd` 命令测试 NVMe 设备的读写速度。

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
  <summary>演示示例：NVMe</summary>
  <p>
- 写入测试

使用 `dd` 命令向 NVMe 设备写入 1G 的数据。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=1024
```

</NewCodeBlock>

写入完成后，终端会显示写入的字节数、耗时以及传输速率。

- 读取测试

使用 `dd` 命令向 NVMe 设备读取 1G 的数据。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo dd if=/dev/nvme0n1 of=/dev/null bs=1M count=1024
```

</NewCodeBlock>

读取完成后，终端会显示读取的字节数、耗时以及传输速率。

 </p>
</details>
