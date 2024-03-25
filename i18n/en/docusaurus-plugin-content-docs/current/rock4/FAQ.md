# FAQ

### The same system can start on old hardware but runs abnormally on new hardware.

Since the new hardware version may do some material updates (such as material replacement due to material shortages or production shutdowns), the old system may not be compatible with the new hardware version, causing the system to run abnormally.

We recommend that you reconfigure your system based on our latest release when changing hardware versions to ensure optimal software compatibility.

If you don't reconfigure your system, you can perform a [system update](os-config/rsetup#system-update) and a [bootloader update](os-config/rsetup#update-bootloader).
This also ensures that your system contains the latest hardware support.Please note that you'b better perform a full backup of your system (e.g., generating a disk image)
before system migration.

:::tip
If old systems do not have `rsetup` pre-installed, the system will not be able to be updated online. We _strongly recommend_ that you migrate to the latest RadxaOS to obtain complete product support.

For old systems, if you do not migrate to the latest system, we will provide some bypass methods.

However, if your system has been pre-installed with `rsetup`, please use the online update method through rsetup mentioned above to upgrade the system. Using a bypass method may cause exceptions during the subsequent online upgrade process!
:::

<details><summary>The ROCK 4SE old system cannot boot normally on the new hardware version V1.53, and the final output of the serial port is "ERR"</summary>

### Phenomenon

- The serial console's final output is similar to the following:

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

- Your system indicates it is using `U-Boot 2017.09` on the serial console during a successful boot:

```
U-Boot 2017.09-2700-g70b4cfe057 (Jun 05 2021 - 07:28:02 +0000), Build: jenkins-linux-build-release-604

Model: Radxa ROCK Pi 4B
PreSerial: 2
DRAM:  3.9 GiB
```

- Your affected product uses Micron memory.

### Cause

Older versions of `U-Boot` do not support Micron memory and cannot initialize the hardware.

### Affected versions

The following `U-Boot` versions have been tested by Radxa and confirmed to be incompatible with Micron memory:

- `2017.09-00026-g2431fa34678 (Feb 14 2022 - 21:41:40 +0800)`
- `2017.09-2700-g70b4cfe057 (Jun 05 2021 - 07:28:02 +0000)`

::::caution
This is a non-exhaustive list. If you find another affected version or memory model, please send it to us via the `Edit this page` at the bottom.
::::

### Workaround

You can update the `U-Boot` memory initialization code within your existing system image or system installation device with the following command. This command can also be executed within ROCK 4SE after it is booted normally.

Replace the parameter used by the last command to the storage target you want to update.

```bash
curl https://dl.radxa.com/rockpi4/troubleshooting/rock-4ab-uboot-2017-idbloader.tar.gz | tar xzv
sudo ./setup.sh update_idbloader ___/dev/sdX_or_/dev/mmcblkX_or_system.img___
```

</details>

<details><summary>ROCK 4B when using Manjaro-ARM-minimal-rockpi4b-22.06.img.xz may show different total memory available after reboot</summary>

### Phenomenon

- Taking the 4GB variant as an example, the serial port boot output looks similar to the following when normal:

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

- When memory size is abnormal, the memory size detected in the serial port boot output does not match the actual value of the hardware:

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
- The Manjaro image you are using is: [`Manjaro-ARM-minimal-rockpi4b-22.06.img.xz`](https://github.com/manjaro-arm/rockpi4b-images/releases/download/22.06/Manjaro-ARM-minimal-rockpi4b-22.06.img.xz)

### Cause

Older versions of `U-Boot` do not support Micron memory and do not initialize the hardware correctly.

### Affected versions

The following `U-Boot` versions have been tested by Radxa and confirmed to be incompatible with Micron memory:

- `U-Boot 2022.04-1 (Apr 21 2022 - 18:07:16 +0000) Manjaro Linux ARM`

Affected Micron memory has the following silkscreen printed on it:

- IPF47 D9XRR

The following Micron memories have not been found to be affected by this issue at this time:

- ISE77 D9WGB

::::caution
This is a non-exhaustive list. If you find another affected version or memory model, please send it to us via the `Edit this page` at the bottom.
::::

### Solution

Manjaro is not an officially supported operating system by Radxa. Please contact Manjaro for help updating the bootloader.

When using the official RadxaOS release [`rock-4se_debian_bullseye_kde_b38.img.xz`](https://github.com/radxa-build/rock-4se/releases/download/b38/rock-4se_debian_bullseye_kde_b38.img.xz), the affected memory is recognized and works normally.

### Workaround

::::caution
Manjaro is not an officially supported operating system by Radxa. The following workaround is only intended to verify that the problem experienced by the user is not a hardware quality issue, and Radxa is not responsible for any problems that may result from using this workaround in other scenarios.
::::

You can update the `U-Boot` memory initialization code within your existing system image or system installation device with the following command. This command can also be executed within ROCK 4B after it is booted normally.

Replace the parameter used by the last command to the storage target you want to update.

```bash
curl https://dl.radxa.com/rockpi4/troubleshooting/rock-4ab-uboot-2022-manjaro-idbloader.tar.gz | tar xzv
sudo ./setup.sh update_idbloader ___/dev/sdX_or_/dev/mmcblkX_or_system.img___
```

</details>
