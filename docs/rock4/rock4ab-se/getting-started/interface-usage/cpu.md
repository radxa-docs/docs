---
sidebar_position: 1
---

# CPU

## CPU 频率支持信息

<Tabs queryString="model">

    <TabItem value="ROCK 4A/4B">
        Rockchip RK3399 SoC， 有 6 个 CPU 内核 <br/> 两个大核 Cortex-A72， 频率 1.8 GHz， 最高可达 2.0 GHz <br/> 四个小核 Cortex-A53， 频率 1.4 GHz，最高可达 1.6 GHz
    </TabItem>

    <TabItem value="ROCK 4A+/4B+">
        Rockchip OP1 SoC，有 6 个 CPU 内核 <br/> 两个  Cortex A72 核心，频率 2.0 GHz，最高可达 2.4 GHz <br/> 四个 Cortex A53 核心，频率 1.6GHz
    </TabItem>

    <TabItem value="ROCK 4SE">
        Rockchip RK3399-T SoC， 有 6 个 CPU 内核 <br/> 两个大核 Cortex A72，频率 1.5GHz， 最高可达 1.8 GHz <br/> 四 Cortex®-A53，频率 1.0GHz
    </TabItem>

</Tabs>

## 超频

超频是通过提升硬件运行频率来提高性能的操作，但需要注意散热、稳定性和硬件寿命。

:::warning

超频有风险，需谨慎操作。此处以 ROCK 4SE 为例

:::

- 查看当前频率

```bash

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
408000
408000
408000
408000
408000
408000

```

- 使用 rsetup 开启超频的 Overlay

- 查看超频后的频率

```bash

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
1512000
1512000
1512000
1512000
1800000
1800000

```

- 验证稳定性

  - 开启终端，进行压测

  ```bash

  stress -c 6 -t 600

  ```

  - 新开一个终端，同时监控当前频率

  ```bash

  watch -n 1 "cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq"

  ```

  如果压测时的频率与超频后的频率保持一致，且稳定不变的话，则说明超频成功，如果压测的频率会小于超频后的频率，则说明超频失败。

## 定频

定频是将硬件频率固定在某一值，避免动态调整，以获得稳定的性能表现。

:::tip

此处以 ROCK 4SE 为例

:::

- 查看大小核支持的频率

```bash

radxa@rock-4se:~$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
408000 600000 816000 1008000 1512000
radxa@rock-4se:~$ cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_available_frequencies
408000 600000 816000 1008000 1200000 1416000 1512000 1800000

```

- 查看当前频率

```bash

radxa@rock-4se:~$ cat /sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq
408000
radxa@rock-4se:~$ cat /sys/devices/system/cpu/cpufreq/policy4/scaling_cur_freq
408000

```

- 设置使用自定义频率

```bash

radxa@rock-4se:~$ echo userspace | sudo tee /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
userspace
radxa@rock-4se:~$ echo userspace | sudo tee /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
userspace

```

- 写入频率

```bash

echo 1008000 | sudo tee /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
1008000

echo 1512000 | sudo tee /sys/devices/system/cpu/cpufreq/policy4/scaling_setspeed
1512000
radxa@rock-4se:~$

```

- 查看是否成功写入

```bash

radxa@rock-4se:~$ cat /sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq
1008000
radxa@rock-4se:~$ cat /sys/devices/system/cpu/cpufreq/policy4/scaling_cur_freq
1512000

```

## 设置 CPU 为性能模式

设置 CPU 为性能模式也是一种提升 CPU 性能的方法

- 设置性能模式

```bash

radxa@rock-4se:~$ echo performance | sudo tee /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
performance
radxa@rock-4se:~$ echo performance | sudo tee /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
performance

```

- 查看是否设置成功

```bash

radxa@rock-4se:~$ cat  /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
performance
radxa@rock-4se:~$ cat  /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
performance

```
