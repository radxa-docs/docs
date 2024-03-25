---
sidebar_position: 40
---

# Fan Setting

## Installation

Heatsink 4012 is a customized cooling fan for ROCK 5B, the installation tutorial is shown in the picture:

- Apply the thermal silicone to the heat sink;

![Heatsink 4012](/img/rock5b/heatsink4012-use-1.webp)

- Apply thermal silicone to the chip;

![Heatsink 4012](/img/rock5b/heatsink4012-use-2.webp)

- Align the snap with the exposed copper area of the ROCK 5B and press it down;
- Connecting the power cord is complete.

![Heatsink 4012](/img/rock5b/heatsink4012-use-3.webp)

## Configure

There are three modes by default:

- **power_allocator**: The system defaults to fanless mode or DC fan mode. Ensure that the machine can still work stably without a cooling fan;
- **user_space**: Manual control of the cooling fan mode. Users can control the speed of the cooling fan through the command terminal according to their needs;
- **step_wise**: Automatic Temperature Adjustment Mode: The cooling fan is dormant when the CPU is below 60 degrees Celsius, and starts to work when the CPU reaches above 60 degrees Celsius.
  **NOTE: The cooling fan will not operate when the ROCK 5B is in the power off and sleep states.**

You can select the mode from the command terminal `rsetup` -> `Hardware` -> `Thermal governor` by using the `space bar` as follows:

Simultaneously press `Ctrl + Alt + T` to open the terminal and run the `rsetup` command as follows:

```bash
radxa@rock-5b:~$ rsetup
```

Enter the password and select `Hardware` to access the hardware console interface:

```bash
Please select an option below:
        System Maintenance
        Hardware
        Overlays
        Connectivity
        User Settings
        Localization
        About
        <Ok>            <Cancel>
```

Press and enter `Thermal governor`

```bash
Manage on-board hardware:
        Video capture devices
        GPIO LEDs
        Thermal governor
        Configure DSI display mirroring
        <Ok>            <Cancel>
```

Selection of modes with the `spacebar'

```bash
┌─────────────────────────────────────────┤ RSETUP ├───────────────────────────────────────────────┐
│ Please select the thermal governor.                                                              │
│ Recommendation: fanless or DC fan => power_allocator | PWM fan => step_wise                      │
│                                                                                                  │
│    (*) power_allocator                                                                           │
│    ( ) user_space                                                                                │
│    ( ) step_wise                                                                                 │
│    ( ) fair_share                                                                                │
│                                                                                                  │
│                                                                                                  │
│                                                                                                  │
│                                                                                                  │
│                                                                                                  │
│                                                                                                  │
│                                                                                                  │
│                                                                                                  │
│                                                                                                  │
│                                                                                                  │
│                                 <ok>                        <Cancel>                             │
└──────────────────────────────────────────────────────────────────────────────────────────────────│
```

If you are in `user_space` mode, you need to control the cooling fan manually.

First, you need to find the fan device node `pwm-fan`.

```bash
cat /sys/class/thermal/cooling_device*/type
```

As an example, this cooling fan is mounted on `cooling_device1`, which you will see by `cat /sys/class/thermal/cooling_device1/type` to `pwm-fan`:

```bash
radxa@rock-5b: cat /sys/class/thermal/cooling_device1/type
pwm-fan
```

**Note: The following operation is based on `cooling_device1` as an example**.

Directly turn on the cooling fan maximum speed: ``

```
radxa@rock-5b:~$ sudo cp /sys/class/thermal/cooling_device1/max_state /sys/class/thermal/cooling_device1/cur_state
```

You can see how many RPMs the cooling fan supports with the following command:

```
radxa@rock-5b:~$ cat /sys/class/thermal/cooling_device1/max_state
4
```

To select the third speed, follow these instructions:

```
echo 3 | sudo tee /sys/class/thermal/cooling_device1/cur_state
```

If you want to use other speed gears, just change the numbers. If you want to turn off the cooling fan, select 0 for the speed slot.

```
echo 0 | sudo tee /sys/class/thermal/cooling_device1/cur_state
```
