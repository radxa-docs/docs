---
sidebar_position: 8
---

# KVM User Guide

Enable KVM on the Dragon Q6A and verify that KVM and QEMU work properly.

## Enable KVM

Use the built-in `rsetup` tool in Radxa OS to enable KVM.

:::tip rsetup usage

- Select an item: the current item is highlighted.
- Confirm: press `Enter`.
- Cancel/back: press `ESC`.
- Navigate: use `Up`, `Down`, `Left`, `Right`.
- Multi-select pages: press `Space` to toggle, then `Enter` to confirm. A `*` indicates the option is enabled.

:::

Start `rsetup` in a terminal:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
rsetup
```

</NewCodeBlock>

In `rsetup`, go to: `Overlays -> Manage overlays`.

1. Use the arrow keys to find `[ ] Enable KVM virtualization support`.
2. Press `Space` until it becomes `[*] Enable KVM virtualization support`.
3. Press `Enter` to confirm and save.
4. Reboot the system to apply the changes.

## Verify KVM

### Check the KVM device node

Run the following command. If it prints `/dev/kvm`, the KVM device node has been created.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
ls /dev/kvm
```

</NewCodeBlock>

### Configure user permissions

Add the current user to the `kvm` group:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo usermod -aG kvm $USER && newgrp kvm
```

</NewCodeBlock>

### Check kernel logs

View KVM initialization logs using `dmesg`:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo dmesg | grep -i kvm
```

</NewCodeBlock>

If you see output like the following, KVM has been initialized successfully:

```text
[    0.114874] kvm [1]: nv: 567 coarse grained trap handlers
[    0.115147] kvm [1]: IPA Size Limit: 40 bits
[    0.115181] kvm [1]: GICv3: no GICV resource entry
[    0.115186] kvm [1]: disabling GICv2 emulation
[    0.115221] kvm [1]: GIC system register CPU interface enabled
[    0.115249] kvm [1]: vgic interrupt IRQ9
[    0.115286] kvm [1]: VHE mode initialized successfully
```

## Install QEMU

Install QEMU:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo apt update
sudo apt install -y qemu-system-arm
```

</NewCodeBlock>

## Verify KVM + QEMU

Run the following command in a desktop terminal to test whether KVM acceleration is available:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
qemu-system-aarch64 -machine virt -cpu host -enable-kvm
```

</NewCodeBlock>

If there are no errors and a QEMU window appears, KVM is enabled and working.
