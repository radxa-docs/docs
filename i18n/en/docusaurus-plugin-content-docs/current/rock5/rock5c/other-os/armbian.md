---
sidebar_position: 11
description: "Armbian"
---

# Armbian

## OS Usage

### Enable Wi-Fi

ROCK 5C is equipped with Wi-Fi/BT module (AIC8800D80). For Armbian, Wi-Fi is not enabled by default.

To enable Wi-Fi, please try the following steps.

1.Get AIC8800 driver and firmware packages from https://github.com/radxa-pkg/aic8800/releases . For example,

```
wget https://github.com/radxa-pkg/aic8800/releases/download/3.0%2Bgit20240327.3561b08f-2/aic8800-firmware_3.0+git20240327.3561b08f-2_all.deb
wget https://github.com/radxa-pkg/aic8800/releases/download/3.0%2Bgit20240327.3561b08f-2/aic8800-usb-dkms_3.0+git20240327.3561b08f-2_all.deb
wget https://github.com/radxa-pkg/aic8800/releases/download/3.0%2Bgit20240327.3561b08f-2/aicrf-test_3.0+git20240327.3561b08f-2_arm64.deb
```

2.Install AIC8800 packages.

```
sudo dpkg -i *.deb
```

3.Reboot OS and you will find the Wi-Fi icon.

```
sudo reboot
```
