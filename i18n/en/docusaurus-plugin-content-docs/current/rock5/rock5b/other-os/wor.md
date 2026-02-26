---
sidebar_position: 10
description: "Takes you through the installation of Windows On Arm on the ROCK 5 series"
---

# Windows on R

For ROCK 5B, because of the [UFEI of rk35xx](https://github.com/edk2-porting/edk2-rk35xx) and the efforts of [Windows On R team](https://worproject.com/),
the adaptation has completed, and the full guidance is already available:  
[\[Guide\] How to install on Rockchip device](https://worproject.com/guides/how-to-install/on-rockchip) (Recommended).  
[\[Guide\] How to install Windows 11 on ROCK 5B](https://forum.radxa.com/t/guide-how-to-install-windows-11-on-rock-5b/15524) (Reference).

Windows is not yet perfectly adapted to the ROCK 5A now,
but you can also try it follow this guide: [How to install on Rockchip device](https://worproject.com/guides/how-to-install/on-rockchip).  
**Note: ROCK 5A is not explicitly supported on the guide above yet, please refer to other similar products.**

## Points of Attention

ROCK 5A is based on Rockchip RK3588S SoC, so you should choose [the UEFI](https://github.com/edk2-porting/edk2-rk35xx/releases) for RK3588S,
rather than ROCK 5B which based on Rockchip RK3588 SoC.

There are some differences from the installation of ROCK 5B:  
only the HDMI port away from the USB-C port would work, it's also called HDMI_8K port;  
only the top USB 3.0 Type-A port would work, any other port on the board has not support, so you need a USB Full-featured hub for ethernet input devices and others.

An error may occur during the installation process like following, ignore it and wait for it to restart:

```text
Your device ran into a problem and needs to restart.
We'll restart for you.

(other)
```

## Support

If you meet some other issues or want more information,
join the [Windows on R discord](https://discord.gg/tjwm9PwZWW) and get help for the developers.
