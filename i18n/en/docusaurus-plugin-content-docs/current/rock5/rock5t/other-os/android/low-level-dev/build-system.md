---
sidebar_position: 2
---

# Build System

This document introduces how to build and package U-Boot, the kernel, and AOSP.

## Environment

Ubuntu 20.04 or later is recommended.

## Download sources

<NewCodeBlock tip="Ubuntu$" type="host">

```
repo init -u https://github.com/radxa/manifests.git -b Android12_Radxa_rk14 -m rockchip-s-release.xml
repo sync
repo forall -c 'git lfs pull'
```

</NewCodeBlock>

## Build images

Android supports two build approaches:

- **Full build**: use this for the first build or when you need a clean rebuild. It takes longer.
- **Partial build**: use this after changing a specific component. It is faster. For example, if you only modify the kernel, you can build only the kernel.

### Full build

Suitable for the first build or when you need a clean rebuild. It takes longer.

<NewCodeBlock tip="Ubuntu$" type="host">

```
source build/envsetup.sh
lunch RadxaRock5BPro-userdebug
./build.sh -UACKup
```

</NewCodeBlock>

After the build completes, you can find the images in the `IMAGE` directory.

### Partial build

Suitable after modifying a specific component. It is faster.

#### Uboot

<NewCodeBlock tip="Ubuntu$" type="host">

```
source build/envsetup.sh
lunch RadxaRock5BPro-userdebug
./build.sh -AUup
```

</NewCodeBlock>

#### Kernel

<NewCodeBlock tip="Ubuntu$" type="host">

```
source build/envsetup.sh
lunch RadxaRock5BPro-userdebug
./build.sh -ACKup
```

</NewCodeBlock>

#### AOSP

<NewCodeBlock tip="Ubuntu$" type="host">

```
source build/envsetup.sh
lunch RadxaRock5BPro-userdebug
./build.sh -Aup
```

</NewCodeBlock>

After the build completes, you can find the images in the `IMAGE` directory.
