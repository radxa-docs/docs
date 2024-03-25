---
sidebar_position: 20
---

# Using Radxa Heatsink 2513 on ROCK 5A

## Install on ROCK 5A

Stick the cooling silicone on the cooling fan, and then stick it on the chip.

![Use Heatsink on ROCK 5A](/img/rock5a/heatsink-1.webp)

Connect the power cable of the cooling fan to the fan power supply port of ROCK 5A, as shown in the figure:

![Use Heatsink on ROCK 5A](/img/rock5a/heatsink-2.webp)

Stick the heat dissipation silicone on the heat dissipation fan, and then stick it on the chip. Connect the power cable of the cooling fan to the fan power supply port of ROCK 5A, as shown in the figure:

## Configuration

The operating system has three modes by default：

- **power_allocator**: The system defaults to fanless mode or DC fan mode. Make sure that the machine can still work stably without a cooling fan;
- **user_space**: Manually control cooling fan mode. Users can control the speed of the cooling fan through the command terminal according to your needs;
- **step_wise**: automatic temperature adjustment mode. When the temperature of the CPU is below 60°C, the cooling fan is in a dormant state; And when the temperature of the CPU reaches above 60°C, the cooling fan starts to work.
  **Note: When ROCK 5A is in shutdown or sleep state, the cooling fan does not work.**

You can use the command terminal by "`retsup->Hardware`->`Thermal governor`", then use the `space bar` to select the mode, the specific operation is as follows:

Press "Ctrl + Alt + T" simultaneously to open a terminal, run `rsetup` command as below:

```
radxa@rock-5a:~$ rsetup
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

If you choose `user_space` mode, you need to manually control the cooling fan.

Find the node of the fan device `pwm-fan`:

```
cat /sys/class/thermal/cooling_device*/type
```

For example, the node of the pwm fan is `cooling_device1`:

```
radxa@rock-5a: cat /sys/class/thermal/cooling_device1/type
pwm-fan
```

**Note: The following operations take `cooling_device1` as an example.**

Directly open the highest speed:

```
radxa@rock-5a:~$ sudo cp /sys/class/thermal/cooling_device1/max_state /sys/class/thermal/cooling_device1/cur_state
```

You can check how many speeds the cooling fan supports through the following:

```
radxa@rock-5a:~$ cat /sys/class/thermal/cooling_device1/max_state
4
```

If you want to select the third speed, follow the instructions below:

```
echo 3 | sudo tee /sys/class/thermal/cooling_device1/cur_state
```

If you want to use another speed gear, you just need to change the number. If you want to turn off the cooling fan, just select 0 for the speed gear.

```
echo 0 | sudo tee /sys/class/thermal/cooling_device1/cur_state
```
