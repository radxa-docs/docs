---
sidebar_position: 23
---

# 如何在 ROCK 3B 上设置 Radxa Display 10 FHD

## 安装教程

Radxa Display 10 FHD 提供的 fpc，fpc 一边是用于接屏幕，另一边是用于接 ROCK 3B。

如图将 FPC 连接到 10FHD 屏，用手指向上拉起 fpc 接头黑色模块，将 fpc 排线插入卡槽，然后按下黑色模块固定 fpc 排线。

![Radxa Display 10 FHD](/img/accessories/10fhd-connect-fpc.webp)

如图所示，将 FPC 连接到 ROCK 3B。 ROCK 3B 提供了一个 MIPI DSI 接口。 将 MIPI DSI 接口的黑色模块拉起，将 fpc 插入连接器，将黑色模块拉下固定 fpc 。

![Radxa Display 10 FHD](/img/accessories/rock3b-connect-fpc.webp)

## 配置

同时按“Ctrl + Alt + T”打开终端，运行“rsetup”命令如下：

```bash
radxa@rock-3b:~$ rsetup
```

输入密码进入 rsetup 工具界面，并选择 `Overlays`：

```bash
Please select an option below:
        System Maintenance
        Hardware
        Overlays
        User Settings
        Localization
        About
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
        [ ] Enable 1-Wire on GPIO3_A5
        [ ] Enable CAN0-M0
        [ ] Enable CAN1-M0
        [ ] Enable CAN1-M1
        [ ] Enable FIQ Debugger on UART0
        [ ] Enable FIQ Debugger on UART3-M0
        [ ] Enable FIQ Debugger on UART5-M1
        [ ] Enable FIQ Debugger on UART7-M1
        [ ] Enable FIQ Debugger on UART9-M1
        [ ] Enable HDMI CEC
        [ ] Enable I2C1
        [ ] Enable I2C2-M0
        [ ] Enable I2C3-M0
        [ ] Enable NPU
        [ ] Enable NXP PCA9555 I2C GPIO multiplexer on I2C2-M0
        [ ] Enable OKdo 5MP Camera
        [ ] Enable PWM1-M0
        [ ] Enable PWM1-M1
        [ ] Enable PWM12-M1
        [ ] Enable PWM13-M1
        [ ] Enable PWM14-M0
        [ ] Enable PWM14-M1
        [ ] Enable PWM15-M0
        [ ] Enable PWM15-M1
        [ ] Enable PWM2-M0
        [ ] Enable PWM2-M1
        [ ] Enable PWM9-M0
        [ ] Enable Radxa 25W PoE HAT
        [ ] Enable Radxa 5-inch Touchscreen
        [ ] Enable Radxa Display 10FHD
        [ ] Enable Radxa Display 10HD
        [ ] Enable Radxa Display 8HD
        [ ] Enable Raspberry Pi 7-inch Touchscreen
        [ ] Enable Raspberry Pi Camera v1.3
        [ ] Enable Raspberry Pi Camera v2
        [ ] Enable Sharp LQ133T1JW01 Display
        [ ] Enable UART0
        [ ] Enable UART2-M0
        [ ] Enable UART3-M0
        [ ] Enable UART5-M1
        [ ] Enable UART7-M1
        [ ] Enable UART9-M1
        [ ] Enable spidev on SPI3-M1 over CS0
        [ ] Enable spidev on SPI3-M1 over CS1
        [ ] Set OTG port to Host mode
        [ ] Set OTG port to Peripheral mode
        [ ] Set OTG port to be controlled by hardware switch
        <Ok>                   <Cancel>
```

按下空格键使能 10FHD 屏幕`Enable Radxa Display 10FHD`

```bash
[*] Enable Radxa Display 10FHD
```

最后，重新启动就可以使用。

```bash
radxa@rock-3b:~$ sudo reboot
```
