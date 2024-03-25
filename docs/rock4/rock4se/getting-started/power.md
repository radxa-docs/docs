---
sidebar_position: 18
---

# 电源管理

连接电源后，ROCK 4SE 将自动启动开机，此时电源指示灯将保持常亮。系统启动之后，状态指示蓝灯将持续闪烁。当 ROCK 4SE 处于睡眠状态时，系统的状态指示灯将熄灭。

![ROCK 4SE Power](/img/rock4/4se/rock4se-power.webp)

## 使用软件控制

### 通过图形界面控制

打开 Application Launcher。选择 `Leave` 选项来显示电源管理对话框：

![ROCK 4SE GUI](/img/rock5a/rock5a-GUI-leave.webp)

### 通过命令控制

你可以在终端执行以下指令来控制电源状态：

- 重启：`systemctl reboot`
- 关机：`systemctl poweroff`
- 待机：`systemctl suspend`
