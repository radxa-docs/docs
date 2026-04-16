---
sidebar_position: 6
---

# Build System

This section mainly covers u-boot, kernel, and AOSP compilation and packaging.

## Environment Setup

Ubuntu 20.04 or higher is recommended.

## Download Source Code

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
repo init -u https://github.com/radxa/manifests.git -b Android12_Radxa_rk14 -m rockchip-s-release.xml
repo sync
repo forall -c 'git lfs pull'
```

</NewCodeBlock>

## Build System Image

Android system supports two build methods:

- **Full Build**: Used for initial build or when complete rebuild is needed, takes longer
- **Module Build**: Used after modifying specific components, faster compilation speed, e.g., when only modifying kernel

### Full Build

Suitable for initial build or when complete rebuild is needed, takes longer.

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch RadxaRockNX5-userdebug
./build.sh -UACKup
```

</NewCodeBlock>

Wait for the build to complete, and you can find the image files in the `IMAGE` directory.

### Individual Component Build

Suitable for use after modifying specific components, faster compilation speed.

#### U-Boot

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch RadxaRockNX5-userdebug
./build.sh -AUup
```

</NewCodeBlock>

#### Kernel

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch RadxaRockNX5-userdebug
./build.sh -ACKup
```

</NewCodeBlock>

#### AOSP

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch RadxaRockNX5-userdebug
./build.sh -Aup
```

</NewCodeBlock>

Wait for the build to complete, and you can find the image files in the `IMAGE` directory.
