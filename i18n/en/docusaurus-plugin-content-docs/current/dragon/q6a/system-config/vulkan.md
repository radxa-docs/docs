---
sidebar_position: 6
---

# Vulkan User Guide

## Install Vulkan

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash

sudo apt install mesa-vulkan-drivers

```

</NewCodeBlock>

## Run vulkaninfo

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash

vulkaninfo

```

</NewCodeBlock>

## Run vkpeak

Build tool vkepak.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash

sudo apt install cmake g++
git clone https://github.com/nihui/vkpeak.git
cd vkpeak
git submodule update --init --recursive

mkdir build
cd build
cmake ..
cmake --build . -j 4

```

</NewCodeBlock>

Run vkpeak.

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash

cd ./vkpeak/build
./vkpeak 0

```

</NewCodeBlock>

The output result is as follows:

```
device       = Turnip Adreno (TM) 643
driver       = turnip Mesa driver / Mesa 25.2.8-0ubuntu0.24.04.1

fp32-scalar  = 773.18 GFLOPS
fp32-vec4    = 808.85 GFLOPS

fp16-scalar  = 1105.64 GFLOPS
fp16-vec4    = 1581.43 GFLOPS
fp16-matrix  = 0.00 GFLOPS

fp64-scalar  = 0.00 GFLOPS
fp64-vec4    = 0.00 GFLOPS

int32-scalar = 203.74 GIOPS
int32-vec4   = 205.73 GIOPS

int16-scalar = 526.61 GIOPS
int16-vec4   = 547.03 GIOPS

int64-scalar = 22.63 GIOPS
int64-vec4   = 17.90 GIOPS

int8-dotprod = 1176.03 GIOPS
int8-matrix  = 0.00 GIOPS

bf16-dotprod = 0.00 GFLOPS
bf16-matrix  = 0.00 GFLOPS

fp8-matrix   = 0.00 GFLOPS
bf8-matrix   = 0.00 GFLOPS

copy-h2h     = 3.54 GBPS
copy-h2d     = 8.27 GBPS
copy-d2h     = 8.20 GBPS
copy-d2d     = 9.06 GBPS
```
