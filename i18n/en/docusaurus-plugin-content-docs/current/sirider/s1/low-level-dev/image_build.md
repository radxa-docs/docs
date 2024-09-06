---
sidebar_position: 1
---

# Image Building

## Download the SDK

Visit the [SIENGINE_SDK](https://gitlab.com/siengine-ubuntu-sdk/manifests) source directory to view the detailed source download steps.
The files in the `toolchain` directory are stored in `lfs` format. Please follow the instructions in the `readme` file within the directory. After downloading, manually extract the toolchain.

## Compile the SDK

Refer to the [SE1000 Linux SDK Compilation Reference Manual](https://gitlab.com/siengine-ubuntu-sdk/docs/-/blob/master/UM_SE1000_AIoT_Linux_SDK_User_Manual.pdf?ref_type=heads) for setting up the environment and compiling the image.
The compiled firmware will be located in the `deploy/build/` directory. Please download the corresponding `LUN5` firmware based on the DDR capacity and replace the `lun5_fip.bin` in the directory.


- [lun5_fip_LP5_4GB_5500_DS.bin](https://dl.radxa.com/sirider/s1/lun5_fip_LP5_4GB_5500_DS.bin) for single 4GB DDR download

- [lun5_fip_LP5_8GB_5500_DS.bin](https://dl.radxa.com/sirider/s1/lun5_fip_LP5_8GB_5500_DS.bin) for single 8GB DDR download

## Reference

- [SIENGINE DOCS ](https://gitlab.com/siengine-ubuntu-sdk/docs) SIENGINE related documentation
