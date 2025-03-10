---
sidebar_position: 1
---

# NPU SDK 安装

## NPU 简介

瑞莎星睿 O6 (Radxa Orion O6) 拥有高达 28.8TOPs NPU (Neural Processing Unit) 算力，支持 INT4 / INT8 / INT16 / FP16 / BF16 和 TF32 类型的加速。
此文档主要讲解用户如何使用 CIX P1 NPU SDK 运行基于 NPU 加速推理的人工智能模型和应用。包括模型编译工具，工具链和一些常见模型案例进行逐步讲解。

## CIX 早鸟计划

NPU SDK 包含 NOE Compiler 与 CIX AI Model Hub, 要获取 SDK 需要通过申请 CIX 早鸟计划获取。
申请链接： [CIX 早鸟计划](https://support.cixtech.com/#/)

## 安装 NPU SDK (x86 Linux 环境)

通过 [CIX 早鸟计划](#cix-早鸟计划) 申请后，会有邮件发送到注册邮箱，请按邮件内容下载 SDK

```bash
tar -xvf nor.tag.gz
```

:::tip
CIX P1 NPU SDK 是安装在 X86 主机上，并要求 python 版本为 3.8。

请用户准备好 python3.8 环境，推荐使用 [anaconda](https://www.anaconda.com/download)
:::

### 安装 NOE Compiler

NOE Compiler 用于模型的编译，将 ONNX 模型框架的模型格式转换为可以使用 NPU 进行加速推理的模型格式

```bash
cd noe
pip3 install -r requirements.txt
pip3 install ./CixBuilder-6.1.2958.1-py3-none-any.whl
```

## 安装 NOE UMD (Orion O6)

:::tip
NOE UMD 包以 deb 安装包形式发布，如使用 python api，在创建虚拟环境时请继承系统依赖： **`python3 -m venv --system-site-packages .venv`**
:::
通过 [CIX 早鸟计划](#cix-早鸟计划) 申请后，会有邮件发送到注册邮箱，请按邮件内容下载 UMD (User Mode Driver) deb 包

```bash
sudo dpkg -i ./cix-noe-umd_0.01-1_arm64.deb
```
