---
sidebar_position: 4
---

# Android 编译

## 代码下载

请发邮件到 support@radxa.com 联系我们

## 镜像编译

### 环境准备

- x86 PC
- Ubuntu 20.04 及后续版本

```text
 sudo apt-get install python3
 sudo apt-get install python-pip && pip install pycrypto
 sudo apt-get install bison build-essential curl flex g++-multilib gcc-multilib gnupg gperf lib32z-dev lib32z1 libc6-dev-i386 \
 libgl1-mesa-dev libncurses5 lib32ncurses5-dev libssl-dev libx11-dev libxml2-utils m4 unzip x11proto-core-dev xsltproc zip \
 zlib1g-dev bsdmainutils cgpt libswitch-perl bc rsync xxd git-core parallel
```

### 编译命令

```text
 . build/envsetup.sh
 lunch  full_radxa_g1200-userdebug //nio 12l
 make pl
 make lk
 make kernel
 make
```
