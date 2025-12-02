---
sidebar_position: 0
---

# System Introduction

We provide three methods for users to install the system. Here are the advantages and disadvantages of each method:

| Installation Method | Advantages                                                                                          | Disadvantages                                                      |
| ------------------- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| Using Balena Etcher | Works with Radxa BIOS firmware, supports booting from USB drives and NVMe SSDs, simple installation | Cannot enter MAXN_SUPER mode                                       |
| Using SDK Manager   | Allows custom component deployment                                                                  | Cannot enter MAXN_SUPER mode, only supports booting from NVMe SSDs |
| Using Command Line  | Can enter MAXN_SUPER mode                                                                           | Only supports booting from NVMe SSDs                               |

**About MAXN_SUPER Mode**

MAXN_SUPER mode is a system operation mode introduced by NVIDIA to provide higher performance.

Compared to normal mode, MAXN_SUPER mode offers enhanced computing power. Here are its notable features (using Jetson Orin NX 8GB module as an example):

- 34.7% increase in GPU frequency (765 -> 1173 MHz)
- 67.1% increase in AI computing power (70 -> 117 TOPS)

For more information, please refer to NVIDIA's official technical blog: [NVIDIA JetPack 6.2 Brings Super Mode to NVIDIA Jetson Orin Nano and Jetson Orin NX Modules](https://developer.nvidia.com/blog/nvidia-jetpack-6-2-brings-super-mode-to-nvidia-jetson-orin-nano-and-jetson-orin-nx-modules/)
