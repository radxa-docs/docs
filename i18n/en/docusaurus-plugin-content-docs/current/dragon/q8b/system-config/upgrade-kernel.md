---
sidebar_position: 11
---

# Upgrade the Kernel Only

This tutorial describes how to upgrade only the kernel, without upgrading the whole system.

## Upgrade the Kernel

If you only want to upgrade the kernel without upgrading the whole system, run the following commands:

<NewCodeBlock tip="radxa@radxa-dragon-q8b$" type="device">

```bash
sudo apt update
sudo apt install linux-image-radxa-dragon-midstream linux-headers-radxa-dragon-midstream
```

</NewCodeBlock>

After the installation is complete, reboot the system to make the new kernel take effect:

<NewCodeBlock tip="radxa@radxa-dragon-q8b$" type="device">

```bash
sudo reboot
```

</NewCodeBlock>

## Verify the Kernel Version

After reboot, you can verify the current kernel version with the following command:

<NewCodeBlock tip="radxa@radxa-dragon-q8b$" type="device">

```bash
uname -r
```

</NewCodeBlock>
