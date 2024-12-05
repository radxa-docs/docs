---
sidebar_position: 6
---

# PCIE 接口

- 接 PCIE 设备（这里以 PCIE 转 M.2转接板作为示例）

按照下图将 PCIE 转 M.2转接板连接好，同时插入 SSD。

<img src="/img/rock2a/rock-2a-pcie.webp" width="800" alt="rock 2a pack" />

- 开启 Overlay

  1. 打开 Kconsole 终端, 运行 rsetup 命令：

  <pre> $ rsetup </pre>

  2. 通过 [设备树配置](../../radxa-os/rsetup)。来启用 Enable PCIe 的 Overlay。

  :::tip

  请启用 [] Enable PCIe 项 Overlay。<br/>
  在启用成功显示 [*] Enable PCIe 后退出重启才能使配置生效。

  :::

  3. 重启系统

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

  2. 写入设备

  ```bash
  # dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=2048 status=progress
  2098200576 bytes (2.1 GB, 2.0 GiB) copied, 6 s, 350 MB/s
  2048+0 records in
  2048+0 records out
  2147483648 bytes (2.1 GB, 2.0 GiB) copied, 7.66734 s, 280 MB/s
  ```

:::tip
ROCK 2A 如果开启了 PCIE 功能，此时的 USB 3.0 OTG / HOST PORT 将只能作为 USB 3.0 OTG / HOST PORT 使用
:::
