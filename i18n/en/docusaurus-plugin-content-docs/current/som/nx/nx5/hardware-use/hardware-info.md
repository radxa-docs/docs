---
sidebar_position: 1
---

# Hardware Information

## Chip Block Diagram

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/rk3588s_block_diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Interface Description

<Tabs queryString="board interface">

<TabItem value="Radxa NX5">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description     | No. | Description      | No. | Description  |
| :-: | :-------------- | :-: | :--------------- | :-: | :----------- |
|  1  | LPDDR4X         |  2  | Rockchip RK3588S |  3  | Onboard eMMC |
|  4  | 260-pin SO-DIMM |  5  | SPI Flash        |     |              |

</TabItem>

<TabItem value="Radxa NX5 IO Board">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-io-board-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description               | No. | Description                            | No. | Description                  |
| :-: | :------------------------ | :-: | :------------------------------------- | :-: | :--------------------------- |
|  1  | 2x USB 3.1 Gen1 Type-A    |  2  | Top: DP output<br/>Bottom: HDMI output |  3  | DC5525 power jack (5V input) |
|  4  | Fan header                |  5  | MIPI camera interface                  |  6  | MIPI camera interface        |
|  7  | Power button              |  8  | Maskrom button                         |  9  | microSD card slot            |
| 10  | M.2 E Key 2230 slot       | 11  | 40-pin GPIO header                     | 12  | 260-pin SO-DIMM slot         |
| 13  | micro USB interface (OTG) | 14  | Gigabit Ethernet port                  | 15  | 2x USB 3.1 Gen1 Type-A       |

</TabItem>

<TabItem value="Radxa NX5 Development Kit">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-devkit-interface.webp" alt="Radxa NX5 Development Kit interface diagram" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description        | No. | Description |
| :-: | :----------------- | :-: | :---------- |
|  1  | Radxa NX5 IO Board |  2  | Radxa NX5   |

</TabItem>

</Tabs>

## LED Indicators

- Radxa NX5

The Radxa NX5 has one system status indicator LED. A solid green light indicates normal power supply, and blinking green indicates the system has booted normally.

- Radxa NX5 IO Board

The Radxa NX5 IO Board has a power indicator LED and a system status indicator LED. A solid green power indicator LED indicates normal power supply, and blinking blue status indicator LED indicates the system has booted normally.
