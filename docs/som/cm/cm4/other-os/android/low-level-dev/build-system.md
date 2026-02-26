---
sidebar_position: 6
---

# 构建系统

主要介绍 uboot, kernel, aosp 编译打包等内容。

## 环境配置

建议使用 Ubuntu 20.04 及以上版本。

## 源码下载

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
repo init -u https://github.com/radxa/manifests -b  Android14_RK3576_Radxa_rk6  -m rockchip-u-release.xml
repo sync
repo forall -c 'git lfs pull'
```

</NewCodeBlock>

## 镜像编译

Android 系统支持两种编译方式：

- **完整编译**：首次构建或需要完全重建时使用，耗时较长
- **模块编译**：修改特定组件后使用，编译速度更快，例如仅修改内核时只需编译内核模块

### 全部编译

适合首次构建或需要完全重建时使用，耗时较长。

<NewCodeBlock tip="Ubuntu$" type="host">

```bash
source build/envsetup.sh
lunch rk3576_radxa_cm4-userdebug
./build.sh -UACKup
```

</NewCodeBlock>

等待编译完成就可以在 `IMAGE` 目录找到镜像文件。

### 单独编译

适合修改特定组件后使用，编译速度更快。

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

等待编译完成就可以在 `IMAGE` 目录找到镜像文件。
