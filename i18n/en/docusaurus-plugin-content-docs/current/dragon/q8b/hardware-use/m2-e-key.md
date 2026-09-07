---
sidebar_position: 10
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

| Model                      | Type / Chipset    | Wi-Fi    | Bluetooth | Tested Platform | Notes                                                                                                                       |
| -------------------------- | ----------------- | -------- | --------- | --------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Foxconn T99H432.12         | NCM865A (WCN7851) | Wi-Fi 7  | BT 5.4    | Windows / Linux | Bluetooth over UART                                                                                                         |
| Quectel QCNCM865AAMD-865A  | NCM865A (WCN7851) | Wi-Fi 7  | BT 5.4    | Windows / Linux | Bluetooth over UART                                                                                                         |
| Foxconn T99H432.05         | NCM865 (WCN7851)  | Wi-Fi 7  | BT 5.4    | Windows / Linux | Bluetooth over USB                                                                                                          |
| LITE-ON WCBN814A           | NFA765A (QCA2066) | Wi-Fi 6E | BT 5.3    | Windows / Linux | Bluetooth over UART<br/>Bluetooth audio may disconnect unexpectedly after some time of use; we recommend using other models |
| Foxconn T99H294 U98H139.00 | NFA765 (WCN6856)  | Wi-Fi 6E | BT 5.3    | Windows / Linux | Bluetooth over USB                                                                                                          |
| MediaTek MT7921            | MT7921            | Wi-Fi 6  | BT 5.2    | Linux           | Wi-Fi over PCIe; Bluetooth over USB                                                                                         |
| MediaTek MT7922            | MT7922            | Wi-Fi 6E | BT 5.2    | Linux           | Wi-Fi over PCIe; Bluetooth over USB                                                                                         |
| Realtek RTL8852CE          | RTL8852CE         | Wi-Fi 6E | BT 5.3    | Linux           | Wi-Fi over PCIe; Bluetooth over USB                                                                                         |
| Intel BE200                | BE200             | Wi-Fi 7  | BT 5.4    | Linux           | Wi-Fi over PCIe; Bluetooth over USB                                                                                         |
| Intel AX210                | AX210             | Wi-Fi 6E | BT 5.4    | Linux           | Wi-Fi over PCIe; Bluetooth over USB                                                                                         |
| Intel 8260                 | 8260              | Wi-Fi 5  | BT 4.2    | Linux           | Wi-Fi over PCIe; Bluetooth over USB                                                                                         |

:::caution Purchase Notes

- The table above lists the currently verified models. Refer to the "Tested Platform" column for platform support.
- Realtek / Intel series wireless network cards do not have available driver support; please do not purchase them (based only on testing on the Q8B Windows platform).
- MediaTek MT7925 / MT7927 may be supported, but are still under further validation (based only on testing on the Q8B Windows platform).
- If you want to use other models, please contact Radxa technical support to confirm compatibility before purchasing.

:::
