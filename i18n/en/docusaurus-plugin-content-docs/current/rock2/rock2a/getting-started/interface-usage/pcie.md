---
sidebar_position: 6
---

# PCIe Interface

- Connecting a PCIe Device (using a PCIe to M.2 adapter as an example)

Connect the PCIe to M.2 adapter as shown in the diagram, and insert the SSD.

<img src="/img/rock2a/rock-2a-pcie.webp" width="800" alt="rock 2a pack" />

- Enable Overlay

  1. Open the Kconsole terminal and run the rsetup command:

  <pre> $ rsetup </pre>

  2. Through [Device Tree Configuration]to enable the "Enable PCIe" overlay.

  :::tip

  Please enable the [] Enable PCIeoverlay item.<br/>
  After successfully enabling [*] Enable PCIe, exit and reboot to apply the configuration.

  :::

  3. Reboot the system.

- Testing

  1. The SSD device can be recognized.

  ```bash
  $ lsblk 
  ...
  nvme0n1     259:0    0 953.9G  0 disk 
  ├─nvme0n1p1 259:1    0    16M  0 part 
  ├─nvme0n1p2 259:2    0   300M  0 part 
  └─nvme0n1p3 259:3    0 953.5G  0 part
  ...
  ```

  2. Reading the Device

  ```bash
  # dd if=/dev/nvme0n1 of=/dev/zero bs=1M count=2048 status=progress
  2100297728 bytes (2.1 GB, 2.0 GiB) copied, 5 s, 420 MB/s
  2048+0 records in
  2048+0 records out
  2147483648 bytes (2.1 GB, 2.0 GiB) copied, 5.94583 s, 361 MB/s
  ```

  2. Writing to the Device
  
  ```bash
  # dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=2048 status=progress                              
  2098200576 bytes (2.1 GB, 2.0 GiB) copied, 6 s, 350 MB/s
  2048+0 records in
  2048+0 records out
  2147483648 bytes (2.1 GB, 2.0 GiB) copied, 7.66734 s, 280 MB/s
  ```

:::tip
If the PCIe function is enabled on the ROCK 2A, the USB 3.0 OTG/HOST PORT can only be used as a USB 3.0 OTG/HOST PORT.
:::