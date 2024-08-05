---
sidebar_position: 3
---

## Flash the program to the RP2040

## Reboot RP2040

<Tabs queryString="flash_way">
    <TabItem value="Hardware">

        - Press and hold the RECOVERY button

        - Power up X4

        - Release the button after booting

        - Once in the system, you'll find a USB device (i.e. RP2040)

    </TabItem>
    <TabItem value="Software">

        - Create a new usb.sh file to turn on the rp2040 usb

            ```bash
            #! /bin/bash

            sudo gpioset gpiochip0 17=1
            sudo gpioset gpiochip0 7=1

            sleep 1

            sudo gpioset gpiochip0 17=0
            sudo gpioset gpiochip0 7=0


            ```

        - After executing the script usb.sh, you will see that there is a USB device (i.e. RP2040)

            ```bash
            sudo chmod a+x usb.sh

            sudo bash usb.sh
            ```

    </TabItem>

</Tabs>

## Burn the program

- Drag the .uf2 file into the usb device, and when the usb device disappears, the program starts executing

  <img src="/img/x/x2l/flash_program.webp" alt="Pico Example" style={{ width: "80%" }} />
