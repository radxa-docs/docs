---
sidebar_position: 9
---

import USB from "../../../../common/accessories/\_usb.mdx";

# USB 接口

ROCK 2A 有 三个 USB 2.0 Host Port 和 一个 USB 3.0 OTG / Host Port

:::tip
ROCK 2A 默认是 USB 3.0 OTG / HOST PORT，如果开启 PCIE overlay 之后，将只能作为 USB 2.0 使用
:::

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

  如上所示，插入 ROCK 2A 的 USB 存储设备为 /dev/sda

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
