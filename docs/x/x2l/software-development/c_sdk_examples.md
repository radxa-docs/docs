---
sidebar_position: 30
---

# C SDK EXAMPLES

## PICO-SDK

### 安装必要工具

```
sudo apt update -y
sudo apt install -y git cmake gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib
```

### 获取代码

```
git clone https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk
git submodule update --init
```

## PICO-EXAMPLES

### 获取代码

```
git clone https://github.com/raspberrypi/pico-examples.git --branch master
```

### 编译

```
export PICO_SDK_PATH=path/to/pico-sdk
cd pico-examples
mkdir build
cd build
cmake .. && make -j4
```

### [烧录](./flash)
