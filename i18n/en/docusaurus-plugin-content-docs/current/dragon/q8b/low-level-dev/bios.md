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

```biosscreen
Radxa Dragon Q8B
Snapdragon (TM) 8cx Gen 3 @ 3.0 GHz                              2.99 GHz
6.0.260821.BOOT.MXF.1.1.c1-00167-MAKENA-1                        16384 MB RAM

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

```biosscreen
┌────────────────────────────────────────────────────────────────────────────────────┐
│                                  Radxa Platform Configuration                      ｜
└────────────────────────────────────────────────────────────────────────────────────┘

   Manufacturer               Radxa Computer             Configure the PCIe settings.
   Product Name               RS782-D16S32W0X110
   Version                    V1.305
   Serial Number              WGAEZ0HF

   Configuration Options

 ► GPIO
 ► DRAM Settings
 ► PCI Express Settings
 ► USB / Type-C Settings
 ► Real-Time Clock (RTC) Settings
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
- **DRAM Settings**: View and set the DDR frequency.
- **PCI Express Settings**: Configure PCIe.
- **USB / Type-C Settings**: Configure the speed and output voltage of the USB-A / USB-C ports.
  - You can configure the Type-C 0/1 ports to output a higher voltage, for example 9V.
  - You can configure the Type-C 0/1 ports to a maximum speed of 10 Gbps or 5 Gbps. The default is **10 Gbps**.
  - You can configure the Type-A 3.0 ports to a maximum speed of 10 Gbps or 5 Gbps. The default is **5 Gbps**.
- **Real-Time Clock (RTC) Settings**: Configure the RTC time.
  - You can configure the I2C RTC date and time.
  - You can configure the RTC sync policy: I2C RTC to PMIC RTC / PMIC RTC to I2C RTC / Do not sync.
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

#### Third-party OS Compatibility Settings

By default, the following features are disabled to boot Radxa OS:

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────┐
│                              Third-party OS Compatibility Settings               │
└──────────────────────────────────────────────────────────────────────────────────┘

   Ignore unused clocks for Linux   <Enabled>          Append clk_ignore_unused to
                                                       Linux bootargs when enabled.
   These options are not recommended when using
   RadxaOS or other supported systems.                 Enabled: Add clk_ignore_unused
                                                       Disabled: Do not add this
   Workaround for missing           <Disabled>         argument.
   simple-bridge driver
   Workaround for broken            <Disabled>
   gpio-shared support
   Workaround for broken PCIe port  <Disabled>
   node parsing
   Force smaller PCIe BAR windows   <Disabled>
   Support efivars by patching      <Disabled>
   compatible value
   Ignore unused power domains      <Disabled>
   (PD) for Linux

┌──────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit         │
└──────────────────────────────────────────────────────────────────────────────────┘
```

To boot third-party operating systems such as Ubuntu 26 ISO, Fedora ISO, or Debian 14 ISO, you need to enable all the options:

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────┐
│                              Third-party OS Compatibility Settings               │
└──────────────────────────────────────────────────────────────────────────────────┘

   Ignore unused clocks for Linux   <Enabled>
   Workaround for missing           <Enabled>
   simple-bridge driver
   Workaround for broken            <Enabled>
   gpio-shared support
   Workaround for broken PCIe port  <Enabled>
   node parsing
   Force smaller PCIe BAR windows   <Enabled>
   Support efivars by patching      <Enabled>
   compatible value
   Ignore unused power domains      <Enabled>
   (PD) for Linux

┌──────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit         │
└──────────────────────────────────────────────────────────────────────────────────┘
```

### Device Manager

```biosscreen
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

```biosscreen
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

```biosscreen
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

## FAQs

### Custom Logo Example

#### Key Points

1. Supported image formats: **JPEG**, **PNG**, **BMP**.
2. There is no limit on the size or resolution of the image you provide. The BIOS automatically scales the image to 960x960 or below, and it must not exceed the logo partition size.

#### Steps

1. Using Radxa OS as an example, place the logo JPG file in the first partition of Radxa OS, the config partition.

```plaintext
root@radxa-dragon-q8b:~# ls /config/test_logo.jpg
/config/test_logo.jpg
```

2. Reboot the system and enter the `Select Logo Image` screen in the BIOS.

```plaintext
-> Radxa Platform Configuration
    -> Custom Logo
        -> Select Logo Image...
```

3. Find the config partition in the File Explorer page and select it.

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                          File Explorer                                           │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘

 ► config,                                                                                          │
   [VenHw(D1531D41-3F80-4091-8D0A-541F59236D66)/HD(1,GPT,0CDE56A9-52                                │
   32-43CD-A74C-709EDE794C8F,0x8000,0x8000)]                                                        │
 ► efi,                                                                                             │
   [VenHw(D1531D41-3F80-4091-8D0A-541F59236D66)/HD(2,GPT,AB7482D2-52                                │
   D5-41EB-AA7A-9D967C1BA1A4,0x10000,0x200000)]                                                     │

┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit                         │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```

4. Select `test_logo.jpg`.

```biosscreen
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                          File Explorer                                           │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘

 ► ***NEW FILE***                                                     This menu used to create a    │
 ► ***NEW FOLDER***                                                   new file in current           │
                                                                      directory, jump to next page  │
                                                                      to name the new file          │
   config.txt                                                         │
   logo.bmp                                                           │
   test_logo.jpg                                                      │

┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ ↑↓=Move Highlight              <Enter>=Select Entry             Esc=Exit                         │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```

5. After selecting the `test_logo.jpg` file, the following output is shown:

```plaintext
Loading selected image...
Converting and writing logo (1134485 bytes)...
Decoding image...
Resizing 1920x1080 -> 960x540
Encoding BMP...
Writing Logo...
Writing BMP to flash...
Writing Stamp to flash...
Logo written successfully!

Press any key to continue...
```

6. Press `Esc` to go back to the main screen, select `Reset` to reboot the BIOS, then verify the new logo on the HDMI monitor.
