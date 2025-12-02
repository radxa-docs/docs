---
sidebar_position: 6
---

# MIPI DSI 接口

## 支持列表

<table>
  <tr>
    <th>Screen Name</th>
  </tr>
  <tr>
    <td>Raspberry Pi 7-inch Touchscreen</td>
  </tr>
</table>

## 使用介绍

树莓派 Compute Module 4 IO Board 有两个 DSI 接口：DSIP0 和 DSIP1

:::tip
使用 CAM0 或者 DISP0 时需要短接底板如下图所示的位置
:::

![JUMP](/img/cm3j/jump.webp)

### Raspberry Pi 7-inch Touchscreen

- 连接

  - 通过 FPC 线接上树莓派 Compute Module 4 IO Board ，如图所示：
  - 将 Raspberry Pi 7-inch Touchscreen 上的 5V 和 GND 脚需要接到树莓派 Compute Module 4 IO Board 40PIN 上对应的 5V 和 GND 上。
    ![7-INCH-1](/img/cm3j/7-inch-1.webp)
    ![7-INCH-2](/img/cm3j/7-inch-2.webp)

- 通过 rsetup 打开对应的 overlay

  - 使用 Ctrl + T 组合键打开终端, 运行 rsetup 命令：

    ```
    radxa@radxa-cm3j-rpi-cm4-io:~$ rsetup
    ```

  - 通过 [overlays](../../../os-config/rsetup#overlays) 设备树配置来启用 Raspberry Pi 7-inch Touchscreen 的 Overlay。

    :::tip
    请启用 [] Enable Raspberry Pi 7-inch Touchscreen on disp0/dsip1 项 Overlay。<br/>
    在启用成功显示 [*] Enable Raspberry Pi 7-inch Touchscreen on disp0/dsip1 后退出重启才能使配置生效。
    :::

### 测试

重启后，能够显示系统画面，且支持触摸。
