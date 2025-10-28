---
sidebar_position: 1
---

# 快速上手

主要以 ROCK 5B+ 为例，介绍如何搭配瑞莎智核 DX-M1 产品使用。

:::info 兼容性

智核 DX-M1 产品目前实测可以搭配瑞莎多款单板计算机 (SBC) 使用。

- 兼容主板
  - ROCK 5B
  - ROCK 5B+

:::

## 产品实物

<div style={{textAlign: 'center'}}>
   智核 DX-M1 模块正面
   <img src="/img/aicore-dx-m1/dx-m1-top.webp" style={{width: '60%', maxWidth: '800px'}} />
   智核 DX-M1 模块背面
    <img src="/img/aicore-dx-m1/dx-m1-bottom.webp" style={{width: '60%', maxWidth: '800px'}} />
</div>

## 使用前提

您需要提前准备以下硬件设备搭配智核 DX-M1 产品使用：

- **AI 算力模组**：瑞莎智核 DX-M1
- **主板套件**：兼容智核 DX-M1 的主板 + 电源适配器 + 系统启动介质（如 Micro SD 卡等）

:::tip 使用条件
主板需要满足以下要求：

- 可正常启动系统
- 提供未被占用的 **M.2 M Key 接口**（支持 PCIe Gen 3.0 x4），用于安装智核 DX-M1
  :::

## 硬件安装

对于 ROCK 5B+，你可以参考 [硬件安装](./hardware_install) 教程安装智核 DX-M1。

:::tip 说明
对于主板安装 M.2 M Key 接口的外设，安装步骤和方法都基本一致，可以参考 [硬件安装](./hardware_install) 教程安装智核 DX-M1。
:::

## 硬件识别

将智核 DX-M1 安装到主板 M.2 M Key 接口，主板启动系统后，你可以打开终端输入 `lspci` 命令识别智核 DX-M1 是否被系统正确识别：

<NewCodeBlock tip="Device" type="device">
```
lspci
```
</NewCodeBlock>

若系统识别到智核 DX-M1，终端会输出类似如下的信息：

```
0000:01:00.0 Processing accelerators: DEEPX Co., Ltd. DX_M1A
```

## 环境安装

对于 Linux(Ubuntu、Debian) 系统，你可以参考 [DX-NPU-Driver 驱动安装](DX-SDK/dx-npu-driver) 教程和 [DX-RT 运行时安装](./DX-SDK/dx-rt) 安装教程安装智核 DX-M1 所需的驱动和运行环境。

## 应用示例

成功完成以上操作后，你可以参考 [DX-APP 应用示例](./DX-SDK/dx-app) 教程使用智核 DX-M1 进行 AI 加速和推理。
