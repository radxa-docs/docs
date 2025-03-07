---
sidebar_position: 2
---

# CIX AI Model HUb

CIX AI Model Hub 是针对在 CIX SOC 上部署进行了优化的最先进的机器学习模型的集合。里面包含了多种领域的 AI 模型与针对 CIX SOC NPU 编译的配置文件，其中包括计算机视觉，语音识别，生成式 AI 等多种开源模型。

## 克隆 CIX AI Model Hub 仓库

通过 [CIX 早鸟计划](./npu-introduction#cix-早鸟计划) 申请通过后，会有邮件发送到注册邮箱，请按邮件内容获取 AI Model Hub 仓库

```bash
git clone https://e.coding.net/g-uaqh1479/ai-model-hub/ai_model_hub.git
```

## 配置环境

:::tip
在 X86 工作站中请与 NOE 的环境进行隔离
:::

```bash
pip3 install -r requirements.txt
```

## 模型例子目录

```bash
├── datasets
├── models
│   ├── Audio
│   │   └── Speech_Recognotion
│   ├── ComputeVision
│   │   ├── Face_Detection
│   │   ├── Face_Recognition
│   │   ├── Image_Classification
│   │   ├── Object_Detection
│   │   ├── Pose_Estimation
│   │   ├── Semantic_Segmentation
│   │   └── Super_Resolution
│   └── Generative_AI
│       ├── LLM
│       └── Text_Image_Search
└── utils
    ├── evaluate
    └── label
```

## 端到端例子

这些应用程序经过优化，成为易于遵循的示例，而不是为了最大限度地缩短预测时间。

端到端示例：

1. 将人类可读的输入预处理为模型输入
2. 运行模型推理
3. 将模型输出后处理为人类可读的格式

所有模型示例代码均可在 O6 上端到端运行模型：

```bash
python3 inference_npu.py
```

此外，还可以通过 OnnxRuntime 在 X86 工作站或 O6 上本地运行的端到端示例

```bash
python3 inference_onnx.py
```

## CIX AI Model Hub 预编译模型下载站

CIX AI Model Hub 里面的涉及的例子，用户可以直接从 [ModelScope](https://modelscope.cn/models/cix/ai_model_hub_24_Q4/files) 上下载提供的 onnx 模型和预编译好的模型，无需从头编译。

ModelScope 链接： https://modelscope.cn/models/cix/ai_model_hub_24_Q4/files
