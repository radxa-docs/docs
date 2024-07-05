---
sidebar_position: 8
---

import DISPLAY from "../../../../common/accessories/\_display-usage.mdx";

# MIPI DSI Interface

## Interface differences

- The ROCK 5B has one four-lane MIPI DSI Display connector
- The ROCK 5B+ is equipped with one four-channel MIPI DSI connector

## Support List

<Tabs queryString="versions">
    <TabItem value="ROCK 5B">
      <table>
        <tr>
          <th>Screen Name</th>
          <th>Resolution</th>
        </tr>
        <tr>
          <td>ALLNET 5 inch DSI Display</td>
          <td>800 ×3(RGB) ×480 pixels</td>
        </tr>
        <tr>
          <td>Radxa Display 8 HD</td>
          <td>1280x800 pixels</td>
        </tr>
        <tr>
          <td>Radxa Display 10FHD</td>
          <td>1200x1920 pixels </td>
        </tr>
        <tr>
          <td>Raspberry Pi 7 inch Touchscreen</td>
          <td>800 x 480 pixels</td>
        </tr>
      </table>
    </TabItem>
    <TabItem value="ROCK 5B+">
      <table>
        <tr>
          <th>Screen Name</th>
          <th>Resolution</th>
        </tr>
        <tr>
          <td>Radxa Display 8 HD</td>
          <td>1280x800 pixels</td>
        </tr>
        <tr>
          <td>Radxa Display 10HD</td>
          <td>1200x1920 pixels </td>
        </tr>
        <tr>
          <td>Radxa Display 10FHD</td>
          <td>1200x1920 pixels </td>
        </tr>
      </table>
    </TabItem>
</Tabs>

## Accessory Usage

:::tip

Only these two are given as examples. Apart from possible differences in wiring and overlay, the operational steps for other screens are similar.

:::

### Radxa 8 inch HD Display

<DISPLAY product="ROCK 5B" display_connection_img="/img/rock5b/rock5b-display-8hd-connected.webp" model="rock-5b" rsetup_path="../../radxa-os/rsetup#overlays" display_name="Radxa 8 inch HD Display" overlays_title="Enable Radxa Display 8HD" />

### Raspberry Pi 7" touchscreen display

<DISPLAY product="ROCK 5B+" display_connection_img="/img/rock5b/rock5bp-rpi-7inch-display.webp" model="rock-5b" rsetup_path="../../radxa-os/rsetup#overlays" display_name="Raspberry Pi 7 inch touchscreen display" overlays_title="Enable Raspberry Pi 7-inch Touchscreen" />
