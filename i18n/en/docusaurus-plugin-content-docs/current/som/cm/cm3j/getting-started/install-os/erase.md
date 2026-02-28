---
sidebar_position: 4
description: "Erase eMMC or SPI Flash via Maskrom"
---

import Maskrom from "./maskrom/\_maskrom.mdx"

# Erase eMMC or SPI Flash via Maskrom.

## Enter Maskrom Mode

<Maskrom/>

## Erase eMMC

<Tabs queryString="Host">
    <TabItem value="Linux/MacOS">
    1. Generate zero.img

        ```bash
        dd if=/dev/zero of=./zero.img bs=1M count=64
        ```

    2. Make sure the PC recognizes Maskrom

        ```bash
        sudo rkdeveloptool ld
        DevNo=1	Vid=0x2207,Pid=0x350a,LocationID=109	Maskrom
        ```

    3. Flash the Loader

        <pre>
        sudo rkdeveloptool db rk356x_spl_loader_ddr1056_v1.12.109_no_check_todly.bin
        </pre>

    4. Erase eMMC

        ```bash
        sudo rkdeveloptool wl 0 zero.img
        ```

    5. Restart the device

        ```bash
        sudo rkdeveloptool rd
        ```

    </TabItem>
    <TabItem value="Windows">
    Open the RkDevTool and use it to perform the erasing operation.

    1. Make sure the PC recognizes Maskrom

    2. Download zero.img from [Resource Download](../../download.md)

    3. Select the Loader (see the [Resource Download](../../download.md) section)

    4. Change the "image" option to "zero.img"

    5. Click to run
    ![eMMC](/img/cm3j/radxa-cm3j-erase.webp)

    </TabItem>

</Tabs>

## Erase SPI Flash

<Tabs queryString="Host">
    <TabItem value="Linux/MacOS">
    1. Generate zero.img

        ```bash
        dd if=/dev/zero of=./zero.img bs=1M count=64
        ```

    2. Make sure the PC recognizes Maskrom

        ```bash
        sudo rkdeveloptool ld
        DevNo=1	Vid=0x2207,Pid=0x350a,LocationID=109	Maskrom
        ```

    3. Flash the Loader

        <pre>
        sudo rkdeveloptool db rk356x_spl_loader_ddr1056_v1.12.109_no_check_todly.bin
        </pre>

    4. Erase SPI Flash

        ```bash
        sudo rkdeveloptool ef
        ```

    5. Restart the device

        ```bash
        sudo rkdeveloptool rd
        ```

    </TabItem>
    <TabItem value="Windows">
    Open the RkDevTool and use it to perform the erasing operation.

    1. Make sure the PC recognizes Maskrom

    2. Download zero.img from [Resource Download](../../download.md)

    3. Select the Loader (see the [Resource Download](../../download.md) section)

    4. Change the "image" option to "zero.img"

    5. Click to run
    ![SPI Flash](/img/cm3j/radxa-cm3j-erase.webp)

    </TabItem>

</Tabs>
