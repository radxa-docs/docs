---
sidebar_position: 16
---

# PCIe M Key

## Brief introduction

The PCIE M Key interface is an interface standard for connecting high-performance expansion devices, typically on motherboards. It is one of the physical interface forms of the PCI Express (PCIe) bus.The M Key interface typically contains multiple lanes and supports higher data transfer rates, making it ideal for connecting high-performance devices.

## Support List

<!-- The ROCK 5 ITX theoretically supports the most common SSDs on the market, the following have been tested by the Radxa team: -->

## Interface Test Method

### Viewing Capacity

- Installing NVME Related Tools

```bash
radxa@rock-5-itx:~$ sudo apt-get install nvme-cli
```

- View Capacity

```bash
radxa@rock-5-itx:~$ sudo nvme list
[sudo] password for radxa:
Node             SN                   Model                                    Namespace Usage                      Format           FW Rev
---------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
/dev/nvme0n1     50026B7684E3662B     KINGSTON OM8PDP3256B-A01                 1         256.06  GB / 256.06  GB    512   B +  0 B   EDFK0S03
```

Based on the above output, the storage capacity of the SSD is 256.06 GB.

### Speed measurement

- Installing the FIO Tool

```bash
sudo apt install fio
```

- Writing test

<img src="/img/rock5itx/interface_usage/fio-write.webp" alt="fio write" />

- Reading test

<img src="/img/rock5itx/interface_usage/fio-read.webp" alt="fio read" />

### Booting the system from NVME

Please refer to the following documentation:

- <a href="../install-os/nvme" alt="d" >Boot the system from the SD card and flash NVME. </a>
- <a href="../../low-level-dev/maskrom/windows#pcie-m2-ssd">Flash NVME by RKDevtool</a>
