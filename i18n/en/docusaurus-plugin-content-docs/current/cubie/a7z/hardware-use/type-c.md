---
sidebar_position: 2
---

# USB Type-C Interface

The Radxa Cubie A7Z features one USB 2.0 Type-C and one USB 3.1 Type-C port.

- USB 2.0 Type-C
  - Power Supply: Supports 5V power input
  - Data Transfer: Supports USB OTG and FEL mode for firmware updates
- USB 3.1 Type-C
  - Display: Supports DisplayPort Alt Mode
  - Data Transfer: Supports USB OTG

:::info Interface Location
For the specific location of the USB Type-C ports, please refer to the interface description section in the [Hardware Interface](./hardware-info) tutorial!
:::

## Usage Guide

### USB 2.0 Type-C

Normal Use: Power the device using a 5V Type-C power adapter (recommended 3A or higher).

Firmware Update Mode: Connect the board to a PC using a USB Type-C data cable for both power supply and data transfer.

:::tip Recommended Accessories

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
  :::

### USB 3.1 Type-C

Normal Use: Connect USB flash drives and other devices to the USB Type-C port for data transfer.

Display Function: Connect to a display using a USB Type-C cable, supporting DisplayPort Alt Mode.

OTG Mode: Enable OTG mode through Rsetup.

### USB-C Power Port as Host Mode

The USB-C Power port (interface ①, USB-C 2.0 OTG & Power) on the A7Z works in device mode by default. To connect peripherals such as wireless mouse receivers, keyboards, or USB flash drives, you need to switch it to host mode using a device tree overlay.

#### Step 1: Create the Overlay File

A device tree overlay is required to switch the USB-C Power port to host mode. Below is a minimal configuration example:

```dts
/dts-v1/;
/plugin/;

/ {
    compatible = "allwinner,sun50i-a733";
};

&usbc0 {
    usb_port_type = <0x1>; /* 0x0: device, 0x1: host */
};
```

:::info
The `usb_port_type` setting controls the USB-C port role: setting it to `0x1` enables host mode, allowing connection of mouse, keyboard, USB flash drive, and other peripherals.
:::

#### Step 2: Install the Overlay

Place the prepared dts file in any directory, then install it using rsetup:

```bash
sudo rsetup
# Select Overlays → Install 3rd Party overlay → Select the corresponding dts file
```

rsetup will automatically compile the selected dts file and enable it. A system reboot is required after enabling the overlay for it to take effect.

#### Step 3: Reboot the System

```bash
sudo reboot
```

#### Step 4: Verify

```bash
lsusb
```

If the connected device appears in the output, host mode has been successfully enabled.

:::info Compatibility
This method also applies to the Cubie A7S board.
:::
