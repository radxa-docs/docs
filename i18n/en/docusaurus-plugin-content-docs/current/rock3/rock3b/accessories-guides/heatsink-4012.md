---
sidebar_position: 55
---

# Heatsink 4012 Usage

## List of Accessories

- Heatsink 4012
- Thermal Conductive Silicone Gel
- Thermal Conductive Silicone Grease

## Installation Procedure

- Heatsink 4012 is a heatsink fan that can be used with the ROCK 3B. The installation instruction is shown below:

- Apply thermal silicone adhesive to the Heatsink 4012, exposing the SoC position for the application of thermal silicone grease.

![Heatsink 4012](/img/rock5b/heatsink4012-use-1.webp)

- Apply thermal silicone adhesive to the SoC chip.

![Heatsink 4012](/img/rock5b/heatsink4012-use-2.webp)

- Align the buckle with the mounting holes on the ROCK 3B and press it down.
- Connect the power cable to the fan socket.

![Heatsink 4012](/img/rock3/3b/rock_3b_with_heatsink.webp)

## Configuration

The operating system has three modes by default：

- **power_allocator**: The system is in the fanless mode or DC fan mode by default. Make sure that the machine can still work stably without a cooling fan;
- **user_space**: Mode of manual control of the fan, User can control the speed of the cooling fan through the command terminal according to your needs;
- **step_wise**: Mode of Automatic temperature adjustment. When the temperature of the CPU is below 60°C, the cooling fan is in a dormant state; And when the temperature of the CPU reaches above 60°C, the cooling fan starts to work.
  **Note: When ROCK 3B is in shutdown or sleep state, the cooling fan does not work.**

You can use the command terminal by "`retsup->Hardware`->`Thermal governor`", then use the `space bar` to select the mode, the specific operation is as follows:

Press "Ctrl + Alt + T" simultaneously to open a terminal, run `rsetup` command as below:

```
radxa@rock-3b:~$ rsetup
```

Typing the password and select `Hardware` to rsetup tool interface.  
Select `Hardware`:

```
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

Then, select `Thermal governor`.

```
Manage on-board hardware:
        Video capture devices
        GPIO LEDs
        Thermal governor
        Configure DSI display mirroring
        <Ok>            <Cancel>
```

Select mode with `spacebar`

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

If you choose `user_space` mode, you need to manually control the control the fan manually.

Find the node of the fan device `pwm-fan`:

```
cat /sys/class/thermal/cooling_device*/type
```

For example, the node of the pwm fan is `cooling_device1`:

```
radxa@rock-3b: cat /sys/class/thermal/cooling_device1/type
pwm-fan
```

**Note: The following operations take `cooling_device1` as an example.**

Set the maximum speed directly:

```
radxa@rock-3b:~$ sudo cp /sys/class/thermal/cooling_device1/max_state /sys/class/thermal/cooling_device1/cur_state
```

You can check how many speed levels the fan supports by the following command:

```
radxa@rock-3b:~$ cat /sys/class/thermal/cooling_device1/max_state
4
```

If you want to select level 3, follow the instruction below:

```
echo 3 | sudo tee /sys/class/thermal/cooling_device1/cur_state
```

If you want to use another speed gear, you just need to change the number. If you want to turn off the cooling fan, just select 0 for the speed gear.

```
echo 0 | sudo tee /sys/class/thermal/cooling_device1/cur_state
```
