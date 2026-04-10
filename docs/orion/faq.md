---
sidebar_position: 200
---

# 常见问题

## 1.为什么我的 O6 / O6N 开机后内存占用很大？

系统默认会为 NPU 预留一部分内存，用于保障 NPU 正常工作，因此可用内存看起来偏少。

### 临时禁用 NPU（重启后恢复）：

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo rmmod aipu
```

</NewCodeBlock>

### 永久禁用 NPU（blacklist）：

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo vim /etc/modprobe.d/blacklist-aipu.conf
```

</NewCodeBlock>

添加：

<NewCodeBlock tip="Linux$" type="host">

```bash
blacklist aipu
```

</NewCodeBlock>

保存并重启：

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo reboot
```

</NewCodeBlock>

说明：禁用后将释放 NPU 预留内存，如需恢复，删除 blacklist 配置并重启即可。

## 2.Orion O6 USB3 批量传输导致设备断开/重新枚举问题

在使用 Cypress FX3（VID:PID 04b4:00f1）等 USB3 设备进行高吞吐量批量传输时，Orion O6 可能出现设备断开并重新枚举的问题。

### 症状
- 设备在持续高吞吐量 USB 批量传输期间断开连接并重新枚举
- 错误信息：`LIBUSB_ERROR_NO_DEVICE`
- dmesg 显示：`usb 6-1: USB disconnect, device number 3` → `usb 6-1: new SuperSpeed USB device number 4 using xhci-hcd`

### 可能原因
1. **电源供应不足**：USB3.2 Type-A 端口电流限制为 1A，高功耗设备可能超出此限制
2. **线缆质量**：USB3 线缆质量不佳或长度过长可能导致信号完整性问题
3. **xHCI 驱动/固件问题**：xHCI 控制器在高负载下可能出现稳定性问题
4. **USB3 链路管理**：USB3 链路电源管理（U1/U2 状态）可能导致不稳定

### 排查步骤
1. **检查电源**：
   - 使用专用 12V/3A 或更高功率的电源适配器
   - 避免使用 USB 集线器为高功耗设备供电
2. **更换线缆和端口**：
   - 使用高质量、短距离的 USB3 线缆
   - 尝试不同的 USB3.2 Type-A 端口
3. **检查系统日志**：
   ```bash
   dmesg | grep -i "usb\|xhci"
   journalctl -k | grep -i "usb\|xhci"
   ```
4. **禁用 USB 自动挂起和链路电源管理**：
   ```bash
   # 临时禁用 USB 自动挂起
   for dev in /sys/bus/usb/devices/*/power/control; do
     echo on > "$dev" 2>/dev/null || true
   done
   
   # 禁用 USB3 链路电源管理（需在启动参数中添加）
   # 在 /boot/extlinux/extlinux.conf 的 append 行添加：
   # usbcore.autosuspend=-1 usbcore.quirks=vid:pid:u
   ```

### 解决方案
1. **使用外接供电的 USB3 集线器**：为高功耗 USB3 设备提供独立电源
2. **更新 BIOS 和内核**：检查是否有可用的 BIOS 更新或内核补丁
3. **调整传输参数**：降低批量传输的数据速率或使用较小的数据包
4. **联系技术支持**：如果问题持续存在，请联系 Radxa 技术支持并提供详细的系统日志

### 已知兼容性问题
- Cypress FX3（VID:PID 04b4:00f1）在高吞吐量批量传输时可能出现此问题
- 某些 USB3 存储设备在持续写入时可能触发断开/重新枚举

**注意**：此问题可能与特定硬件组合相关，建议在购买 USB3 外设前验证其与 Orion O6 的兼容性。
