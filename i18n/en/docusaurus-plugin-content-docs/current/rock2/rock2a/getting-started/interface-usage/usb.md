---
sidebar_position: 9
---

import USB from "../../../../common/accessories/\_usb.mdx";

# USB Interface

ROCK 2A has three USB 2.0 Host Ports and one USB 3.0 OTG/Host Port.

:::tip
ROCK 2A defaults to USB 3.0 OTG/HOST PORT. If the PCIe overlay is enabled, it will only function as USB 2.0.
:::

- Repeatedly unplugging and plugging in peripherals

  Repeatedly unplug and plug in USB peripherals to ensure they are recognized and function correctly each time.

  Recognize Storage Devices

  <pre>
    $ lsusb
    <strong>
      Bus 001 Device 003: ID 067b:2731 Prolific Technology, Inc. USB SD Card Reader
    </strong>
  </pre>

  As shown above, the Micro-SD Card Reader has been successfully recognized.

- Transfer Rate

  1. Determine USB Storage Device

  Confirm the USB storage device using lsblk.

  ```bash
  $ lsblk
  NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
  sda            8:0    1 29.3G  0 disk
  ```

  As shown above, the USB storage device inserted into the Radxa E20C is identified as /dev/sda.

  2. Read Test

  <pre>
    $ sudo dd if=/dev/sda of=/dev/null bs=1M count=100
    100+0 records in
    100+0 records out
    104857600 bytes (105 MB, 100 MiB) copied, 3.35508 s, 31.3 MB/s
  </pre>

  This command will read data from the USB device and write it to /dev/null to test the read speed. The block size for writing is specified as 1M, and 100 blocks are to be read, resulting in a total of 100 MB of data read. The read speed is 31.3 MB/s.

  3. Write Test

  <pre>
    $ sudo dd if=/dev/zero of=/dev/sda bs=1M count=100
    100+0 records in
    100+0 records out
    104857600 bytes (105 MB, 100 MiB) copied, 5.12891 s, 20.4 MB/s
  </pre>

  The block size for writing is specified as 1M, and 100 blocks are written, resulting in a total of 100 MB of data written. The write speed is 20.4 MB/s.
