---
sidebar_position: 8
---

# FAN 接口

:::tip
树莓派 Compute Module 4 IO Board 上的 FAN 接口只支持 12V 电压的风扇。
:::

![FAN-1](/img/cm3j/fan-1.webp)

## 使用介绍

### 连接

如图所示，将风扇连接到树莓派 Compute Module 4 IO Board 上

![FAN-2](/img/cm3j/fan-2.webp)

### rsetup 选择 Thermal Governor 模式

- 打开终端，输入 rsetup, 选择 Hardware

  <img
  src="/img/common/rsetup/rsetup-hardware.webp"
  alt="rsetup hardware"
  style={{ width: "60%" }}
  />

- 进入 Thermal governor

  <img
  src="/img/common/radxa-os/system-config/rsetup-hardware-thermal.webp"
  alt="rsetup hardware"
  style={{ width: "60%" }}
  />

- 默认的 governor 应该是 power_allocator

  <img
  src="/img/common/radxa-os/system-config/rsetup-select-thermal-governor.webp"
  alt="rsetup hardware"
  style={{ width: "60%" }}
  />

- power_allocator

  系统默认是无风扇模式或 DC 风扇模式，确保机器在没有散热风扇的前提下依旧能稳定工作

- user_space

  - 选择 user_space

  - 通过以下命令找到风扇设备

    <pre>
        ls /sys/class/thermal/cooling_device*/type <br />
        cat /sys/class/thermal/cooling_device*/type
    </pre>

- 关闭风扇

  <pre style={{ whiteSpace: "nowrap" }}>
    <!-- prettier-ignore -->
    echo 0 | sudo tee /sys/class/thermal/cooling_device1/cur_state  
  </pre>

- 将风扇调至最高档

  <pre style={{ whiteSpace: "nowrap" }}>
    <!-- prettier-ignore -->
    sudo cp /sys/class/thermal/cooling_device1/max_state /sys/class/thermal/cooling_device1/cur_state  
  </pre>

- step_wise

  当CPU温度达到60摄氏度风扇开始转

- 参考

  - 更多请参考 [rsetup](../../../os-config/rsetup.md) thermal-governor 部分
