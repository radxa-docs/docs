---
sidebar_position: 20
---

# How to setup Radxa Display 8 HD on ROCK 5A

## Installation Guide

The fpc provided by Radxa Display 8 HD, one port of fpc is connected to the screen, and the other is connected to ROCK 5A.

Connect the FPC to the 8HD screen as shown in the figure, use your fingers to pull up the black module of the fpc connector, insert the fpc cable into the card slot, and then pull down the black module to fix the fpc cable.

![Radxa Display 8 HD](/img/accessories/8hd-connect-fpc.webp)

Connect the FPC to ROCK 5A as shown in the figure. ROCK 5A provides a MIPI DSI interface. Pull up the black module of the MIPI DSI interface, insert the fpc into the connector and pull down the black module to fix the fpc.

![Radxa Display 8 HD](/img/accessories/rock5a-connect-fpc.webp)

## Configuration

Press "Ctrl + Alt + T" simultaneously to open a terminal, run `rsetup` command as below:

```
radxa@rock-5a:~$ rsetup
```

Typing the password and select `Overlays` to rsetup tool interface.  
Select `Overlays`:

```
Configure Device Tree Overlay
        Manage overlays
        View overlay info
        Install overlay from source
        Reset overlays
        <Ok>             <Cancel>
```

Then, select `Manage overlays`:

```
Configure Device Tree Overlay
        Manage overlays
        View overlay info
        Install overlay from source
        Reset overlays


      <Ok>            <Cancel>
```

Next, the installed device tree would shown, it may be different on different product.  
Press the space bar to `Enable Radxa Display 8HD`

```
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

Select the overlays you want to load with the space bar,

```
[*] Enable Radxa Display 8 HD
```

Overlay with a `*` indicates that it is enabled. It would work after reboot.

```
radxa@rock-5a:~$ sudo reboot
```
