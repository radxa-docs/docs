---
sidebar_position: 4
description: "通过 Maskrom 清除 eMMC 或者 SPI Flash"
---

import Maskrom from "./maskrom/\_maskrom.mdx"

# 通过 Maskrom 清除 eMMC 或者 SPI Flash

## 进入 Maskrom 模式

<Maskrom/>

## 清空 eMMC

<Tabs queryString="Host">
    <TabItem value="Linux/MacOS">
    1. 生成 zero.img

        ```bash
        dd if=/dev/zero of=./zero.img bs=1M count=64
        ```

    2. 确保主机能识别到 Maskrom

        ```bash
        sudo rkdeveloptool ld
        DevNo=1	Vid=0x2207,Pid=0x350a,LocationID=109	Maskrom
        ```

    3. 刷入 Loader

        <pre>
        sudo rkdeveloptool db rk356x_spl_loader_ddr1056_v1.12.109_no_check_todly.bin
        </pre>

    4. 清空 eMMC

        ```bash
        sudo rkdeveloptool wl 0 zero.img
        ```

    5. 重启设备

        ```bash
        sudo rkdeveloptool rd
        ```

    </TabItem>
    <TabItem value="Windows">
    打开 RkDevTool 工具，我们用 RkDevTool 进行擦除

    1. 确保主机能识别到 Maskrom

    2. 从[资源下载汇总](../../download.md)中下载 zero.img

    3. 选择 Loader (见[资源下载汇总](../../download.md)部分)

    4. 将 image 选项改为 zero.img

    5. 点击执行
    ![eMMC](/img/cm3j/radxa-cm3j-erase.webp)

    </TabItem>

</Tabs>

## 清空 SPI Flash

<Tabs queryString="Host">
    <TabItem value="Linux/MacOS">
    1. 生成 zero.img

        ```bash
        dd if=/dev/zero of=./zero.img bs=1M count=64
        ```

    2. 确保主机能识别到 Maskrom

        ```bash
        sudo rkdeveloptool ld
        DevNo=1	Vid=0x2207,Pid=0x350a,LocationID=109	Maskrom
        ```

    3. 刷入 Loader

        <pre>
        sudo rkdeveloptool db rk356x_spl_loader_ddr1056_v1.12.109_no_check_todly.bin
        </pre>

    4. 清空 SPI Flash

        ```bash
        sudo rkdeveloptool ef
        ```

    5. 重启设备

        ```bash
        sudo rkdeveloptool rd
        ```

    </TabItem>
    <TabItem value="Windows">
    打开 RkDevTool 工具，我们用 RkDevTool 进行擦除

    1. 确保主机能识别到 Maskrom

    2. 从[资源下载汇总](../../download.md)中下载 zero.img

    3. 选择 Loader (见[资源下载汇总](../../download.md)部分)

    4. 将 image 选项改为 zero.img

    5. 点击执行
    ![SPI Flash](/img/cm3j/radxa-cm3j-erase.webp)

    </TabItem>

</Tabs>
