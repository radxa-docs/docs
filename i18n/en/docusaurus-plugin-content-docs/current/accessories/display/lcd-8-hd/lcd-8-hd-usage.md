---
sidebar_position: 6
---

# Radxa Display 8 HD Usage

## Introduction

[Radxa Display 8 HD](lcd-8-hd-product) now supports the following radxa products:

| Applicable to products | FPC cable types            | Photos                                        |
| ---------------------- | -------------------------- | --------------------------------------------- |
| 4C+/5A/5B              | 39 pin to 40 pin FPC cable | ![AC012](/img/accessories/display/ac013.webp) |
| 3A/3C/4SE              | 15 pin to 40 pin FPC cable | ![AC013](/img/accessories/display/ac012.webp) |

The 15-pin to 40-pin FPC cable has an additional 7-pin holder that needs to be connected as defined below:

![AC012 Pin Definition](/img/accessories/display/ac012-pin-definition.webp)

## Tutorials

<Tabs queryString="mode">
<TabItem value="39pin" label="4C+/5A/5B">

### Preparations

- ROCK 4C+/5A/5B SBC

:::note
The ROCK 5A is used here as a demonstration, and other boards operate in a similar way.
:::

- Radxa Display 8 HD
- 39 pin to 40 pin FPC cable
- Power supply

:::tip
Recommended [Radxa PD 30W Adapter](../../power/pd_30w).
:::

- Storage media with the latest official software of the corresponding product.
- USB to TTL serial cable or HDMI monitor and cable.

### Procedures

1. Install the system disc storage media on the SBC

2. Connect the SBC and the display panel via the FPC cable.
   The 40 pin terminal is connected to the display panel: lift up the black tab on the FPC connector, insert the FPC cable into the connector, and press the black tab to secure the FPC cable.
   ![Radxa Display 8 HD](/img/accessories/display/8hd-connect-fpc.webp)
   To connect the 39-pin end to the product's DSI connector: swivel up the black tab on the FPC connector, insert the FPC cable into the connector, and press down on the black tab to secure the FPC cable.
   ![ROCK 5A-Radxa Display 8 HD](/img/accessories/rock5a-connect-fpc.webp)

3. Connect the monitor or USB serial port debugging, power into the system

4. Enable the overlay option of `Radxa Display 8 HD' via the terminal, see Device Tree Settings.
<!-- [Device Tree Settings](/radxa-os/rsetup/devicetree) for details. -->

5. Reboot the SBC to apply overlay and the display will output a screen.

</TabItem>
<TabItem value="15pin" label="3A/3C/4SE">

### Ppreparations

- ROCK 3A/3C/4SE SBC

:::note
The ROCK 3C is used here as a demonstration, and other products operate in a similar manner.
:::

- Radxa Display 8 HD
- 15 pin to 40 pin FPC cable
- Power supply

:::tip
Recommended [Radxa PD 30W Adapter](../../power/pd_30w).
:::

- Storage media with the latest official software of the corresponding product.
- USB to TTL serial cable or HDMI monitor and cable.

### Procedures

1. Install the system disc storage media on the SBC

2. Connect the SBC and the display panel via the FPC cable.
   The 40 pin terminal is connected to the display panel: pull up the black module of the FPC connector on SBC, insert the FPC cable into the slot, and then press the black module to fix the FPC cable.
   ![Radxa Display 8 HD](/img/accessories/display/8hd-connect-fpc.webp)

The 15 pin terminal is connected to the DSI connector on the SBC:
Step 1: lift up the white tab on the FPC connector
Step 2: Cable Gold Finger Back to White Snap Insert Connector
Step 3: Press the snap down firmly to fix the wires
![FPC 15 Pin Connecting](/img/accessories/display/fpc-15-pin-connecting.webp)

3. The pins are connected to the GPIO socket of the SBC through the Dupont cable as follows:

<Tabs queryString="model">
<TabItem value="3c" label="ROCK 3C">
<div className='gpio_style'>

| FPC cable header pin |       |            SBC GPIO pin             |
| :------------------: | :---: | :---------------------------------: |
|        VCC_5V        | \<--> |  <div className='red'>+5.0V</div>   |
|         GND          | \<--> |  <div className='black'>GND</div>   |
|         PWM          | \<--> |        PWM14_M0(GPIO Pin 7)         |
|        TP-RST        | \<--> |        GPIO3_B2(GPIO Pin 18)        |
|        YP-INT        | \<--> |        GPIO3_B1(GPIO Pin 16)        |
|       LCD-RST        | \<--> | <div className='yellow'>+3.3V</div> |
|         GINT         | \<--> |                None                 |

The physical connection diagram is referenced below:

![3C FPC Connected](/img/accessories/display/3c-fpc-connected.webp)

</div>
</TabItem>
<TabItem value="3a" label="ROCK 3A">
<div className='gpio_style'>

| FPC cable header pin |       |            SBC GPIO pin             |
| :------------------: | :---: | :---------------------------------: |
|        VCC_5V        | \<--> |  <div className='red'>+5.0V</div>   |
|         GND          | \<--> |  <div className='black'>GND</div>   |
|         PWM          | \<--> |        PWM14_M0(GPIO Pin 11)        |
|        TP-RST        | \<--> |        GPIO3_B2(GPIO Pin 18)        |
|        YP-INT        | \<--> |        GPIO0_B6(GPIO Pin 16)        |
|       LCD-RST        | \<--> | <div className='yellow'>+3.3V</div> |
|         GINT         | \<--> |                None                 |

The physical connection diagram is referenced below:

![3A FPC Connected](/img/accessories/display/3a-fpc-connected.webp)

</div>
</TabItem>
<TabItem value="4se" label="ROCK 4SE">
<div className='gpio_style'>

| FPC cable header pin |       |            SBC GPIO pin             |
| :------------------: | :---: | :---------------------------------: |
|        VCC_5V        | \<--> |  <div className='red'>+5.0V</div>   |
|         GND          | \<--> |  <div className='black'>GND</div>   |
|         PWM          | \<--> |          PWM1(GPIO Pin 13)          |
|        TP-RST        | \<--> |        GPIO4_D2(GPIO Pin 16)        |
|        YP-INT        | \<--> |        GPIO4_D4(GPIO Pin 18)        |
|       LCD-RST        | \<--> | <div className='yellow'>+3.3V</div> |
|         GINT         | \<--> |                None                 |

The physical connection diagram is referenced below:

![4SE FPC Connected](/img/accessories/display/4se-fpc-connected.webp)

</div>
</TabItem>
</Tabs>

4. Connect the monitor or USB serial port debugging, power into the system

5. Enable the overlay option of `Radxa Display 8 HD' via the terminal, see Device Tree Settings.
<!-- [Device Tree Settings](/radxa-os/rsetup/devicetree) for details. -->

6. Reboot the SBC to apply overlay and the display will output a screen.

</TabItem>
</Tabs>
