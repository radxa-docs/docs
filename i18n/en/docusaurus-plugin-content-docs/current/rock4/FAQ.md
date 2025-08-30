import { Details } from "@site/src/utils/docs";

# Frequently Asked Questions

## The same system can boot on old hardware but runs abnormally on new hardware.

New hardware versions may undergo component updates (such as component replacements due to shortages or discontinuations), which may cause the old system to be incompatible with the new hardware version, leading to abnormal system operation.

We recommend that when changing hardware versions, you reconfigure based on our latest released system to ensure optimal software compatibility.

If you choose not to reconfigure your system with our latest image, you can also perform an online update on the old hardware version using [System Update](os-config/rsetup#system-update) and [Bootloader Update](os-config/rsetup#update-bootloader).
This will also ensure your system includes the latest hardware support. Please note that before upgrading the system, you should fully back up your system (e.g., create a disk image).

:::tip
Older systems do not have `rsetup` pre-installed, in which case the system will not be able to update online. We _strongly recommend_ that you migrate to the latest RadxaOS to receive full product support.

For older systems, if you choose not to migrate to the latest system, we provide some workarounds.

However, if your system already has `rsetup` pre-installed, please use the online update method via rsetup as mentioned above for system upgrades. Using workarounds may cause issues during subsequent online updates.
:::

### Symptoms

Older ROCK 4SE systems run normally on old hardware versions but fail to boot on new hardware version V1.53, with the serial port output ending with "ERR".

- The final serial port output looks similar to:

```
channel 0 training pass!
channel 1 training pass!
change freq to 800MHz 1,0
Channel 0: LPDDR4,800MHz
Col error!!!
Cap error!
Channel 1: LPDDR4,800MHz
Bus Width=32 Col=10 Bank=8 Row=16 CS=1 Die Bus-Width=16 Size=1536MB
no stride
read addr 0x1000000 = 0x20000000
ERR
```

- When your system boots normally, the serial output will show it's using `U-Boot 2017.09`:

```
U-Boot 2017.09-2700-g70b4cfe057 (Jun 05 2021 - 07:28:02 +0000), Build: jenkins-linux-build-release-604

Model: Radxa ROCK Pi 4B
PreSerial: 2
DRAM:  3.9 GiB
```

- Your affected product uses Micron memory.

### Cause

The older version of `U-Boot` does not support Micron memory and cannot complete hardware initialization.

### Affected Versions

The following `U-Boot` versions have been tested by Radxa and confirmed to be incompatible with Micron memory:

- `2017.09-00026-g2431fa34678 (Feb 14 2022 - 21:41:40 +0800)`
- `2017.09-2700-g70b4cfe057 (Jun 05 2021 - 07:28:02 +0000)`

::::caution
This is not a complete list. If you find other affected versions or memory models, please provide feedback via the `Edit this page` link at the bottom.
::::

### Workaround

You can use the following command to update the `U-Boot` memory initialization code in your existing system image or system installation device. This command can also be executed on a normally booted ROCK 4SE.

Please replace the parameter in the last command with the target you want to update.

```bash
curl https://dl.radxa.com/rockpi4/troubleshooting/rock-4ab-uboot-2017-idbloader.tar.gz | tar xzv
sudo ./setup.sh update_idbloader ___/dev/sdX_or_/dev/mmcblkX_or_system.img___
```

## ROCK 4B Memory Size Changes After Reboot When Using Manjaro-ARM-minimal-rockpi4b-22.06.img.xz

### Symptoms

- Taking the 4GB version as an example, the normal serial boot output looks like:

```
U-Boot TPL 2022.04-1 (Apr 21 2022 - 18:07:16)
Channel 0: LPDDR4, 50MHz
BW=32 Col=10 Bk=8 CS0 Row=16/15 CS=1 Die BW=16 Size=2048MB
Channel 1: LPDDR4, 50MHz
BW=32 Col=10 Bk=8 CS0 Row=16/15 CS=1 Die BW=16 Size=2048MB
256B stride
lpddr4_set_rate: change freq to 400000000 mhz 0, 1
lpddr4_set_rate: change freq to 800000000 mhz 1, 0
Trying to boot from BOOTROM
Returning to boot ROM...
```

- When abnormal, the detected memory size in the serial boot output does not match the actual value:

```
U-Boot TPL 2022.04-1 (Apr 21 2022 - 18:07:16)
Channel 0: LPDDR4, 50MHz
BW=32 Col=10 Bk=8 CS0 Row=16/15 CS=1 Die BW=16 Size=2048MB
Channel 1: LPDDR4, 50MHz
BW=32 Col=9 Bk=8 CS0 Row=16/15 CS=1 Die BW=16 Size=768MB
no stride
lpddr4_set_rate: change freq to 400000000 mhz 0, 1
lpddr4_set_rate: change freq to 800000000 mhz 1, 0
Trying to boot from BOOTROM
Returning to boot ROM...
```

- Your affected product uses Micron memory.
- You are using Manjaro image: [`Manjaro-ARM-minimal-rockpi4b-22.06.img.xz`](https://github.com/manjaro-arm/rockpi4b-images/releases/download/22.06/Manjaro-ARM-minimal-rockpi4b-22.06.img.xz)

### Cause

The older version of `U-Boot` does not support Micron memory and cannot complete hardware initialization correctly.

### Affected Versions

The following `U-Boot` version has been tested by Radxa and confirmed to be incompatible with Micron memory:

- `U-Boot 2022.04-1 (Apr 21 2022 - 18:07:16 +0000) Manjaro Linux ARM`

Affected Micron memory has the following markings:

- IPF47 D9XRR

The following Micron memory has not been found to be affected by this issue:

- ISE77 D9WGB

::::caution
This is not a complete list. If you find other affected versions or memory models, please provide feedback via the `Edit this page` link at the bottom.
::::

### Solution

Manjaro is not an officially supported operating system by Radxa. Please contact Manjaro for assistance with updating the bootloader.

When using the officially released Radxa image [`rock-4se_debian_bullseye_kde_b38.img.xz`](https://github.com/radxa-build/rock-4se/releases/download/b38/rock-4se_debian_bullseye_kde_b38.img.xz), the affected memory can be properly recognized and work normally.

### Workaround

::::caution
Manjaro is not an officially supported operating system by Radxa. The following workaround is provided only to verify that the issue you are experiencing is not related to hardware quality. Radxa is not responsible for any issues that may arise from using this workaround in other scenarios.
::::

You can use the following command to update the `U-Boot` memory initialization code in your existing system image or system installation device. This command can also be executed on a normally booted ROCK 4B.

Please replace the parameter in the last command with the target you want to update.

```bash
curl https://dl.radxa.com/rockpi4/troubleshooting/rock-4ab-uboot-2022-manjaro-idbloader.tar.gz | tar xzv
sudo ./setup.sh update_idbloader ___/dev/sdX_or_/dev/mmcblkX_or_system.img___
```
