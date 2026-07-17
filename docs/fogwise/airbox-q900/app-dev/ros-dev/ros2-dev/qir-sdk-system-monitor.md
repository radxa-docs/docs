---
sidebar_position: 5
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# 系统资源监控

通过 ROS 2 节点监控系统资源使用情况，包含 CPU、内存、温度、磁盘、交换空间和电池等监控器。

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)

## 运行

在 **两个独立终端** 中分别执行：

**终端 1** — 启动系统监控节点：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 run qrb_ros_system_monitor qrb_ros_system_monitor
```

</NewCodeBlock>

**终端 2** — 查看监控话题：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 topic list
# 选择感兴趣的话题查看，例如 CPU 使用率
ros2 topic echo /cpu
```

</NewCodeBlock>

## 预期输出

终端 1 输出：

```text
[INFO] [cpu_monitor]: CPU Monitor start
[INFO] [memory_monitor]: Memory Monitor start
[INFO] [temperature_monitor]: Temperature Monitor start
[INFO] [disk_monitor]: DISK Monitor start
[INFO] [swap_monitor]: Swap Monitor start
[INFO] [battery_monitor]: Battery Monitor start
```

终端 2 的 `ros2 topic echo /cpu` 输出实时 CPU 负载数据。

## 停止

各终端按 `Ctrl + C` 停止。
