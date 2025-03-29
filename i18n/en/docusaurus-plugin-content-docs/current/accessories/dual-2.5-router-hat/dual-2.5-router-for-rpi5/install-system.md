---
sidebar_position: 5
---

# Operating System Installation

## Prerequisites

- A microSD card (8GB minimum, 16GB or larger recommended)
- A computer with a microSD card reader
- Internet connection to download the necessary software

## Installing Raspberry Pi OS

### Step 1: Download and Install Raspberry Pi Imager

1. Visit the official Raspberry Pi website at [https://www.raspberrypi.com/software/](https://www.raspberrypi.com/software/)
2. Download the Raspberry Pi Imager application appropriate for your computer's operating system (Windows, macOS, or Linux)
3. Install the application following the on-screen instructions
4. Insert your microSD card into your computer's card reader

### Step 2: Write the Operating System to the microSD Card

1. Launch the Raspberry Pi Imager application

   ![Opening Raspberry Pi Imager](/img/accessories/dual-2.5-router-hat/rpi-install-os-1.webp)

2. Click on "Choose Device" and select "Raspberry Pi 5" from the list

   ![Selecting Raspberry Pi 5 device](/img/accessories/dual-2.5-router-hat/rpi-install-os-2.webp)

3. Click on "Choose OS" and select "Raspberry Pi OS (64-bit)" from the recommended options

   > **Note:** The 64-bit version is recommended for optimal performance with the Dual 2.5G Router HAT

   ![Selecting Raspberry Pi OS (64-bit)](/img/accessories/dual-2.5-router-hat/rpi-install-os-3.webp)

4. Click on "Choose Storage" and select your microSD card from the list

   > **Warning:** Be careful to select the correct storage device as all data on the selected device will be erased

   ![Selecting storage device](/img/accessories/dual-2.5-router-hat/rpi-install-os-4.webp)

5. Click on the gear icon (⚙️) to access advanced options

   ![Accessing advanced settings](/img/accessories/dual-2.5-router-hat/rpi-install-os-5.webp)

6. Configure user settings:

   - Set a hostname for your Raspberry Pi (optional)
   - Create a username and password
   - Configure your WiFi network (if needed)

   ![Configuring user settings](/img/accessories/dual-2.5-router-hat/rpi-install-os-6.webp)

7. Enable SSH access (highly recommended for headless setup):

   - Check "Enable SSH"
   - Select "Use password authentication"

   ![Enabling SSH access](/img/accessories/dual-2.5-router-hat/rpi-install-os-7.webp)

8. Click "Save" to confirm your settings, then click "Write" to begin the installation process

   ![Starting the writing process](/img/accessories/dual-2.5-router-hat/rpi-install-os-8.webp)

9. Wait for the process to complete. Once finished, you'll see a confirmation message

   ![Installation complete](/img/accessories/dual-2.5-router-hat/rpi-install-os-9.webp)

## Next Steps

After successfully writing the operating system to the microSD card:

1. Safely eject the microSD card from your computer
2. Insert the microSD card into the microSD card slot on your Raspberry Pi 5
3. Connect the necessary peripherals (keyboard, mouse, monitor) if not using SSH
4. Connect the power supply to boot your Raspberry Pi 5

## Configuring the System for Dual 2.5G Router HAT

After booting your Raspberry Pi 5 with the newly installed operating system, you'll need to ensure the system recognizes and properly configures the Dual 2.5G Router HAT. Please proceed to the [Getting Started](/accessories/dual-2.5-router-hat/dual-2.5-router-for-rpi5/start-use) section for detailed instructions on configuring the network interfaces and testing your setup.
