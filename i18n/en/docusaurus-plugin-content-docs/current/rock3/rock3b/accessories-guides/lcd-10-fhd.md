---
sidebar_position: 23
---

# How to setup Radxa Display 10 FHD on ROCK 3B

## Installation Guide

The fpc provided by Radxa Display 10 FHD, one port of fpc is connected to the screen, and the other is connected to ROCK 3B.

Connect the FPC to the 10FHD screen as shown in the figure, use your fingers to pull up the black module of the fpc connector, insert the fpc cable into the card slot, and then pull down the black module to fix the fpc cable.

![Radxa Display 10 FHD](/img/accessories/10fhd-connect-fpc.webp)

Connect the FPC to ROCK 3B as shown in the figure. ROCK 3B provides a MIPI DSI interface. Pull up the black module of the MIPI DSI interface, insert the fpc into the connector and pull down the black module to fix the fpc.

![Radxa Display 10 FHD](/img/accessories/rock3b-connect-fpc.webp)

## Configuration

Press "Ctrl + Alt + T" simultaneously to open a terminal, run `rsetup` command as below:

```
radxa@rock-3b:~$ rsetup
```

Typing the password and select `Overlays` to rsetup tool interface.  
Select `Overlays`:

```
Please select an option below:
        System Maintenance
        Hardware
        Overlays
        User Settings
        Localization
        About
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

Select the overlays you want to load with the space bar,

```
[*] Enable Radxa Display 10 FHD
```

Overlay with a `*` indicates that it is enabled. It would work after reboot.

```
radxa@rock-3b:~$ sudo reboot
```
