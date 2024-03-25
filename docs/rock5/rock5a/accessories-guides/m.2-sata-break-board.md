---
sidebar_position: 20
---

# ROCK 5A使用M.2 SATA breakout board教程

使用M2.E转SATA转接板时，需要准备一根SATA数据线用于连接SATA硬盘，一根SATA电源线用于供电。

如图，将SATA转接板的M.2 E key连接到RKCK 5A的M2.E口，然后用SATA数据线连接ROCK 5A和SATA SSD。  
Radxa SBC 的红色 GPIO 可用于 SATA 的 5V 供电，黑色 GPIO 通常用于 GND，可用于SATA硬盘的供电。

![Use M2.E SATA Breakout Board on ROCK 5A](/img/accessories/m2e-to-sata.webp)

安装后，您需要通过设置启用 SATA。
同时按“Ctrl + Alt + T”打开终端，运行“rsetup”命令如下：

```bash
radxa@rock-5a:~$ rsetup
```

输入密码并选择“Overlays”以配置设备树。

```bash
Configure Device Tree Overlay
        Manage overlays
        View overlay info
        Install overlay from source
        Reset overlays
        <Ok>             <Cancel>
```

然后，选择 `Manage overlays`:

```bash
Configure Device Tree Overlay
        Manage overlays
        View overlay info
        Install overlay from source
        Reset overlays


      <Ok>            <Cancel>
```

接下来会显示已安装的设备树，不同的产品可能会有所不同。

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
        [ ] Enable SATA0
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

按空格选中 `Enable SATA0`

```bash
[*] Enable SATA0
```

设备带有`*`表示它已启用，重新开机就可以使用了。

## 查看SATA是否挂载成功

你可以通过`lsblk`命令查看SSD是否被识别到。

```bash
radxa@rock-5a:~$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda            8:0    0 476.9G  0 disk
mmcblk0      179:0    0  14.5G  0 disk
├─mmcblk0p1  179:1    0    16M  0 part /config
└─mmcblk0p2  179:2    0  14.4G  0 part /
mmcblk0boot0 179:32   0     4M  1 disk
mmcblk0boot1 179:64   0     4M  1 disk
zram0        254:0    0   3.9G  0 disk [SWAP]
```

当系统识别到SATA时，你可以查看到**sda**。
