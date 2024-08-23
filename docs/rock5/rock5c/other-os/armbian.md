---
sidebar_position: 11
description: "Armbian 系统"
---

# Armbian 系统

## 系统的使用

### 使能 Wi-Fi

ROCK 5C 使用的 Wi-Fi/BT 模块芯片是 AIC8800D80。 Armbian 系统默认不安装驱动。

使能 Wi-Fi 的步骤：

1，从 https://github.com/radxa-pkg/aic8800/releases 下载 AIC8800 驱动包和固件包。如：

```
wget https://github.com/radxa-pkg/aic8800/releases/download/3.0%2Bgit20240327.3561b08f-2/aic8800-firmware_3.0+git20240327.3561b08f-2_all.deb
wget https://github.com/radxa-pkg/aic8800/releases/download/3.0%2Bgit20240327.3561b08f-2/aic8800-usb-dkms_3.0+git20240327.3561b08f-2_all.deb
wget https://github.com/radxa-pkg/aic8800/releases/download/3.0%2Bgit20240327.3561b08f-2/aicrf-test_3.0+git20240327.3561b08f-2_arm64.deb
```

2，安装 AIC8800 驱动包和固件包。

```
sudo dpkg -i *.deb
```

3，重启系统后，在桌面能看到 Wi-Fi 图标。

```
sudo reboot
```
