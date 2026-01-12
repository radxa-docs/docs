---
sidebar_position: 3
---

# Performance Setting Guide

## Setting CPU Frequency

- Switch to root user login

<NewCodeBlock tip="Linux$" type="device">

```bash

sudo -s

```

</NewCodeBlock>

- Set userspace mode

<NewCodeBlock tip="Linux$" type="device">

```bash
root@ubuntu:# cd /sys/devices/system/cpu/cpufreq/
root@ubuntu:/sys/devices/system/cpu/cpufreq# cd policy0/
root@ubuntu:/sys/devices/system/cpu/cpufreq/policy0# echo userspace > scaling_governor
root@ubuntu:/sys/devices/system/cpu/cpufreq/policy0# cd ../policy4/
root@ubuntu:/sys/devices/system/cpu/cpufreq/policy4# echo userspace > scaling_governor
root@ubuntu:/sys/devices/system/cpu/cpufreq/policy4# cd ../policy7/
root@ubuntu:/sys/devices/system/cpu/cpufreq/policy7# echo userspace > scaling_governor

```

</NewCodeBlock>

- View available frequencies

<NewCodeBlock tip="Linux$" type="device">

```bash

root@ubuntu:/sys/devices/system/cpu/cpufreq# cat policy*/scaling_available_frequencies
300000 691200 806400 940800 1152000 1324800 1516800 1651200 1804800 1958400
691200 940800 1228800 1344000 1516800 1651200 1900800 2054400 2131200 2400000
806400 1056000 1324800 1516800 1766400 1862400 2035200 2208000 2380800 2515200 2707200

```

</NewCodeBlock>

- Set maximum frequency

<NewCodeBlock tip="Linux$" type="device">

```bash

root@ubuntu:/sys/devices/system/cpu/cpufreq# echo 1958400 > policy0/scaling_setspeed
root@ubuntu:/sys/devices/system/cpu/cpufreq# echo 2400000 > policy4/scaling_setspeed
root@ubuntu:/sys/devices/system/cpu/cpufreq# echo 2707200 > policy7/scaling_setspeed

```

</NewCodeBlock>

## Setting GPU Frequency

- Switch to root user login

<NewCodeBlock tip="Linux$" type="device">

```bash

sudo -s

```

</NewCodeBlock>

- Set userspace mode

<NewCodeBlock tip="Linux$" type="device">

```bash
cd /sys/class/devfreq/3d00000.gpu

root@ubuntu:/sys/class/devfreq/3d00000.gpu# echo userspace > governor

```

</NewCodeBlock>

- View available frequencies

<NewCodeBlock tip="Linux$" type="device">

```bash

root@ubuntu:/sys/class/devfreq/3d00000.gpu# cat available_frequencies
315000000 450000000 550000000 608000000 700000000 812000000

```

</NewCodeBlock>

- Set maximum frequency

<NewCodeBlock tip="Linux$" type="device">

```bash

root@ubuntu:/sys/class/devfreq/3d00000.gpu# echo 812000000 > userspace/set_freq

```

</NewCodeBlock>
