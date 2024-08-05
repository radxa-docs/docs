# Installing ROOBI OS

:::tip

ROOBI OS will come pre-installed on the machine you purchase, so you usually won't need to install it manually.

:::

## Using ROOBI Flasher

ROOBI Flasher is a flashing tool used to restore ROOBI OS. If your ROOBI system fails to boot due to uncontrollable factors, you can use this tutorial to restore your ROOBI system to its factory state.

:::note

**ROOBI OS** is the software running on the device for flashing the operating system, while **ROOBI Flasher** is the software used to flash ROOBI OS.

**ROOBI OS** cannot be directly run from a USB flash drive or SD card.

:::

1. Obtain the flashing image:

> [SLiM X2L](https://gate.radxa.com/palmshell/RoobiOS/releases/download/ps006_flasher_v1.1.3/ps006_flasher-v1.1.3.img.xz)
>
> PuER N1 Coming Soon
>
> [ROCK 5 ITX](https://gate.radxa.com/radxa/roobi-config/releases/download/Rock5-itx-ROOBI-v1.2.1ROCK5-itx-ROOBI-Flasher-v1.2.1/ROCK5-itx-ROOBI-Flasher-v1.2.1.img.xz)


<Tabs queryString="devices">
  <TabItem value="x" label="X Series">

2. Insert your USB flash drive into your host machine.

3. Use balenaEtcher to write the image to the USB flash drive. <InlineDanger> **Note: This operation will erase all data on your USB flash drive.** </InlineDanger>

![Balena_Etcher](/img/roobi/balena_etcher.webp)

4. After successful writing, remove the USB flash drive and insert it into any USB port on the device. Any USB port will work, but it's recommended to use a USB 3.0 port.

5. Activate eMMC: First, find the eMMC Recovery button (refer to the product diagram). <InlineSuccess> Before booting, press and hold the `eMMC Recovery button`, and simultaneously press and immediately release the `Power button` until the monitor lights up, then release the `eMMC Recovery button`. </InlineSuccess>

6. After the display appears, immediately press `F7` to enter the boot selection interface.

![Balena_Etcher](/img/roobi/boot_menu.webp)

7. Select your USB flash drive device and press `Enter` to select the corresponding entry to start the flasher.

![Balena_Etcher](/img/roobi/booting.webp)

8. Wait for 5 seconds, and ROOBI will be automatically flashed into the eMMC. (<InlineDanger> **Note: This operation will erase all content in the eMMC of your device. You can disconnect the power before the countdown ends to cancel the operation.** </InlineDanger>)

![Balena_Etcher](/img/roobi/booting.webp)

9. When you see the following screen, the flashing is successful. Press `Enter` to restart and enter the operating system, or press the power button to shut down.

![Balena_Etcher](/img/roobi/success.webp)

:::tip

Pressing `Enter` will **not** directly enter ROOBI OS.

:::

10. You can enter ROOBI OS through this step: [Accessing the Roobi Interface](./roobi-usage?devices=x#accessing-the-roobi-interface)

:::tip

This step is the same as step 5 of this tutorial.

If you haven't performed this step, the system will boot normally.

:::

  </TabItem>
  <TabItem value="itx" label="ROCK 5 ITX">

2. Insert your SD card into your host machine using a card reader.

3. Use balenaEtcher to write the image to the SD card. <InlineDanger> **Note: This operation will erase all data on your SD card.** </InlineDanger>

![Balena_Etcher](/img/roobi/balena_etcher.webp)

4. After writing is complete, remove the SD card from the host machine and insert it into the [MicroSD](../rock5/rock5itx/getting-started/introduction#board-overview) slot on your device, located at number **4**.

5. Remove any other storage media from your device and power it on.s

6. After 5 seconds, ROOBI will be automatically flashed into the eMMC. (<InlineDanger> **Note: This operation will erase all content in the eMMC of your device. You can disconnect the power before the countdown ends to cancel the operation.** </InlineDanger>)

![start.webp](/img/roobi/start.webp)

7. When you see the following screen, the flashing is successful. Power off and restart to enter ROOBI OS.

![flashed.webp](/img/roobi/flashed.webp)

  </TabItem>
</Tabs>
