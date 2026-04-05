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

## 2.USB3 批量传输期间设备断开/重新枚举问题

在使用 Cypress FX3 等 USB3 设备进行高吞吐量批量传输时，可能会遇到设备断开并重新枚举的问题，导致 `LIBUSB_ERROR_NO_DEVICE` 错误。

### 常见症状：
- 设备在批量传输开始后约 1 秒断开连接
- 内核日志显示：`usb 6-1: USB disconnect, device number 3` 后立即出现 `usb 6-1: new SuperSpeed USB device number 4 using xhci-hcd`
- 程序报告 `LIBUSB_ERROR_NO_DEVICE` 错误

### 可能原因：
1. **电源稳定性**：USB3 设备在高速传输时可能超过端口电流限制
2. **USB3 链路电源管理**：U1/U2 状态切换可能导致不稳定
3. **xHCI 驱动/固件问题**：某些内核版本可能存在兼容性问题

### 建议的排查步骤：

#### 1. 检查电源供应：
- 使用高质量的外接电源（5V/4A 或更高）
- 对于高功耗设备，考虑使用带外接电源的 USB3 集线器
- 确保 USB 线缆符合规范且质量良好

#### 2. 调整 USB 电源管理设置：
<NewCodeBlock tip="Linux$" type="host">

```bash
# 禁用 USB 自动挂起
echo 'on' | sudo tee /sys/bus/usb/devices/*/power/control

# 禁用 USB3 链路电源管理
echo '0' | sudo tee /sys/module/usbcore/parameters/autosuspend
```

</NewCodeBlock>

#### 3. 更新系统：
<NewCodeBlock tip="Linux$" type="host">

```bash
sudo apt update
sudo apt upgrade
```

</NewCodeBlock>

#### 4. 检查内核版本：
<NewCodeBlock tip="Linux$" type="host">

```bash
uname -r
# 确保使用最新支持的内核版本
```

</NewCodeBlock>

#### 5. 添加内核启动参数（临时）：
在 `/boot/extlinux/extlinux.conf` 中添加：
```
usbcore.autosuspend=-1 usb-storage.quirks=...
```

#### 6. 收集诊断信息：
<NewCodeBlock tip="Linux$" type="host">

```bash
# 检查 USB 拓扑
lsusb -t

# 监控内核日志
sudo dmesg -w

# 检查特定设备信息
sudo lsusb -v -d 04b4:00f1
```

</NewCodeBlock>

### 如果问题仍然存在：
如果以上步骤无法解决问题，这可能是一个需要进一步调查的技术问题。请提供以下信息以便技术支持：

1. 完整的 `dmesg` 日志
2. `lsusb -t` 和 `lsusb -v` 输出
3. 使用的具体镜像版本和内核版本
4. 复现问题的详细步骤
