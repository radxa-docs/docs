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

## 配置显示

- 备份 `/usr/share/X11/xorg.conf.d/20-modesetting.conf`

```
sudo mv /usr/share/X11/xorg.conf.d/20-modesetting.conf /usr/share/X11/xorg.conf.d/20-modesetting.conf.bak
```

- 在 `/etc/X11/xorg.conf.d` 下添加一个配置文件 `20-modesetting.conf`，内容如下：

```
Section "Device"
     Identifier  "Rockchip Graphics"
     Driver      "fbdev"
     Option      "fbdev"          "/dev/fb1"
     Option      "DRI"            "2"
EndSection
```

需要检查一下具体设备是 /dev/fb0 还是 /dev/fb1

## 配置触摸

在 /etc/X11/xorg.conf.d 下添加一个配置文件 99-touchscreen-calibration.conf，内容如下：

```
Section "InputClass"
    Identifier "calibration"
    MatchProduct "ADS7846 Touchscreen"
    Option "TransformationMatrix" "-1 0 1 0 1 0 0 0 1"
EndSection
```

## 重启系统

```
sudo reboot
```

重启系统后， 屏幕应该已经正常显示了。
