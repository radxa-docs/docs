---
sidebar_position: 7
---

# Vulkan User Guide

This guide shows how to install Vulkan components and verify that Vulkan works on the Dragon Q8B (Mesa Turnip driver).

## Install Vulkan

<NewCodeBlock tip="radxa@dragon-q8b$" type="device">

```bash
sudo apt update
# mesa-vulkan-drivers: Vulkan ICD (Turnip/Freedreno)
# vulkan-tools: provides vulkaninfo
sudo apt install -y mesa-vulkan-drivers vulkan-tools
```

</NewCodeBlock>

## Run vulkaninfo

<NewCodeBlock tip="radxa@dragon-q8b$" type="device">

```bash
vulkaninfo
```

</NewCodeBlock>

If you can see output like `driverName = turnip` and `deviceName = ... Adreno ...`, Vulkan is working.

## Run vkpeak

`vkpeak` is a simple Vulkan benchmark that can help quickly confirm the GPU and driver are working.

Build `vkpeak`:

<NewCodeBlock tip="radxa@dragon-q8b$" type="device">

```bash
sudo apt install -y git cmake g++
git clone https://github.com/nihui/vkpeak.git
cd vkpeak
git submodule update --init --recursive

mkdir build
cd build
cmake ..
cmake --build . -j"$(nproc)"
```

</NewCodeBlock>

Run `vkpeak`:

<NewCodeBlock tip="radxa@dragon-q8b$" type="device">

```bash
cd ./vkpeak/build
./vkpeak 0
```

</NewCodeBlock>

The output result is as follows:

```text
device       = Turnip Adreno (TM) 690
driver       = turnip Mesa driver / Mesa 26.0.3-1ubuntu1

fp32-scalar  = 2708.96 GFLOPS
fp32-vec4    = 2774.66 GFLOPS

fp16-scalar  = 3761.96 GFLOPS
fp16-vec4    = 5542.70 GFLOPS
fp16-matrix  = 0.00 GFLOPS

fp64-scalar  = 0.00 GFLOPS
fp64-vec4    = 0.00 GFLOPS

int32-scalar = 694.37 GIOPS
int32-vec4   = 701.89 GIOPS

int16-scalar = 1822.40 GIOPS
int16-vec4   = 1861.33 GIOPS

int64-scalar = 121.03 GIOPS
int64-vec4   = 102.85 GIOPS

int8-dotprod = 7640.92 GIOPS
int8-matrix  = 0.00 GIOPS

bf16-dotprod = 0.00 GFLOPS
bf16-matrix  = 0.00 GFLOPS

fp8-matrix   = 0.00 GFLOPS
bf8-matrix   = 0.00 GFLOPS

copy-h2h     = 14.66 GBPS
copy-h2d     = 14.59 GBPS
copy-d2h     = 14.65 GBPS
copy-d2d     = 28.93 GBPS
```
