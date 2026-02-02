---
sidebar_position: 8
---

# KVM 使用指南

在 Dragon Q6A 上使能 KVM，并验证 KVM 与 QEMU 是否工作正常。

## 使能 KVM

使用瑞莎系统自带的 Rsetup 工具使能 KVM。

:::tip Rsetup 使用指南

- 选中选项 ： 对应选项会高亮显示
- 确认选择 ： 按 `Enter`
- 取消选择 ： 按 `ESC`
- 切换选项 ： 按 `Up` 、 `Down` 、 `Left` 、 `Right` 控制
- 多选界面 ： 按 `Space` 选择，按 `Enter` 确认选择；选择对应功能后，对应选项框会出现一个 `*` ,表示该选项已启用

:::

在终端命令行运行 `rsetup` 命令启动 Rsetup 工具：

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
rsetup
```

</NewCodeBlock>

在 Rsetup 工具中依次进入 Overlays -> Manage overlays。

1. 通过方向键找到 [ ] Enable KVM virtualization support 选项
2. 按空格出现 [*] Enable KVM virtualization support 说明已选中该功能
3. 按 Enter 确认并保存设置，使能 KVM。
4. 重启系统，使配置生效。

## 验证 KVM

### 验证 KVM 设备节点

在终端运行命令，如果输出 `/dev/kvm`，则说明 KVM 设备节点已创建。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
ls /dev/kvm
```

</NewCodeBlock>

### 配置用户权限

在终端运行命令，将当前用户添加到 kvm 组。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo usermod -aG kvm $USER && newgrp kvm
```

</NewCodeBlock>

### 检查内核日志

通过 `dmesg` 命令查看 KVM 初始化日志。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo dmesg | grep -i kvm
```

</NewCodeBlock>

若输出类似信息，则说明 KVM 已成功初始化。

```
[    0.114874] kvm [1]: nv: 567 coarse grained trap handlers
[    0.115147] kvm [1]: IPA Size Limit: 40 bits
[    0.115181] kvm [1]: GICv3: no GICV resource entry
[    0.115186] kvm [1]: disabling GICv2 emulation
[    0.115221] kvm [1]: GIC system register CPU interface enabled
[    0.115249] kvm [1]: vgic interrupt IRQ9
[    0.115286] kvm [1]: VHE mode initialized successfully
```

## 安装 QEMU

在终端使用命令安装 QEMU。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo apt install qemu-system-arm -y
```

</NewCodeBlock>

## 验证 KVM + QEMU

在系统桌面终端运行以下命令测试 KVM 加速是否可用。

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
qemu-system-aarch64 -machine virt -cpu host -enable-kvm
```

</NewCodeBlock>

若终端没有出现报错且出现 QEMU 的 GUI 界面，说明 KVM 模块正常启用。
