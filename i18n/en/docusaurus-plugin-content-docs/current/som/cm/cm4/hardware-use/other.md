---
sidebar_position: 15
---

# Other Interfaces

The Radxa CM4 IO Board provides multiple functional interfaces, allowing users to choose the features they need.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cm4/other_interface.webp" alt="Other interfaces on Radxa CM4 IO Board" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description                        | No.   | Description                                 | No. | Description          |
| --- | ---------------------------------- | ----- | ------------------------------------------- | --- | -------------------- |
| ①   | Power Header (for shutdown/reboot) | ③     | 14-pin GPIO Interface                       | ⑥   | UFS Module Boot Pins |
| ②   | Power Output (GND / 5V / 12V)      | ④ / ⑤ | Stereo Audio Output (for external speakers) |     |                      |

## Power Header

- Function Pin 1 : Power Button
- Function Pin 2 : GND
- Function Pin 3 : Reset Button

You can connect external buttons:

- Connect Function Pin 1 and Function Pin 2, then press and release to trigger shutdown.
- Connect Function Pin 2 and Function Pin 3, then press and release to trigger reboot.

## Power Output

Provides 12V, 5V, and GND power outputs for powering other devices.

## 14-pin GPIO Interface

<TabItem value="CM4">
     <div className='gpio_style' style={{ overflow :"auto"}} >
| Function2       | Function1 | Pin# | Pin# | Function1  | Function2       |
|-----------------|-----------|:------:|:------:|------------|-----------------|
|                 | GND       | <div className='black'>1</div>    | <div className='green'>2</div>    | RECOVERY   |                 |
|                 | GND       | <div className='black'>3</div>    | <div className='green'>4</div>    | EEPROM_nWP |                 |
| PDM1_CLK1_M1    | GPIO4_B0  | <div className='green'>5</div>    | <div className='green'>6</div>    | GPIO4_B2   | PDM1_SDI1_M1    |
|                 | GND       | <div className='black'>7</div>    | <div className='green'>8</div>    | GPIO3_D4   | UART5_RX_M0_1V8 |
| UART5_TX_M0_1V8 | GPIO3_D5  | <div className='green'>9</div>    | <div className='black'>10</div>    | GND        |                 |
| PDM1_SDI2_M1    | GPIO4_B1  | <div className='green'>11</div>    | <div className='black'>12</div>    | GND        |                 |
|                 | GND       | <div className='black'>13</div>    | <div className='green'>14</div>    | MASKROM    |                 |
     </div>
</TabItem>

## Stereo Audio Output

Stereo audio output interface for connecting external speakers.

## UFS Module Boot Pins

Short the pins using a jumper cap or DuPont wires to use the UFS module as a system boot medium.

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Resource Download](../download.md) page.
