---
sidebar_position: 6
---

# Build System

This section covers the compilation and packaging of u-Boot, kernel, and AOSP.

## Environment Setup

Ubuntu 20.04 or later is recommended.

## Source Code Download

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
repo init -u https://github.com/radxa/manifests -b  Android14_RK3576_Radxa_rk6  -m rockchip-u-release.xml
repo sync
repo forall -c 'git lfs pull'
```

</NewCodeBlock>

## Image Compilation

Android system supports two compilation methods:

- **Full Compilation**: Used for the first build or when a complete rebuild is needed, takes longer
- **Module Compilation**: Used after modifying specific components, faster compilation, e.g., only the kernel module needs to be compiled when only the kernel is modified

### Full Compilation

Suitable for the first build or when a complete rebuild is needed, takes longer.

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch rk3576_rock_4d-userdebug
./build.sh -UACKup
```

</NewCodeBlock>

After compilation is complete, you can find the image files in the `IMAGE` directory.

### Individual Component Compilation

Suitable for use after modifying specific components, with faster compilation speed.

#### U-Boot

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch rk3576_rock_4d-userdebug
./build.sh -AUup
```

</NewCodeBlock>

#### Kernel

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch rk3576_rock_4d-userdebug
./build.sh -ACKup
```

</NewCodeBlock>

#### AOSP

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch rk3576_rock_4d-userdebug
./build.sh -Aup
```

</NewCodeBlock>

After compilation is complete, you can find the image files in the `IMAGE` directory.
