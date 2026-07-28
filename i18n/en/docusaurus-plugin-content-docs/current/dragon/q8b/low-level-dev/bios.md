---
sidebar_position: 1
---

# BIOS Description

The BIOS (Basic Input / Output System) is the firmware on the motherboard. It runs first when power is applied, wakes up the hardware, performs the self-test, and boots the operating system. It acts as the "bridge" between the hardware and the OS.

## BIOS Main Interface

Press **F2** during power-on to enter the BIOS setup screen.

The top of the BIOS screen displays the board model, processor model and frequency, firmware version, and memory size.

- Key hints

  - Arrow keys: navigate between options
  - Enter: enter or confirm the current option
  - ESC: return to the previous level or exit the setup screen

```plaintext
Radxa Dragon Q8B
Snapdragon (TM) 8cx Gen 3 @ 3.0 GHz                              1.53 GHz
6.0.260701.BOOT.MXF.1.1.c1-00167-MAKENA-1                        16384 MB RAM

   Select Language                  <English>
 ► Radxa Platform Configuration
 ► Device Manager
 ► Boot Manager
 ► Boot Maintenance Manager

   Continue
   Reset
   Reboot into EDL/9008
   Enter UEFI Shell
   Enter Boot Menu

   Reset BIOS to default settings

  ↑↓=Move Highlight              <Enter>=Select Entry
```

- **Select Language**: Choose the BIOS display language. **English** and **Simplified Chinese** are supported.
- **Radxa Platform Configuration**: Configure Radxa board-specific hardware.
- **Device Manager**: Device manager.
- **Boot Manager**: Boot manager.
- **Boot Maintenance Manager**: Boot maintenance manager.
- **Continue**: Save the current settings and exit the BIOS setup screen to continue booting.
- **Reset**: Reset the BIOS.
- **Reboot into EDL / 9008**: Reboot into EDL (Emergency Download) mode.
- **Enter UEFI Shell**: Enter the UEFI shell.
- **Enter Boot Menu**: Enter the boot menu.
- **Reset BIOS to default settings**: Reset the BIOS to the factory defaults. The BIOS will reboot automatically after this action.

### Radxa Platform Configuration

Use this menu to configure Radxa board-specific hardware such as GPIO, PCIe, USB, and other features.

The top of the screen shows the Dragon Q8B board information, including manufacturer, SKU, hardware version, and serial number.

```plaintext
┌────────────────────────────────────────────────────────────────────────────────────┐
│                                  Radxa Platform Configuration                      ｜
└────────────────────────────────────────────────────────────────────────────────────┘

   Manufacturer               Radxa Computer             Configure the PCIe settings.
   Product Name               RS782-D16S32W0
   Version                    V1.20B
   Serial Number              33JBEYIO

   Configuration Options

 ► GPIO
 ► PCI Express Settings
 ► USB / Type-C Settings
 ► Debugging Settings
 ► Hypervisor Settings
 ► Boot Device Order
 ► Device Tree Settings
 ► Third-party OS Compatibility Settings
 ► Custom Logo

   Blue User LED State              <On>
   Auto Boot Time-out               [5]

┌─────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit        │
└─────────────────────────────────────────────────────────────────────────────────┘
```

- **GPIO**: Configure the 40-pin GPIO.
- **PCI Express Settings**: Configure PCIe.
- **USB / Type-C Settings**: Configure the speed and output voltage of the USB-A / USB-C ports.
  - You can configure the Type-C 0/1 ports to output a higher voltage, for example 9V.
  - You can configure the Type-C 0/1 ports to a maximum speed of 10 Gbps or 5 Gbps. The default is **10 Gbps**.
  - You can configure the Type-A 3.0 ports to a maximum speed of 10 Gbps or 5 Gbps. The default is **5 Gbps**.
- **Debugging Settings**: Configure the serial debugging functions.
  - **Synchronous Debug UART in UEFI**: Disabled by default.
  - **Debug Print Level**: You can configure the debug print level: Default, Error Only, Error + Warn, or Debug. The default is **Default**.
- **Hypervisor Settings**: Configure KVM / virtualization.
- **Boot Device Order**: Configure the boot priority. The default boot order is **USB → SD Card → NVMe → UFS**.
- **Device Tree Settings**: Control whether UEFI loads, fixes, and passes the Device Tree before booting Linux, so that the system can correctly identify and initialize the on-board hardware.
- **Third-party OS Compatibility Settings**: Third-party OS compatibility settings.
- **Custom Logo**: Customize the boot logo image.
- **Blue User LED State**: State of the blue user LED. You can turn the LED on or off.
- **Auto Boot Time-out**: Auto boot time-out in seconds. The default is **5 seconds**.

### Device Manager

```plaintext
┌──────────────────────────────────────────────────────────────────────────────────┐
│                                         Device Manager                           │
└──────────────────────────────────────────────────────────────────────────────────┘

   Devices List
 ► TCG Drive Management

   Press ESC to exit.

┌─────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit        │
└─────────────────────────────────────────────────────────────────────────────────┘
```

- **TCG Drive Management**: TCG (Trusted Computing Group) drive management.

### Boot Manager

Use this menu to temporarily adjust how the system boots. You can also see which media the BIOS has detected here, for example SPI Nor Flash and NVMe SSD.

```plaintext
┌──────────────────────────────────────────────────────────────────────────────────┐
│                                       Boot Manager                               │
└──────────────────────────────────────────────────────────────────────────────────┘

   Boot Manager Menu

   UEFI SPI NOR Flash
   UEFI NVMe Disk

   Use the <↑> and <↓> keys to choose a boot option, the
   key to select a boot option, and the  key to exit the Boot
   Manager Menu.

┌─────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              =Select Entry             Esc=Exit               │
└─────────────────────────────────────────────────────────────────────────────────┘
```

### Boot Maintenance Manager

Use this menu for finer-grained boot option management. You can create, modify, or delete custom boot options and control driver and console behavior.

```plaintext
┌──────────────────────────────────────────────────────────────────────────────────┐
│                           Boot Maintenance Manager                               │
└──────────────────────────────────────────────────────────────────────────────────┘

 ► Boot Options
 ► Driver Options
 ► Boot From File
 ► Boot Device Order

┌─────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight            <Enter>=Select Entry           Esc=Exit             │
└─────────────────────────────────────────────────────────────────────────────────┘
```

- **Boot Options**: Modify the system boot order.
- **Driver Options**: Modify the boot driver options.
- **Boot From File**: Boot the system from a file or device.
- **Boot Device Order**: Modify the boot device order.