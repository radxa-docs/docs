---
sidebar_position: 10
---

import BIOS from '../../../common/orion-common/low-level-dev/\_bios.mdx';

# Update BIOS Firmware

<BIOS board="Radxa Orion O6" power="20V Type-C Power Adapter" download_page="../../download" tag="o6" />

## Update BIOS Firmware Using a Programmer

For advanced users who need to recover from a corrupted BIOS or prefer direct hardware access, you can use a Serial Flash programmer (such as CH341A) to flash the BIOS firmware (cix_flash_all.bin) directly to the SPI NOR Flash chip. This method completely bypasses the operating system and works even if the device cannot boot.

### Remove the SPI Flash Chip

Steps to remove the SPI Flash chip:

① : Locate the SPI Flash chip on the motherboard

② : Open the right latch cover of the SPI Flash

③ : Open the left latch cover of the SPI Flash

After completing the above steps, use tweezers to remove the SPI Flash chip from the motherboard

<div style={{textAlign: 'center'}}>
    <img src="/en/img/orion/o6/o6_spi_uninstall.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Flash the BIOS Firmware

For detailed instructions and hardware requirements, please refer to the comprehensive [forum guide](https://forum.radxa.com/t/guide-flash-bios-with-ch341a-macos-linux/26742) provided by community member Meco.

The `cix_flash_all.bin` file required for the forum guide is located in the downloaded BIOS package.

### Install the SPI Flash Chip

① : Install the SPI Flash chip onto the motherboard

② : Reattach the left latch cover of the SPI Flash

③ : Reattach the right latch cover of the SPI Flash

:::tip Pay attention to the orientation and position of the chip during installation

- The circle on the chip corresponds to pin 1, which is marked with a small red circle in the image.
- The socket for the SPI Flash has a triangular arrow that corresponds to pin 1 of the SPI Flash

You can confirm the installation orientation and position of the SPI Flash using the above two methods.
:::

<div style={{textAlign: 'center'}}>
    <img src="/en/img/orion/o6/o6_spi_install.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
