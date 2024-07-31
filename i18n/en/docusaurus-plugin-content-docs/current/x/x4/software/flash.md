---
sidebar_position: 3
---

## Burn the program to the RP2040

## Reboot the RP2040

<Tabs>
    <TabItem value=“Hardware reboot RP2040”>


    - Press and hold the RECOVERY button

    - Power up the X4.

    - Release the button after booting

    - Once in the system, you'll find a USB device (i.e. RP2040)

    </TabItem
    <TabItem value=“Software reboot RP2040”>

    - Create a new usb.sh file to turn on the rp2040 usb

        ```bash
        /bin/bash /bin/bash

        sudo gpioset gpiochip0 17=1

        sleep 1

        sudo gpioset gpiochip0 17=0

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

    <img src=“/img/x/x2l/flash_program.webp” alt=“Pico Example” style={{ width: “80%” }} />
