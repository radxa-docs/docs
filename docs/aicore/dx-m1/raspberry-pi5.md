---
sidebar_position: 3
---

# 树莓派 5 使用指南

介绍树莓派 5 如何搭配瑞莎智核 DX-M1 / DX-M1M 产品使用。

## 硬件安装

树莓派 5 搭配树莓派 5 M.2 HAT+ 以及智核 DX-M1M 使用。

说明：树莓派 M.2 HAT+ 支持 M.2 M Key 2230 / 2242 接口，用于安装智核 DX-M1M，若使用智核 DX-M1，需要使用专门的转接板进行固定。

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/pi5_install.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>

## 使能 PCIe 3.0

打开系统终端，在终端输入 `sudo raspi-config` 命令，依次选择 `Advanced Options` -> `PCIe Speed` 选项，选择 `Yes`，启用 PCIe 3.0 模式。

## 硬件识别

将智核 DX-M1M 安装到主板 M.2 M Key 接口，主板启动系统后，你可以打开终端输入 `lspci` 命令识别智核 DX-M1M 是否被系统正确识别：

<NewCodeBlock tip="Device" type="device">
```bash
lspci
```
</NewCodeBlock>

若系统识别到智核 DX-M1 / DX-M1M，终端会输出类似如下的信息：

```text
0000:01:00.0 Processing accelerators: DEEPX Co., Ltd. DX_M1A
```

## 环境安装

对于 Linux(Ubuntu、Debian) 系统，你可以参考 [DX-NPU-Driver 驱动安装](DX-SDK/dx-npu-driver) 教程和 [DX-RT 运行时安装](./DX-SDK/dx-rt) 安装教程安装智核 DX-M1 / DX-M1M 所需的驱动和运行环境。

## 应用示例

成功完成以上操作后，你可以参考 [DX-APP 应用示例](./DX-SDK/dx-app) 教程使用智核 DX-M1 / DX-M1M 进行 AI 加速和推理。
