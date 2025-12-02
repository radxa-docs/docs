---
sidebar_position: 0
---

# 系统说明

我们提供 3 种方式给用户安装系统，以下是三种方式的优缺点：

| 安装方式                    | 优点                                                                    | 缺点                                                   |
| --------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------ |
| 使用 Balena Etcher 安装系统 | 搭配瑞莎 BIOS 固件使用，支持 U 盘和 NVMe 固态硬盘启动系统，安装系统简单 | 无法进入 MAXN_SUPER 模式                               |
| 通过 SDK Manager 安装系统   | 可自行部署组件环境                                                      | 无法进入 MAXN_SUPER 模式，只支持 NVMe 固态硬盘启动系统 |
| 通过命令行安装系统          | 可进入 MAXN_SUPER 模式                                                  | 只支持 NVMe 固态硬盘启动系统                           |

**MAXN_SUPER 模式说明**

MAXN_SUPER 模式是英伟达推出的一种系统运行模式，用于提供更高的性能。

相比于普通模式，MAXN_SUPER 模式可以提供更强的计算能力，其突出的特点包括：以 Jetson Orin NX 8GB 模组为例

- GPU 频率提升 34.7% (765 -> 1173 MHz)
- AI 算力提升 67.1% (70 -> 117 TOPS)

更多信息可以参考英伟达官方技术博客：[NVIDIA JetPack 6.2 Brings Super Mode to NVIDIA Jetson Orin Nano and Jetson Orin NX Modules](https://developer.nvidia.com/blog/nvidia-jetpack-6-2-brings-super-mode-to-nvidia-jetson-orin-nano-and-jetson-orin-nx-modules/)
