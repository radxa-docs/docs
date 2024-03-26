---
sidebar_position: 3
---

# Displays

The following displays are currently supported:

<table>
  <tr>
    <th>Screen Name</th>
    <th>Resolution</th>
  </tr>
  <tr>
    <td>ALLNET 5 inch DSI Display</td>
    <td>800 ×3(RGB) ×480 pixel</td>
  </tr>
  <tr>
    <td>Radxa Display 8 HD</td>
    <td>1280x800 pixel</td>
  </tr>
  <tr>
    <td>Radxa Display 10HD</td>
    <td>800x1280 pixel</td>
  </tr>
  <tr>
    <td>Radxa Display 10FHD</td>
    <td>1200x1920 pixel </td>
  </tr>
  <tr>
    <td>Raspberry Pi 7 inch Touchscreen</td>
    <td>800 x 480 pixels</td>
  </tr>
</table>

## Configuration

The following is an example of a radxa 8hd display:

<!-- ![Display Installation-01](/img/rock5c/accessories/display/rock5c-display-8hd-FPC.webp)
![Display Installation-02](/img/rock5c/accessories/display/rock5c-display-8hd-connected.webp) -->

- Prepare a Radxa Display 8HD or Radxa Display 10HD and connect it to the ROCK 5C via the FPC cable.

- Open the Kconsole terminal via the Application Launcher in the lower left corner and run the `rsetup` command.

```bash
radxa@rock-5c:~$ rsetup
```

- Via [Device Tree Configuration](../os-config/rsetup#overlays) to enable Overlay for the Radxa 8HD touchscreen.

:::caution [note]

1. Please enable the `[] Enable Radxa Display 8 HD` item Overlay.
2. Quit and reboot after enabling the `[*] Enable Radxa Display 8 HD` successfully for the configuration to take effect.

:::

## Purchase Links

- [Radxa 8HD Display](https://radxa.com/products/accessories/display-8hd)
- [Radxa 10FHD Display](https://radxa.com/products/accessories/display-10fhd)
