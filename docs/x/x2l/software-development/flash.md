---
sidebar_position: 30
---

# 烧录

## 步骤

- 新建一个 usb.sh 文件， 用于打开 rp2040 usb

```
ps@ps-palmshell:~$ cat usb.sh
#! /bin/bash

sudo gpioset gpiochip1 60=1
sudo gpioset gpiochip1 61=1

sleep 1

sudo gpioset gpiochip1 60=0
sudo gpioset gpiochip1 61=0
```

- 执行一下 usb.sh 程序， RP2040 将以 usb 设备形式出现

- 将 .uf2 文件拖入到该 usb 设备中， usb 设备消失后，程序就开始执行

<img src="/img/x/x2l/flash_program.webp" alt="Pico Example" height="350" width="700" />
