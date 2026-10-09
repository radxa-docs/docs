---
sidebar_position: 6
description: ""
---

# PCIE 接口

- 接 PCIE 设备（这里以 PCIE 转 M.2转接板作为示例）

按照下图将 PCIE 转 M.2转接板连接好，同时插入 SSD。

<img src="/img/rock2f/rock-2f-pcie.webp" width="800" alt="radxa-e20c pack" />

:::tip
ROCK 2F 默认已开启 PCIe，无需通过 rsetup 开启 Overlay。
:::

- 测试

  1. 可以识别到 SSD 设备

  ```bash
  $ lsblk
  ...
  nvme0n1     259:0    0 953.9G  0 disk
  ├─nvme0n1p1 259:1    0    16M  0 part
  ├─nvme0n1p2 259:2    0   300M  0 part
  └─nvme0n1p3 259:3    0 953.5G  0 part
  ...
  ```

  2. 读取设备

  ```bash
  # dd if=/dev/nvme0n1 of=/dev/zero bs=1M count=2048 status=progress
  2100297728 bytes (2.1 GB, 2.0 GiB) copied, 5 s, 420 MB/s
  2048+0 records in
  2048+0 records out
  2147483648 bytes (2.1 GB, 2.0 GiB) copied, 5.94583 s, 361 MB/s
  ```

  3. 写入设备

  ```bash
  # dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=2048 status=progress
  2098200576 bytes (2.1 GB, 2.0 GiB) copied, 6 s, 350 MB/s
  2048+0 records in
  2048+0 records out
  2147483648 bytes (2.1 GB, 2.0 GiB) copied, 7.66734 s, 280 MB/s
  ```
