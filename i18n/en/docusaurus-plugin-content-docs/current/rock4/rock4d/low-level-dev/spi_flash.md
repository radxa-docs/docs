---
sidebar_position: 2
---

# Erase/Flash SPI Boot Firmware

This guide explains how to use the RKRKDevTool to erase and flash SPI boot firmware.

:::tip
The Radxa ROCK 4D comes pre-loaded with SPI boot firmware for Linux systems. If you don't plan to use Android, you can skip the SPI Flash erase and flash operations.
:::

## About SPI Boot Firmware

SPI boot firmware (BootROM + bootloader) is responsible for initializing hardware in stages (CPU → Memory → Storage) and ultimately loading the operating system kernel from the storage device.

## Erasing SPI Flash

Erasing the SPI Flash will remove the SPI boot firmware. After erasure, all data in the SPI Flash will be cleared, and the system will not be able to boot.

You can use either the Rsetup tool or the RKRKDevTool to erase the SPI Flash.

### Using Rsetup Tool

1. Enter the Rsetup tool interface by typing `rsetup` in the terminal command line.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
rsetup
```
</NewCodeBlock>

2. Use the arrow keys to select the `System` option, then press Enter to confirm.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rsetup-earse-spi-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Use the arrow keys to select the `Bootloader Management` option, then press Enter to confirm.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rsetup-earse-spi-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

4. Use the arrow keys to select the `Erase SPI Bootloader` option, then press Enter to confirm.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rsetup-earse-spi-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

5. In the pop-up confirmation window, select `YES` and press Enter to confirm.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rsetup-earse-spi-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

6. Press the spacebar to select the corresponding file name, then press Enter to confirm the erase operation. If there are multiple options, you can perform the erase operation on each one sequentially.

:::tip
An asterisk `*` in the option box indicates that the option is enabled. If there is no `*`, the option is disabled.
:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rsetup-earse-spi-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

7. Reboot the system for the SPI Flash erase operation to take effect.

### Using RKDevTool

To erase SPI Flash using RKDevTool, you need to put the ROCK 4D into Maskrom mode. Please refer to the [RKDevTool Usage](./tool_rkdevtool) guide for installation and usage instructions.

<Tabs queryString="platform">

<TabItem value="Windows">

①. Ensure the ROCK 4D is in Maskrom mode. Refer to the [Maskrom Button](../hardware-use/maskrom) guide for instructions.

②. Select the appropriate Loader file for ROCK 4D. You can download the Loader file from the [Resource Downloads](../download) page.

③. Click the `Download` option to run the Loader file.

④. Select the `SPINOR` option.

⑤. Choose the `Switch Storage` option to change the storage device.

⑥. Select the `Erase ALL` option to erase the SPI Flash.

⑦. Monitor the operation progress in the interface.

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
```
rkdeveloptool ld
```
</NewCodeBlock>

Output similar to the following indicates a Maskrom device is detected:

```
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

3. Run the Loader File

Replace `demo.bin` with the Loader file for ROCK 4D. You can download the Loader file from the [Resource Downloads](../download) page.

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool db demo.bin
```
</NewCodeBlock>

4. Erase SPI Flash

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool ef
```
</NewCodeBlock>

5. Reboot the system for the SPI Flash erase operation to take effect

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>

## Flashing SPI Flash

This section explains how to flash SPI Flash using RKDevTool.

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
```
rkdeveloptool ld
```
</NewCodeBlock>

Output similar to the following indicates a Maskrom device is detected:

```
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

3. Run the Loader File

Replace `demo.bin` with the Loader file for ROCK 4D. You can download the Loader file from the [Resource Downloads](../download) page.

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool db demo.bin
```
</NewCodeBlock>

4. Flash SPI Boot Firmware

Replace `spi.img` with the SPI boot firmware for ROCK 4D. You can download the SPI boot firmware from the [Resource Downloads](../download) page.

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool wl 0 spi.img
```
</NewCodeBlock>

5. Reboot the system for the SPI Flash operation to take effect

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>
