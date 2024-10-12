---
sidebar_position: 1
---

# 镜像构建

### 下载SDK

1. 访问SDK源码目录 [SIENGINE_SDK](https://gitlab.com/siengine-ubuntu-sdk/manifests) 查看具体的源码下载步骤
2. `toolchain` 目录下的文件以`lfs`的形式存储，请根据目录下的`readme`文件操作，下载完成后手动解压工具链

### 编译SDK

1. 参考文档 [SE1000 Linux SDK 编译参考手册](https://gitlab.com/siengine-ubuntu-sdk/docs/-/blob/master/UM_SE1000_AIoT_Linux_SDK_User_Manual.pdf?ref_type=heads) 进行环境搭建和镜像编译


2. 编译出来的相关固件将会存在 `deploy/build/` 目录下，请根据对应的 DDR 容量下载相应的 `LUN5` 固件替换目录下的 `lun5_fip.bin`

- [lun5_fip_LP5_4GB_5500_DS.bin](https://dl.radxa.com/sirider/s1/lun5_fip_LP5_4GB_5500_DS.bin) 单颗4GB下载

- [lun5_fip_LP5_8GB_5500_DS.bin](https://dl.radxa.com/sirider/s1/lun5_fip_LP5_8GB_5500_DS.bin) 单颗8GB下载


## 参考

- [SIENGINE DOCS ](https://gitlab.com/siengine-ubuntu-sdk/docs) SIENGINE 相关文档