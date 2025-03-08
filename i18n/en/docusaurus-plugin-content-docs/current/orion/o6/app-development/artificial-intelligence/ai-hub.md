---
sidebar_position: 2
---

# CIX AI Model Hub

CIX AI Model Hub is a collection of machine learning models optimized for deployment on the CIX SOC. It includes various AI models across multiple domains (such as computer vision, speech recognition, generative AI, and more open-source models) along with configuration files compiled for the CIX SOC NPU. This section primarily introduces how to download and run models from the AI Model Hub.

## Downloading the CIX AI Model Hub Repository

After applying through the [CIX Early Bird Program](./npu-introduction#cix-early-bird-program), an email will be sent to your registered mailbox. Please obtain the AI Model Hub repository according to the email instructions.

```bash
git clone https://e.coding.net/g-uaqh1479/ai-model-hub/ai_model_hub.git
```

Model examples directory

```bash
├── datasets
├── models
│   ├── Audio
│   │   └── Speech_Recognition
│   ├── ComputeVision
│   │   ├── Face_Detection
│   │   ├── Face_Recognition
│   │   ├── Image_Classification
│   │   ├── Object_Detection
│   │   ├── Pose_Estimation
│   │   ├── Semantic_Segmentation
│   │   └── Super_Resolution
│   └── Generative_AI
│       ├── LLM
│       └── Text_Image_Search
└── utils
    ├── evaluate
    └── label
```

## Running the Models

### Setting Up the Environment (Under the x86 Linux Environment)

Installing the Python environment

```bash
pip3 install -r requirements.txt
```

### End-to-End Model Examples

These applications are optimized to be easily deployable examples rather than for minimizing prediction time.

End-to-end examples:

1. Preprocess human-readable input into model input
2. Run model inference
3. Postprocess model output into human-readable format

All model examples can be run end-to-end on the O6:

```bash
python3 inference_npu.py
```

Additionally, end-to-end examples can be run locally on the X86 host or O6 using OnnxRuntime

```bash
python3 inference_onnx.py
```

## CIX AI Model Hub Precompiled Model Download Station

For the examples in the CIX AI Model Hub, users can directly download ONNX models and precompiled models from [ModelScope](https://modelscope.cn/models/cix/ai_model_hub_24_Q4/files) without needing to compile from scratch.

ModelScope link: https://modelscope.cn/models/cix/ai_model_hub_24_Q4/files
