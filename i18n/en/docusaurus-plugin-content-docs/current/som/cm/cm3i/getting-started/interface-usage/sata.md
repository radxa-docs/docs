---
sidebar_position: 12
---

# SATA Interface

SATA is a computer bus interface that connects host bus adapters to mass storage devices such as hard disk drives, optical drives, and solid-state drives. Serial ATA succeeded the earlier Parallel ATA (PATA) standard to become the predominant interface for storage devices.

## Interface Test Methods

### Read and write tests

- Install the hdparm utility

```bash
sudo apt-get install hdparm
```

- Testing read speed

```bash
sudo hdparm -t /dev/sdX
```

- Testing write speed

```bash
sudo hdparm -tT --direct /dev/sdX
```
