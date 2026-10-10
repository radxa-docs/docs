---
sidebar_position: 6
---

# PCIE Interface

- Connect PCIE Device（Here use a PCIE to M.2 adapter board as an example）

Follow the diagram below to connect the PCIE to M.2 adapter board properly, and simultaneously insert the SSD.

<img src="/img/rock2f/rock-2f-pcie.webp" width="800" alt="radxa-e20c pack" />

:::tip
PCIe is enabled by default on ROCK 2F. There is no need to enable the PCIe Overlay via rsetup.
:::

- Test

  1. Find the SSD device

  ```bash
  $ lsblk
  ...
  nvme0n1     259:0    0 953.9G  0 disk
  ├─nvme0n1p1 259:1    0    16M  0 part
  ├─nvme0n1p2 259:2    0   300M  0 part
  └─nvme0n1p3 259:3    0 953.5G  0 part
  ...
  ```

  2. Read Test

  ```bash
  # dd if=/dev/nvme0n1 of=/dev/zero bs=1M count=2048 status=progress
  2100297728 bytes (2.1 GB, 2.0 GiB) copied, 5 s, 420 MB/s
  2048+0 records in
  2048+0 records out
  2147483648 bytes (2.1 GB, 2.0 GiB) copied, 5.94583 s, 361 MB/s
  ```

  3. Write Test

  ```bash
  # dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=2048 status=progress
  2098200576 bytes (2.1 GB, 2.0 GiB) copied, 6 s, 350 MB/s
  2048+0 records in
  2048+0 records out
  2147483648 bytes (2.1 GB, 2.0 GiB) copied, 7.66734 s, 280 MB/s
  ```
