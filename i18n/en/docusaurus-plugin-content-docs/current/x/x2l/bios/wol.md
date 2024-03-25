---
sidebar_position: 20
---

# Wake on LAN

## Turn on the WOL function

** Default Wake On LAN (WOL) Functionality Enabled in the BIOS **

- Power on the system and press the DEL key to access the BIOS settings.
- Navigate to Chipset --> South Cluster Configuration --> Miscellaneous Configuration.
- Verify that the Wake On LAN option is in the "enabled" state.

![WOL Setting 01](/img/x/x2l/wol-setting-01.webp)

## WOL Functionality Usage

** Using Windows System as an Example **

### Enabling WOL Function

- Access the Windows system and open the Device Manager.
- Locate the network card device, Realtek PCIe Gbe Family Controller.
- Open the properties and navigate to the Power Management page.
- Check the option "Allow this device to wake the computer."

![WOL Setting 02](/img/x/x2l/wol-setting-02.webp)

### Recording Network Card MAC Address

- Connect Radxa X2L to the local network using an Ethernet cable.
- Open Windows Settings and select Network & Internet.
- Access the Properties interface, and at the bottom, locate the Physical Address (MAC).
- Take note of the network card's MAC address (e.g., 00-E0-4C-06-00-2E) while maintaining the network connection.
- Power off Radxa X2L; note that Radxa X2L's power should remain connected in this step.

![WOL Setting 03](/img/x/x2l/wol-setting-03.webp)

### LAN Wake-Up

** Using [Wake On LAN](https://apps.microsoft.com/detail/9WZDNCRDFSHB?activetab=pivot%3Aoverviewtab&hl=en-us&gl=US) Software for Wake-Up**

- Employ any other terminal device (Windows PC) within the same local network to send a network wake-up magic packet (multiple methods available; using Microsoft's WOL software as an example).
- Install the Wake On LAN software.
- Open the Wake On LAN software, input any Device Name for identification (for convenience), enter the previously recorded MAC address of Radxa X2L's network card, and click "Wake."
- At this point, Radxa X2L will be awakened from a powered-off state.

![WOL Setting 04](/img/x/x2l/wol-setting-04.webp)
