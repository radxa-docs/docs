---
sidebar_position: 5
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# System Resource Monitor

Monitors system resources via ROS 2 nodes, including CPU, memory, temperature, disk, swap space, and battery monitors.

## Prerequisites

- [QIR SDK installed](qir-sdk.md)

## Run

Execute in **two separate terminals**:

**Terminal 1** — Start the system monitor node:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 run qrb_ros_system_monitor qrb_ros_system_monitor
```

</NewCodeBlock>

**Terminal 2** — View monitor topics:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 topic list
# Echo a topic of interest, e.g. CPU usage
ros2 topic echo /cpu
```

</NewCodeBlock>

## Expected Output

Terminal 1:

```text
[INFO] [cpu_monitor]: CPU Monitor start
[INFO] [memory_monitor]: Memory Monitor start
[INFO] [temperature_monitor]: Temperature Monitor start
[INFO] [disk_monitor]: DISK Monitor start
[INFO] [swap_monitor]: Swap Monitor start
[INFO] [battery_monitor]: Battery Monitor start
```

Terminal 2 `ros2 topic echo /cpu` outputs real-time CPU load data.

## Stop

Press `Ctrl + C` in each terminal to stop.
