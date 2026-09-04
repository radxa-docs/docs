---
sidebar_position: 9
---

# M.2 E Key 2230 Slot

The Radxa Dragon Q8B has one onboard M.2 E Key 2230 slot, which can be used to install M.2 2230 E Key wireless network card modules (Wi-Fi + Bluetooth).

:::tip Interface Location
You can refer to the [Hardware Information](./hardware-info) guide to locate the corresponding hardware interface (M.2 E Key slot).
:::

## Hardware Connection

1. Disconnect the power supply from the board.
2. Insert the gold fingers of the M.2 E Key 2230 wireless network card module into the slot at an angle of about 30°.
3. Press down the other end of the module and secure it with a screw.
4. Connect the power supply and boot the system.

After the system boots, you can connect to Wi-Fi in the system settings, or use Bluetooth for pairing.

## Supported Wireless Network Cards

The following models have been verified on the Radxa Dragon Q8B:

| Model | Type / Chipset | Wi-Fi | Bluetooth | Notes |
| --- | --- | --- | --- | --- |
| Foxconn T99H432.12 | NCM865A (WCN7851) | Wi-Fi 7 | BT 5.4 | Bluetooth over UART |
| Quectel QCNCM865AAMD-865A | NCM865A (WCN7851) | Wi-Fi 7 | BT 5.4 | Bluetooth over UART |
| Foxconn T99H432.05 | NCM865 (WCN7851) | Wi-Fi 7 | BT 5.4 | Bluetooth over USB |
| LITE-ON WCBN814A | NFA765A (QCA2066) | Wi-Fi 6E | BT 5.3 | Bluetooth over UART<br/>Bluetooth audio may disconnect unexpectedly after some time of use; we recommend using other models |
| Foxconn T99H294 U98H139.00 | NFA765 (WCN6856) | Wi-Fi 6E | BT 5.3 | Bluetooth over USB |

:::caution Purchase Notes
- The table above is the list of currently verified supported models.
- Realtek / Intel series wireless network cards do not have available driver support; please do not purchase them.
- MediaTek MT7925 / MT7927 may be supported, but are still under further validation.
- If you want to use other models, please contact Radxa technical support to confirm compatibility before purchasing.
:::
