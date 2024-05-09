---
sidebar_position: 5
---

# Hardware interface description

## Physical Photos

<img src="/img/rock5c/rock-5c-overview-new.webp" alt="rock 5c new overview" width="700" />

## Interface description

<table>
  <tr>
    <th>Num</th>
    <th> Interface Name</th>
    <th>Num</th>
    <th> Interface Name</th>
    <th>Num</th>
    <th> Interface Name</th>
    <th>Num</th>
    <th> Interface Name</th>
    <th>Num</th>
    <th> Interface Name</th>
  </tr>
   <tr>
    <th>1</th>
    <th>User Led</th>
    <th>6</th>
    <th>MIPI DSI</th>
    <th>11</th>
    <th>FAN</th>
    <th>16</th>
    <th>PWKEY GND 5V DC IN</th>
    <th>21</th>
    <th>POE Header</th>
  </tr>
  <tr>
    <th>2</th>
    <th>Power Button</th>
    <th>7</th>
    <th>40-PIN GPIO</th>
    <th>12</th>
    <th>Headphone Jack</th>
    <th>17</th>
    <th>USB Type C</th>
    <th>22</th>
    <th>eMMC Socket</th>
  </tr>
  <tr>
    <th>3</th>
    <th>Power Led</th>
    <th>8</th>
    <th>Gigabit Ethernet</th>
    <th>13</th>
    <th>Recovery Key</th>
    <th>18</th>
    <th>Rockchip RK3588S2</th>
    <th>23</th>
    <th>RTC</th>
  </tr>
  <tr>
    <th>4</th>
    <th>Antenna Connector</th>
    <th>9</th>
    <th>USB 3.0</th>
    <th>14</th>
    <th>Maskrom Key</th>
    <th>19</th>
    <th>WIFI 6 && BT 5.4</th>
    <th>24</th>
    <th>MIPI CSI</th>
  </tr>
  <tr>
    <th>5</th>
    <th>FPC Connector</th>
    <th>10</th>
    <th>USB 2.0</th>
    <th>15</th>
    <th>HDMI</th>
    <th>20</th>
    <th>LPDDR4x RAM</th>
    <th>25</th>
    <th>MicroSD Slot</th>
  </tr>
</table>

## Features

<table>
    <tr>
        <td align="center">Model</td>
        <td align="center">ROCK 5C</td>
        <td align="center">ROCK 5C Lite</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td align="center">Rockchip RK3588S2</td>
        <td align="center">Rockchip RK3582</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td align="center">Quad-core Cortex-A76 with up to 2.4 GHz<br/>Quad-core Cortex-A55 at up to 1.8GHz</td>
        <td align="center">Dual-core Cortex-A76 with up to 2.4 GHz<br/>Quad-core Cortex-A55 at up to 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td align="center"> Arm Mali‑G610MC4 </td>
        <td align="center"> N/A </td>
    </tr>
    <tr>
        <td align="center">RAM</td>
        <td align="center">2/4/8/16/32GB 64 Bits LPDDR4x</td>
        <td align="center">1/2/4/8/16GB 64 Bits LPDDR4x</td>
    </tr>
    <tr>
        <td align="center">Storage</td>
        <td align="center" colspan="2"> 1x eMMC Connector <br/> 1x microSD Card <br/> No SPI Flash </td>
    </tr>
    <tr>
        <td align="center">Video Output</td>
        <td align="center" colspan="2">1x HDMI 2.1 supporting up to 8K<br/>1x MIPI DSI supporting up 2K</td>
    </tr>
    <tr>
        <td align="center">Multimedia</td>
        <td align="center">H.265 and VP9 decoder by 8K@60fps<br/>H.264 decoder by 8K@30fps<br/>AV1 decoder by 4K@60fps<br/>H.264 and H.265 encoder by 8K@30fps</td>
        <td align="center">H.264 and H.265 encoder by 4K@60fps</td>
    </tr>
    <tr>
        <td align="center">Ethernet</td>
        <td align="center" colspan="2">Gigabit Ethernet with Power over Ethernet (PoE) support<br/>PoE requires additional optional HAT</td>
    </tr>
    <tr>
        <td align="center">Wireless</td>
        <td align="center" colspan="2">1x WiFi 6 and BT 5.4 with External Antenna Connector</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td align="center" colspan="2">2x USB 2 port<br/>1x USB 3 HOST port, 1x USB3 OTG port</td>
    </tr>
    <tr>
        <td align="center">Camera</td>
        <td align="center" colspan="2">1x4 lane MIPI CSI</td>
    </tr>
    <tr>
        <td align="center">Others</td>
        <td align="center" colspan="2">40 Pin Header</td>
    </tr>
        <tr>
        <td align="center">Power</td>
        <td align="center" colspan="2">Supports 5V</td>
    </tr>
        <tr>
        <td align="center">Size</td>
        <td align="center" colspan="2">86 x 56 mm</td>
    </tr>
</table>

## System block diagram

<img src="/img/rock5c/rock-5c-system-block-diagram.webp" alt="rock 5c system diagram" width="700" />

## Chip block diagram

<Tabs queryString="target">
  <TabItem value="rk3588s2" label="RK3588S2">
  <img src="/img/rock5c/rk3588s2_blockdiagram.webp" alt="rock 5c overview" width="700" />
  </TabItem>
  <TabItem value="rk3582" label="RK3582">
  <img src="/img/rock5c/rk3582_blockdiagram.webp" alt="rock 5c lite overview" width="700" />
  </TabItem>
</Tabs>
