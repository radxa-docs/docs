---
sidebar_position: 11
---

# PCIE 接口

## 使用介绍

### 查看容量

1. 安装 NVME 相关工具

   <pre>radxa@radxa-cm3j-rpi-cm4-io:~$ sudo apt-get install nvme-cli</pre>

2. 查看容量

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

### 测速

1. 安装 FIO 工具

   <pre>radxa@radxa-cm3j-rpi-cm4-io:~$ sudo apt install fio</pre>

2. 读测试

   <pre style={{ whiteSpace: "nowrap" }}>
     radxa@radxa-cm3j-rpi-cm4-io:~$ sudo fio -rw=read -bs=1m -runtime=60 -iodepth 1
     -numjobs=8 -size=1G -filename /dev/nvme0n1 -ioengine libaio -direct=1
     -group_reporting -name seq_read
   </pre>

3. 写测试

   <pre style={{ whiteSpace: "nowrap" }}>
     radxa@{props.model}:~$ sudo fio -rw=write -bs=1m -runtime=60 -iodepth 1
     -numjobs=8 -size=1G -filename /dev/nvme0n1 -ioengine libaio -direct=1
     -group_reporting -name seq_write
   </pre>

### 从 NVME 启动系统

启动过程请参考[烧录镜像到 SSD 启动](../../install-os/boot-from-ssd.md)
