---
sidebar_position: 30
---

# C SDK EXAMPLES

## PICO-SDK

### Install the necessary tools

```
sudo apt update -y
sudo apt install -y git cmake gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib
```

### Get the code

```
git clone https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk
git submodule update --init
```

## PICO-EXAMPLES

### Get the code

```
git clone https://github.com/raspberrypi/pico-examples.git --branch master
```

### Compile

```
export PICO_SDK_PATH=path/to/pico-sdk
cd pico-examples
mkdir build
cd build
cmake .. && make -j4
```

### [Burning](./flash)
