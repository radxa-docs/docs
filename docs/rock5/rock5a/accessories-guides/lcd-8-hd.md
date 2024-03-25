---
sidebar_position: 20
---

# 如何在 ROCK 5A 上设置 Radxa Display 8 HD

## 安装教程

Radxa Display 8 HD提供的fpc，fpc一边是用于接屏幕，另一边是用于接ROCK 5A。

如图将FPC连接到8HD屏，用手指向上拉起fpc接头黑色模块，将fpc排线插入卡槽，然后按下黑色模块固定fpc排线。

![Radxa Display 8 HD](/img/accessories/8hd-connect-fpc.webp)

如图所示，将 FPC 连接到 ROCK 5A。 ROCK 5A 提供了一个 MIPI DSI 接口。 将MIPI DSI接口的黑色模块拉起，将fpc插入连接器，将黑色模块拉下固定fpc。

![Radxa Display 8 HD](/img/accessories/rock5a-connect-fpc.webp)

## 配置

同时按“Ctrl + Alt + T”打开终端，运行“rsetup”命令如下：

```bash
radxa@rock-5a:~$ rsetup
```

输入密码并选择 `Overlays` 进入 rsetup 工具界面。

```bash
Configure Device Tree Overlay
        Manage overlays
        View overlay info
        Install overlay from source
        Reset overlays
        <Ok>             <Cancel>
```

然后, 选择 `Manage overlays`:

```bash
Configure Device Tree Overlay
        Manage overlays
        View overlay info
        Install overlay from source
        Reset overlays


      <Ok>            <Cancel>
```

接着，进入设备的管理界面，不同的产品可能会有所不同。

```bash
Please select overlays:
        [ ] Enable 1-Wire on GPIO4_B1
        [ ] Enable FIQ Debugger on UART4-M2
        [ ] Enable FIQ Debugger on UART6-M1
        [ ] Enable FIQ Debugger on UART7-M2
        [ ] Enable FIQ Debugger on UART8-M0
        [ ] Enable I2C1-M0
        [ ] Enable I2C2-M4
        [ ] Enable I2C4-M3
        [ ] Enable I2C6-M0
        [ ] Enable I2C6-M3
        [ ] Enable I2C7-M3
        [ ] Enable PWM0-M2
        [ ] Enable PWM1-M2
        [ ] Enable PWM11-M1
        [ ] Enable PWM14-M1
        [ ] Enable PWM14-M2
        [ ] Enable PWM15-M1
        [ ] Enable PWM15-M3
        [ ] Enable PWM6-M0
        [ ] Enable PWM7-M0
        [ ] Enable Radxa Camera 4K
        [ ] Enable Radxa Display 10HD
        [ ] Enable Radxa Display 8HD
        [ ] Enable Raspberry Pi Camera V2
        [ ] Enable UART2-M0
        [ ] Enable UART2-M2
        [ ] Enable UART3-M1
        [ ] Enable UART4-M2
        [ ] Enable UART6-M1
        [ ] Enable UART7-M1
        [ ] Enable UART7-M1 with Hardware Flow Control
        [ ] Enable UART7-M2
        [ ] Enable UART8-M0
        [ ] Enable spidev on SPI0-M1 over CS0
        [ ] Enable spidev on SPI0-M2 over CS0
        [ ] Enable spidev on SPI4-M2 over CS0
        [ ] Set OTG port to Host modeq
        [ ] Set OTG port to Peripheral mode
        <Ok>                   <Cancel>
```

按下空格键使能8HD屏幕`Enable Radxa Display 8HD`

```bash
[*] Enable Radxa Display 8 HD
```

最后，重新启动就可以使用。

```bash
radxa@rock-5a:~$ sudo reboot
```
