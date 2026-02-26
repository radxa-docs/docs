---
sidebar_position: 6
---

# Build System

Mainly introduces uboot, kernel, aosp compilation and packaging content.

## Environment Configuration

It is recommended to use Ubuntu 20.04 and above versions.

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

- **Full compilation**: Used for first build or when complete rebuild is needed, takes longer time
- **Module compilation**: Used after modifying specific components, faster compilation speed, for example when only modifying kernel, only need to compile kernel module

### Full Compilation

Suitable for first build or when complete rebuild is needed, takes longer time.

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch rk3576_radxa_cm4-userdebug
./build.sh -UACKup
```

</NewCodeBlock>

Wait for compilation to complete and you can find the image files in the `IMAGE` directory.

### Individual Compilation

Suitable for use after modifying specific components, faster compilation speed.

#### Uboot

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch rk3576_radxa_cm4-userdebug
./build.sh -AUup
```

</NewCodeBlock>

#### Kernel

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch rk3576_radxa_cm4-userdebug
./build.sh -ACKup
```

</NewCodeBlock>

#### AOSP

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch rk3576_radxa_cm4-userdebug
./build.sh -Aup
```

</NewCodeBlock>

Wait for compilation to complete and you can find the image files in the `IMAGE` directory.
