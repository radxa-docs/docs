---
sidebar_position: 10
description: "带您在 ROCK 5 系列上安装 Windows On Arm"
---

# Windows on R

对于 ROCK 5B，由于[rk35xx 的 UFEI](https://github.com/edk2-porting/edk2-rk35xx)和[Windows on R 团队](https://worproject.com/)的努力、
改编工作已经完成，完整的指南也已发布：  
[\[Guide\] How to install on Rockchip device](https://worproject.com/guides/how-to-install/on-rockchip)（推荐）。
[\[Guide\] How to install Windows 11 on ROCK 5B](https://forum.radxa.com/t/guide-how-to-install-windows-11-on-rock-5b/15524) (Reference).

Windows 现在还不能完全适应 ROCK 5A、
但你也可以按照本指南进行尝试： [如何在 Rockchip 设备上安装](https://worproject.com/guides/how-to-install/on-rockchip)。
\*\*注：上述指南尚未明确支持 ROCK 5A，请参考其他同类产品。

## 注意事项

ROCK 5A 基于 Rockchip RK3588S SoC，因此应选择 RK3588S 的 [UEFI](https://github.com/edk2-porting/edk2-rk35xx/releases)、
而不是基于 Rockchip RK3588 SoC 的 ROCK 5B。

与 ROCK 5B 的安装有一些不同之处：  
只有远离 USB-C 端口的 HDMI 端口可以使用，也称为 HDMI_8K 端口；  
只有顶部的 USB 3.0 Type-A 端口可以使用，电路板上的任何其他端口都不支持，因此您需要一个 USB 全功能集线器来连接以太网输入设备和其他设备。

安装过程中可能会出现以下错误，请忽略并等待重启：

```text
您的设备遇到问题，需要重新启动。我们将为您重新启动。

其他

```

## 支持

如果您遇到其他问题或想要了解更多信息、
请加入 [Windows on R discord](https://discord.gg/tjwm9PwZWW) 并获得开发人员的帮助。
