---
sidebar_position: 2
---

# Quick Start

The purpose of this tutorial is to help you quickly get started with the Dragon Q6A product.

## Product Details

<div style={{textAlign: 'center'}}>
   Dragon Q6A Front Side
   <img src="/img/dragon/q6a/q6a_top.webp" style={{width: '75%', maxWidth: '1200px'}} />
   Dragon Q6A Reverse Side
    <img src="/img/dragon/q6a/q6a_bottom.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

## Prerequisites

You need to prepare the following hardware devices in advance:

- Motherboard: Radxa Dragon Q6A
- System boot media: MicroSD card
- Power adapter: 12V Type-C power adapter (compatible with PD protocol)
- USB serial data cable (optional): For serial debugging and system login
- HDMI cable and monitor (optional): For displaying the system interface and graphical user interface operations

:::tip Recommended accessories

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard 12V Type-C power adapter, recommended current 2A or above
  :::

## Install the System

You can refer to the following tutorials to install the system based on your system boot media and hardware devices:

- [Install the System to a MicroSD Card](./install-system/sd_system)
- [Install the System to a USB Flash Drive](./install-system/udisk_system)
- [Install the System to an NVMe SSD](./install-system/nvme_system)

:::tip System Startup Instructions
By default, the system startup disk is a MicroSD card, which can be booted directly without any additional operations. However, you cannot directly boot the system from a USB flash drive or NVMe SSD.

If you have installed the system on a USB flash drive or NVMe SSD, you need to refer to the [Modify System Startup Disk Boot Options](./install-system/boot_option) tutorial to modify the system startup disk boot options.
:::

## Starting the System

After completing the system installation, insert the MicroSD card into the MicroSD card slot of the Dragon Q6A, then power the Dragon Q6A using a 12V Type-C power adapter to start the system.

① : Insert the MicroSD card

② : Power the Dragon Q6A using a 12V Type-C power adapter

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_boot_system.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

After the system starts up normally, the power indicator light turns green and the status indicator light flashes blue.

## System Information

User Account: ubuntu

User Password: ubuntu

## Logging into the System

This section primarily introduces how to log in to the system using the Dragon Q6A with a USB serial port data cable. For instructions on logging in to the system via the serial port, please refer to the [Serial Port Debugging](../system-config/uart_debug) tutorial.

:::tip
The Dragon Q6A is used in conjunction with a display, and its overall operation is relatively intuitive and simple, so we will not go into further detail here!
:::

## Using the System

### Screen Mode

Screen mode refers to using the Dragon Q6A with a display, which makes overall operation more intuitive and simple!

### Screenless Mode

Screenless mode refers to using the Dragon Q6A without a display, logging into the system via serial port or SSH for operation!
