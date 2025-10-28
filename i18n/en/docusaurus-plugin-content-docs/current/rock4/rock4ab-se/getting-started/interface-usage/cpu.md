---
sidebar_position: 1
---

# CPU

## CPU Frequency Support Information

<Tabs queryString="model">

    <TabItem value="ROCK 4A/4B">
        Rockchip RK3399 SoC with 6 CPU cores <br/> Two big cores Cortex-A72, 1.8 GHz base frequency, up to 2.0 GHz <br/> Four small cores Cortex-A53, 1.4 GHz base frequency, up to 1.6 GHz
    </TabItem>

    <TabItem value="ROCK 4A+/4B+">
        Rockchip OP1 SoC with 6 CPU cores <br/> Two Cortex A72 cores, 2.0 GHz base frequency, up to 2.4 GHz <br/> Four Cortex A53 cores, 1.6 GHz base frequency
    </TabItem>

    <TabItem value="ROCK 4SE">
        Rockchip RK3399-T SoC with 6 CPU cores <br/> Two big cores Cortex A72, 1.5 GHz base frequency, up to 1.8 GHz <br/> Four Cortex®-A53 cores, 1.0 GHz base frequency
    </TabItem>

</Tabs>

## Overclocking

Overclocking is the process of increasing hardware clock rates to improve performance, but it requires attention to heat dissipation, stability, and hardware lifespan.

:::warning

Overclocking carries risks and should be performed with caution. The following example uses ROCK 4SE

:::

- Check current frequency

```bash
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
408000
408000
408000
408000
408000
408000
```

- Enable overclocking overlay using rsetup

- Check the frequency after overclocking

```bash

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
1512000
1512000
1512000
1512000
1800000
1800000

```

- Verify stability

  - Open a terminal and run a stress test

  ```bash
  stress -c 6 -t 600
  ```

  - Open another terminal to monitor the current frequency

  ```bash
  watch -n 1 "cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq"
  ```

  If the frequency during stress testing remains consistent with the overclocked frequency and stays stable, it indicates successful overclocking. If the frequency during testing is lower than the overclocked frequency, it indicates overclocking failure.

## Frequency Locking

Frequency locking fixes the hardware frequency at a specific value to avoid dynamic adjustments, providing stable performance.

:::tip

This example uses ROCK 4SE

:::

- Check available CPU frequencies

```bash
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
408000 600000 816000 1008000 1512000
```

- Check current frequency

```bash
cat /sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq
408000
```

- Set CPU frequency

```bash
# Set small core frequency, e.g., 1.2GHz
echo userspace > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo 1200000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed

# Set big core frequency, e.g., 1.8GHz
echo userspace > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
echo 1800000 > /sys/devices/system/cpu/cpufreq/policy4/scaling_setspeed
```

- Check if the frequency is set successfully

```bash
cat /sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq
1200000
```

## Setting CPU to Performance Mode

Setting the CPU to performance mode is another way to improve CPU performance.

- Set performance mode

```bash
echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo performance > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
```

- Check if the performance mode is set successfully

```bash
cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
performance
```
