---
sidebar_position: 30
---

# Burning

## Steps

- Create a new usb.sh file to open the rp2040 usb.

```
ps@ps-palmshell:~$ cat usb.sh
/bin/bash /bin/bash

sudo gpioset gpiochip1 60=1
sudo gpioset gpiochip1 61=1

sleep 1

sudo gpioset gpiochip1 60=0
sudo gpioset gpiochip1 61=0
```

- Execute the usb.sh program and the RP2040 will appear as a usb device.

- Drag the .uf2 file into the usb device, after the usb device disappears, the program will start to execute.

<img src="/img/x/x2l/flash_program.webp" alt="Pico Example" height="350" width="700" />
