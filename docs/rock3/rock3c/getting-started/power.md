---
sidebar_position: 18
---

# 电源管理

## 使用硬件电源键

连接电源后，ROCK 3C 的电源绿色指示灯将常亮。

按下电源键启动开机，状态蓝灯会闪烁。当 ROCK 3C 关机或处于睡眠状态时，蓝色状态指示灯将熄灭。

![ROCK 3C Power](/img/rock3/3c/rock3c-power.webp)

当 ROCK 3C 启动之后，再次按下电源键将弹出电源管理对话框：

![ROCK 3C Power](/img/rock5a/rock5a-power-status.webp)

## 使用软件控制

### 通过图形界面控制

打开 Application Launcher。选择 `Leave` 选项来显示电源管理对话框：

![ROCK 3C GUI](/img/rock5a/rock5a-GUI-leave.webp)

### 通过命令控制

你可以在终端执行以下指令来控制电源状态：

- 重启：`systemctl reboot`
- 关机：`systemctl poweroff`
- 待机：`systemctl suspend`
