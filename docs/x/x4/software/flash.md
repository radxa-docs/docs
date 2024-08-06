---
sidebar_position: 3
---

# 烧录程序到 RP2040

## 重启 RP2040

<Tabs queryString="flash_way">
    <TabItem value="Hardware">

        - 按一下 BOOTSEL 按键，松开之后，你会发现有一个 USB 大容量存储设（即 RP2040）

    </TabItem>
    <TabItem value="Software">

        - 新建一个 usb.sh 文件， 用于打开 rp2040 usb

            ```bash
            #! /bin/bash

            sudo gpioset gpiochip0 17=1
            sudo gpioset gpiochip0 7=1

            sleep 1

            sudo gpioset gpiochip0 17=0
            sudo gpioset gpiochip0 7=0


            ```

        - 执行脚本 usb.sh 后， 你会发现有一个 USB 大容量存储设备（即 RP2040）

            ```bash
            sudo chmod a+x usb.sh

            sudo bash usb.sh
            ```

    </TabItem>

</Tabs>

## 烧录程序

- 将 .uf2 文件拖入到该 usb 设备中， usb 设备消失后，程序就开始执行

  <img src="/img/x/x2l/flash_program.webp" alt="Pico Example" style={{ width: "80%" }} />
