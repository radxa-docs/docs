---
sidebar_position: 8
---

# ROCK 5 Family FAQ

## ROCK 5A FAQ

### Does the ROCK 5A ship with a SPI Flash Module as standard?

- The ROCK 5A is sold without the [Radxa SPI Flash](../accessories/spi-flash-module) module.  
  This module needs to be purchased separately and the interface is shared with the Radxa eMMC module.  
  The Radxa SPI Flash Module cannot be used when using an eMMC module.

## ROCK 5B FAQ

### The Rock 5B will support WiFi 6E. Does the new ROCK 5B come with a (6E) wifi chip. Or do I have to buy it separately?

- WiFi cards are not included by default, as different users require different WiFi speeds.
  The Radxa team recommends using a wifi card with the RTL8852BE chip to strike a balance between price and performance.

### Can the ROCK 5B boot from a PCIe M.2 NVME SSD without an eMMC and TF card?

- Yes. The ROCK 5B can boot from a PCIe M.2 NVME SSD.
  The ROCK 5B is equipped with a 16MB SPI NOR Flash and a PCIe M.2 M-Key connector. the SPI NOR Flash stores the bootloader.
  the NVME SSD stores the entire system image (at least the kernel and rootfs).
  the ROCK 5B is equipped with a 16MB SPI NOR Flash and a PCIe M.2 M-Key connector.  
  For more information, please check [SPI NOR Flash and PCIe NVME SSD boot](./lowlevel-development/bootloader_spi_flash)

### Is the heatsink included in the price?

- Heatsinks are not included by default and need to be purchased separately

### My new ROCK 5B won't boot/is stuck in an infinite boot loop

- The ROCK 5B supports PD protocol, which allows the adapter to output higher voltages such as 9V, 12V, 15V, 20V via handshaking to meet the total system power load requirements (approx. 30W, WiFi, SSD, USB peripherals etc.). Currently PD negotiation is implemented in the kernel driver and needs to be powered on to the kernel run phase to start the negotiation, but some power adapters cannot wait for the ROCK 5B power negotiation phase and power off when it times out, resulting in a dead loop. We offer the following advice:
  1.  We strongly recommend using the official power adapter [Radxa Power PD 30W](../accessories/pd_30w). The Radxa Power PD 30W was tested in all conditions of the ROCK 5B.
  2.  Using a higher speed SD card or eMMC module and disabling the bootloader/kernel serial console.
  3.  Using a 12V DC USB-C port power supply
  4.  To check the availability of other power supplies reported by the Radxa community please check the basic support information on the motherboard.

### ROCK 5B not booting, how to troubleshoot

- Troubleshooting steps for the ROCK 5B are as follows:
  1.  Power off the ROCK 5B, remove the eMMC module, SD card, NVMe SSD
  2.  Press and hold the Maskrom Button (**see label 25** in the ROCK 5B labeling diagram) [5B Maskrom Button](/rock5/rock5b/getting-started/).
  3.  Connect the ROCK 5B to the computer via USB Type C using the USB Type A to Type C cable
  4.  Check if there is a new unknown USB device in the Windows Device Manager, if so, the ROCK 5B has been successfully recognised. If not, please try another independent USB port as a priority. It is recommended to connect the ROCK 5B to a separate USB port on the back panel of the computer to ensure that it has sufficient power supply.
