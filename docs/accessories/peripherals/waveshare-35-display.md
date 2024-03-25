---
sidebar_position: 10
---

# 微雪 3.5 inch SPI TFT LCD 屏幕

## 连接该显示屏

按照以下方法将屏幕连接到开发板：

![Waveshare35-spi-display](/img/accessories/waveshare35-spi-display.webp)

## 使用 rsetup 开启 对应 overlay

- 进入 rsetup 后，进入设备树管理界面
<!-- - 进入 rsetup 后，跟随[设备树设置](/radxa-os/rsetup/devicetree)进入设备树管理界面 -->

- 启用 Waveshare 3.5 inch Display 的 overlay

```
[*] Enable Waveshare 3.5 inch Display on SPI1
```

## 配置屏幕

- 备份 /etc/X11/xorg.conf.d/20-modesetting.conf

```
sudo cp /etc/X11/xorg.conf.d/20-modesetting.conf /etc/X11/xorg.conf.d/20-modesetting.conf.bak
```

- 清除原有内容，并添加以下内容

```
Section "Device"
     Identifier  "Rockchip Graphics"
     Driver      "fbdev"
     Option      "fbdev"          "/dev/fb1"
     Option      "DRI"            "2"
EndSection
```

需要检查一下具体设备是 /dev/fb0 还是 /dev/fb1

## 重启系统

```
sudo reboot
```

重启系统后， 屏幕应该已经正常显示了。
