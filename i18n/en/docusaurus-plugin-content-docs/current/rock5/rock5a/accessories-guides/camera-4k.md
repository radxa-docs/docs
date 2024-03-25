---
sidebar_position: 20
---

# How to setup Radxa Camera 4K on ROCK 5A

## How to connect fpc to camera and rock 5A

As shown in the picture, the black side of the FPC is insulated, and the other side is pins for connecting the circuit.

![ROCK5A Install Radxa Camera 4K](/img/accessories/fpc.webp)

Gently push the black structure up with your fingers, and then insert the fpc into the connector of the camera. Please refer to the picture for how to install. Then press down the black structure to fix the fpc on the camera module.

![ROCK5A Install Radxa Camera 4K](/img/accessories/camera_4k_pfc.webp)

FPC is connected in the same way on ROCK 5A, as shown in the figure.

![ROCK5A Install Radxa Camera 4K](/img/accessories/rock5a_camera4k_fpc.webp)

## Configure the Radxa Camera 4K

Press "Ctrl + Alt + T" simultaneously to open a terminal, run `rsetup` command as below:

```
radxa@rock-5a:~$ rsetup
```

Typing the password and select `Overlays` to rsetup tool interface.

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
Press the space bar to `Radxa Camera 4K`

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

Select the device you want to load with the space bar,

```
[*] Enable Radxa Camera 4K
```

Overlay with a `*` indicates that it is enabled. It would work after reboot.

```
radxa@rock-5a:~$ sudo reboot
```

## Using the Radxa Camera 4K

You can download **cheese** to use the camera with the following command:

```
radxa@rock-5a: sudo apt update
radxa@rock-5a: sudo apt install cheese
radxa@rock-5a: ./cheese
```

At the same time, you can also use the terminal command to open the camera preview:

```
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! xvimagesink;
```

Take a picture using the following command:

```
gst-launch-1.0 v4l2src device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! jpegenc ! multifilesink location=file.name.jpg;
```

Take a video using the following command:

```
gst-launch-1.0 v4l2src num-buffers=512 device=/dev/video11 io-mode=4 ! videoconvert ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! tee name=t ! queue ! mpph264enc ! queue ! h264parse ! mpegtsmux ! filesink location=/home/radxa/file.name.mp4
```
