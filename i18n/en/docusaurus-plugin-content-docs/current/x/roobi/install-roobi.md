---
sidebar_position: 20
---

# Installing ROOBI OS

:::tip

ROOBI OS will come pre-installed on the machine you purchased, so you usually don't need to install it manually.

:::

## Using ROOBI Flasher

ROOBI Flasher is an installing tool used to recover ROOBI OS.
If your ROOBI system fails to start due to uncontrollable factors,
you can use this tutorial to restore your ROOBI system to its factory state.

:::note

**ROOBI OS** is the software that runs on the device for installing the operating system, while **ROOBI Flasher** is the software used to install ROOBI OS.

**ROOBI OS** cannot be directly run from a USB drive.

:::

1. Obtain the flashing image:

<details>
<summary>Select the appropriate model for download</summary>

> [PS006(SLiM X2L)](https://github.com/palmshell/RoobiOS/releases/download/ps006_flasher_v1.1.1/ps006_v1.1.1_flasher.img.xz)
>
> PS002(PuER N1) Coming soon

</details>

2. Insert the USB flash drive into your host machine.

3. Use balenaEtcher to write the image to the USB flash drive. (<InlineDanger>**Please note: This operation will erase all data on your USB flash drive. **</InlineDanger>)

![Balena_Etcher](/img/x/roobi/balena_etcher.webp)

4. After successful writing, remove the USB flash drive and insert it into the USB port of the device. Any USB port will work, but it is recommended to insert it into a USB3.0 port.

5. Activate eMMC: Locate the eMMC Recovery button (refer to the respective product diagram). <InlineSuccess> Before powering on, press and **hold** the `eMMC Recovery button`, and then press and **release** the `power button`, Release the `eMMC Recovery button` when the display lights up.</InlineSuccess>

6. Immediately after the display appears, press `F7` to enter the boot selection interface.

![Balena_Etcher](/img/x/roobi/boot_menu.webp)

7. Select your USB flash drive device and press `Enter` to select the corresponding entry to start the flashing tool.

![Balena_Etcher](/img/x/roobi/booting.webp)

8. Wait for 5 seconds, and the ROOBI will be automatically flashed into the eMMC. (<InlineDanger>**Please note: This operation will erase all contents in the eMMC of your device. You can disconnect the power before the countdown ends to cancel the operation.** </InlineDanger>)

![Balena_Etcher](/img/x/roobi/booting.webp)

9. When you see the following screen, it means the flashing was successful. You can press `Enter` to restart and enter the operating system, or press the power button to shut down.

![Balena_Etcher](/img/x/roobi/success.webp)

:::tip

Pressing `Enter` **will not** directly enter the ROOBI OS.

:::

10. To enter the ROOBI OS through this step: [Enter the Roobi interface](https://palmshell.feishu.cn/wiki/NVJmwuCpsikcREkV3OfcWGbnnLd#XrKHdb1wtoWbnxxuw5xcVd5WnOg)

:::tip

This step is the same as step 5 of this tutorial.

If you haven't gone through this step, you will enter the operating system normally.

:::
