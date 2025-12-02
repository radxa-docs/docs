---
sidebar_position: 8
---

# FAN

:::tip
The FAN interface on the Raspberry Pi Compute Module 4 IO Board only supports fans with a voltage of 12V.
:::

![FAN-1](/img/cm3j/fan-1.webp)

## Usage Instructions

### Connect

As shown in the figure, connect the fan to the Raspberry Pi Compute Module 4 IO Board.

![FAN-2](/img/cm3j/fan-2.webp)

### Rsetup select Thermal Governor mode

- Open a terminal, type rsetup, select Hardware.

  <img
  src="/img/common/rsetup/rsetup-hardware.webp"
  alt="rsetup hardware"
  style={{ width: "60%" }}
  />

- Enter to Thermal governor

  <img
  src="/en/img/common/radxa-os/system-config/rsetup-hardware-thermal.webp"
  alt="rsetup hardware"
  style={{ width: "60%" }}
  />

- The default governor should be power_allocator.

  <img
  src="/en/img/common/radxa-os/system-config/rsetup-select-thermal-governor.webp"
  alt="rsetup hardware"
  style={{ width: "60%" }}
  />

- power_allocator

  The system defaults to fanless mode or DC fan mode. Ensure that the machine can still work stably without a cooling fan

- user_space

  - Select user_space

  - Locate the fan device with the following command.

    <pre>
        ls /sys/class/thermal/cooling_device*/type <br />
        cat /sys/class/thermal/cooling_device*/type
    </pre>

- Turn off the fan

  <pre style={{ whiteSpace: "nowrap" }}>
    <!-- prettier-ignore -->
    echo 0 | sudo tee /sys/class/thermal/cooling_device1/cur_state  
  </pre>

- Set the fan to the highest setting.

  <pre style={{ whiteSpace: "nowrap" }}>
    <!-- prettier-ignore -->
    sudo cp /sys/class/thermal/cooling_device1/max_state /sys/class/thermal/cooling_device1/cur_state  
  </pre>

- step_wise

  When the CPU temperature reaches 60 degrees Celsius the fan starts to rotate.

- Refer to

  - For more information, please refer to the "thermal governor" section in [rsetup](../../../os-config/rsetup.md).
