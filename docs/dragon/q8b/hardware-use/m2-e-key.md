---
sidebar_position: 9
---

# M.2 E Key 2230 卡槽

瑞莎 Dragon Q8B 板载 1 个 M.2 E Key 2230 卡槽，可安装 M.2 2230 尺寸的 E Key 无线网卡模组（Wi-Fi + 蓝牙）。

:::tip 接口位置
可以参考 [硬件信息](./hardware-info) 教程找到对应硬件接口位置（M.2 E Key 插槽）。
:::

## 硬件连接

1. 断开主板电源。
2. 将 M.2 E Key 2230 无线网卡模组的金手指以约 30° 斜角插入卡槽。
3. 按下模组另一端，并用螺丝固定。
4. 接通电源并启动系统。

系统启动后，可以进入系统设置连接 Wi-Fi，或使用蓝牙进行配对。

## 支持的无线网卡

以下型号已在瑞莎 Dragon Q8B 上完成验证，可正常使用：

| 型号 | 类型 / 芯片 | Wi-Fi | 蓝牙 | 备注 |
| --- | --- | --- | --- | --- |
| Foxconn T99H432.12 | NCM865A (WCN7851) | Wi-Fi 7 | BT 5.4 | 蓝牙通过 UART 连接 |
| Quectel QCNCM865AAMD-865A | NCM865A (WCN7851) | Wi-Fi 7 | BT 5.4 | 蓝牙通过 UART 连接 |
| Foxconn T99H432.05 | NCM865 (WCN7851) | Wi-Fi 7 | BT 5.4 | 蓝牙通过 USB 连接 |
| LITE-ON WCBN814A | NFA765A (QCA2066) | Wi-Fi 6E | BT 5.3 | 蓝牙通过 UART 连接<br/>蓝牙音频使用一段时间后可能意外断开，建议使用其他型号 |
| Foxconn T99H294 U98H139.00 | NFA765 (WCN6856) | Wi-Fi 6E | BT 5.3 | 蓝牙通过 USB 连接 |

:::caution 购买提示
- 上表为当前已验证支持的型号列表。
- Realtek / Intel 全系无线网卡暂无可用驱动支持，请勿选购。
- MediaTek MT7925 / MT7927 可能支持，尚待进一步验证。
- 如需使用其他型号，建议先联系瑞莎技术支持确认兼容性。
:::
