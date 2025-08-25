---
sidebar_position: 4
---

# Assembly Guide

## Safety Precautions

⚠️ **IMPORTANT: Before beginning assembly, ensure that your Raspberry Pi 5 is powered off and disconnected from any power source.**

Please follow the steps below carefully for proper assembly.

## Installing Copper Pillars

### On the Raspberry Pi 5

1. Locate the mounting holes on your Raspberry Pi 5
2. Install the copper pillars in the positions shown in the following images:
   - Use **M2.5×5+3 copper pillars** for the inner mounting holes
   - Use **M2.5×20 copper pillars** for the outer mounting holes

![Installing copper pillars on Raspberry Pi 5 - Step 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-1.webp)
![Installing copper pillars on Raspberry Pi 5 - Step 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-2.webp)

### On the Radxa Dual 2.5G Router HAT

1. Locate the mounting holes on the Radxa Dual 2.5G Router HAT
2. Install the copper pillars using:
   - **M2×8.5 copper pillars**
   - **M2×4×5 screws**

![Installing copper pillars on Router HAT - Step 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-3.webp)
![Installing copper pillars on Router HAT - Step 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-4.webp)

## Installing the FPC Cable

1. Locate the FPC connector on the Raspberry Pi 5
2. Carefully insert the FPC adapter cable into the FPC connector on the Raspberry Pi 5
3. Connect the other end to the IPEX connector on the Radxa Dual 2.5G Router HAT

⚠️ **IMPORTANT: When installing the FPC adapter cable into the FPC connector on the Raspberry Pi 5, ensure that the black side of the FPC cable faces outward.**

![Installing FPC cable - Step 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-5.webp)
![Installing FPC cable - Step 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-6.webp)

## Connecting the HAT to Raspberry Pi 5

1. Carefully align the 40-pin header on the Radxa Dual 2.5G Router HAT with the 40-pin GPIO header on the Raspberry Pi 5
2. Gently press down to connect the two boards together

![Connecting the boards together](/img/accessories/dual-2.5-router-hat/rpi-assemble-7.webp)

3. After connecting, secure the boards using **M2.5×4×4 screws** in the positions shown in the following images:

![Securing the boards - Step 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-8.webp)
![Securing the boards - Step 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-9.webp)

## Installing the Heatsink

1. Locate the Asmedia PCIe switch chip on the Radxa Dual 2.5G Router HAT
2. Remove the protective film from the thermal pad on the bottom of the heatsink
3. Carefully align and attach the heatsink to the position shown in the following images:

![Heatsink installation - Step 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-b.webp)
![Heatsink installation - Step 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-a.webp)

⚠️ **NOTE: The heatsink is essential for proper thermal management. Do not operate the HAT without the heatsink installed.**

## Installing the SSD

1. Locate the M.2 M-Key slot on the Radxa Dual 2.5G Router HAT
2. Insert your M.2 NVMe SSD at a 30-degree angle into the slot
3. Gently press down the SSD and secure it with **M2×4×5 screws** as shown:

![SSD installation - Step 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-10.webp)
![SSD installation - Step 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-11.webp)

⚠️ **NOTE: Ensure the SSD is compatible with the M.2 M-Key interface and is properly seated before securing with screws.**

## Using the FPC Expansion Interface

The Radxa Dual 2.5G Router HAT includes an FPC interface that allows for additional PCIe expansion. Below is an example using the MicroSnow PCIe to M.2 MINI adapter board.

### Required Components

- MicroSnow PCIe to M.2 MINI adapter board
- FPC cable
- M.2 SSD (MINI size)

![MicroSnow PCIe adapter](/img/accessories/dual-2.5-router-hat/rpi-assemble-12.webp)

### Installation Steps

1. Locate the FPC interface on the Radxa Dual 2.5G Router HAT
2. Carefully connect one end of the FPC cable to this interface as shown:

![Connecting FPC to Router HAT](/img/accessories/dual-2.5-router-hat/rpi-assemble-13.webp)

3. Connect the other end of the FPC cable to the MicroSnow PCIe to M.2 MINI adapter board:

![Connecting FPC to adapter board](/img/accessories/dual-2.5-router-hat/rpi-assemble-14.webp)

4. Insert an M.2 SSD into the MicroSnow adapter board and secure it:

![Installing SSD on adapter board](/img/accessories/dual-2.5-router-hat/rpi-assemble-15.webp)

⚠️ **NOTE: The FPC interface shares PCIe lanes with the onboard M.2 slot. Performance may be affected when both are in use simultaneously.**

## Final Steps

1. Double-check all connections and ensure all screws are properly tightened
2. Connect a 12V power supply to the DC jack on the Radxa Dual 2.5G Router HAT
3. Power on your Raspberry Pi 5

Your Radxa Dual 2.5G Router HAT is now ready to use!
