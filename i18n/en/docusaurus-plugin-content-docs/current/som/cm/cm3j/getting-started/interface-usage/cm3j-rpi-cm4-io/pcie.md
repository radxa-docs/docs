---
sidebar_position: 11
---

# PCIE

## Usage Instructions

### Check Capacity

1. Install NVME related tools

   <pre>radxa@radxa-cm3j-rpi-cm4-io:~$ sudo apt-get install nvme-cli</pre>

2. Check Capacity

   <pre style={{ whiteSpace: "nowrap" }}>
     radxa@radxa-cm3j-rpi-cm4-io:~$ sudo nvme list
     <br />
     [sudo] password for radxa: Node SN Model Namespace Usage Format FW Rev
     ---------------- --------------------
     ---------------------------------------- ---------
     -------------------------- ---------------- -------- /dev/nvme0n1
     50026B7684E3662B KINGSTON OM8PDP3256B-A01 1 256.06 GB / 256.06 GB 512 B + 0
     B EDFK0S03
   </pre>

### Test Speed

1. Install fio tools

   <pre>radxa@radxa-cm3j-rpi-cm4-io:~$ sudo apt install fio</pre>

2. Read Test

   <pre style={{ whiteSpace: "nowrap" }}>
     radxa@radxa-cm3j-rpi-cm4-io:~$ sudo fio -rw=read -bs=1m -runtime=60 -iodepth 1
     -numjobs=8 -size=1G -filename /dev/nvme0n1 -ioengine libaio -direct=1
     -group_reporting -name seq_read
   </pre>

3. Write Test

   <pre style={{ whiteSpace: "nowrap" }}>
     radxa@{props.model}:~$ sudo fio -rw=write -bs=1m -runtime=60 -iodepth 1
     -numjobs=8 -size=1G -filename /dev/nvme0n1 -ioengine libaio -direct=1
     -group_reporting -name seq_write
   </pre>

### Boot the system from NVME

For the boot process, please refer to [Boot from SSD](../../install-os/boot_from_ssd.md)
