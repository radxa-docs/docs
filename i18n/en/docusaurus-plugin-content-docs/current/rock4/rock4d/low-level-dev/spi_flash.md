---
sidebar_position: 2
---

# Erase/Flash SPI Boot Firmware

This guide explains how to use the RKDevTool to erase and flash SPI boot firmware.

:::tip
The Radxa ROCK 4D comes pre-loaded with SPI boot firmware for Linux systems. If you don't plan to use Android, you can skip the SPI Flash erase and flash operations.
:::

## About SPI Boot Firmware

SPI boot firmware (BootROM + bootloader) is responsible for initializing hardware in stages (CPU → Memory → Storage) and ultimately loading the operating system kernel from the storage device.

## Erasing SPI Boot Firmware

:::danger
Erasing the SPI boot firmware will clear all data in the SPI Flash, and the system will not be able to boot.
:::

You need to put the ROCK 4D into Maskrom mode first, then use the RKDevTool to erase the SPI Flash. Please refer to the [RKDevTool Usage](./tool_rkdevtool) guide for installation and usage instructions.

<Tabs queryString="platform">

<TabItem value="Windows">

①. Ensure the ROCK 4D is in Maskrom mode. Refer to the [Maskrom Button](../hardware-use/maskrom) guide for instructions.

②. Select the appropriate Loader file for ROCK 4D. You can download the Loader file from the [Resource Downloads](../download) page.

③. Click the `Download` option to run the Loader file.

④. Select the `SPINOR` option.

⑤. Choose the `Switch Storage` option to change the storage device.

⑥. Select the `Erase ALL` option to erase the SPI Flash.

⑦. You can monitor the operation progress in this interface.

Reboot the system for the SPI Flash erase operation to take effect.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rk-earse-spi-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux / MacOS">

1. Ensure the ROCK 4D is in Maskrom mode. Refer to the [Maskrom Button](../hardware-use/maskrom) guide for instructions.

2. Verify Maskrom Mode

Use the `rkdeveloptool ld` command to view the detected device information:

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
rkdeveloptool ld
```
</NewCodeBlock>

Output similar to the following indicates a Maskrom device is detected:

```text
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

3. Run the Loader File

Replace `demo.bin` with the Loader file for ROCK 4D. You can download the Loader file from the [Resource Downloads](../download) page.

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool db demo.bin
```
</NewCodeBlock>

4. Erase SPI Flash

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool ef
```
</NewCodeBlock>

5. Reboot the system for the SPI Flash erase operation to take effect

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>

## Flashing SPI Boot Firmware

Using RKDevTool to flash SPI boot firmware.

<Tabs queryString="platform">

<TabItem value="Windows">

①. Confirm the ROCK 4D is in Maskrom mode. Refer to the [Maskrom Button](../hardware-use/maskrom) guide if needed.

②. Select the appropriate Loader file for ROCK 4D. You can download the Loader file from the [Resource Downloads](../download) page.

③. Select the storage device. Choose the `SPINOR` option.

④. Select the `spi.img` file you want to flash to the SPI Flash.

⑤. Check the `Write by Address` option.

⑥. Click the `RUN` button to execute all operations.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rk-down-spi-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux / MacOS">

1. Ensure the ROCK 4D is in Maskrom mode. Refer to the [Maskrom Button](../hardware-use/maskrom) guide for instructions.

2. Verify Maskrom Mode

Use the `rkdeveloptool ld` command to view the detected device information:

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
rkdeveloptool ld
```
</NewCodeBlock>

Output similar to the following indicates a Maskrom device is detected:

```text
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

3. Run the Loader File

Replace `demo.bin` with the Loader file for ROCK 4D. You can download the Loader file from the [Resource Downloads](../download) page.

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool db demo.bin
```
</NewCodeBlock>

4. Flash SPI Boot Firmware

Replace `spi.img` with the SPI boot firmware for ROCK 4D. You can download the SPI boot firmware from the [Resource Downloads](../download) page.

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool wl 0x0 spi.img
```
</NewCodeBlock>

5. Reboot the system for the SPI Flash operation to take effect

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>
