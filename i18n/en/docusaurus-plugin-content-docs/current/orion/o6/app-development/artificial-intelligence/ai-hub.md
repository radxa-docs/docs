---
sidebar_position: 2
---

# CIX AI Model Hub

The CIX AI Model Hub is a collection of machine learning models optimized for deployment on the CIX SOC. It includes AI model examples from various domains (such as computer vision, speech recognition, generative AI, and other open-source models) along with configuration files compiled specifically for the CIX SOC NPU. This section introduces how to download and run models from the AI Model Hub.

## Download the CIX AI Model Hub Repository

After applying through the [CIX Early Bird Program](./npu-introduction#cix-early-bird-program), an email will be sent to the registered email address. Follow the email instructions to access the AI Model Hub repository.

```bash
git clone https://e.coding.net/g-uaqh1479/ai-model-hub/ai_model_hub.git
```

### Model Examples Directory Structure

```bash
├── datasets
├── models
│   ├── Audio
│   │   └── Speech_Recognition
│   ├── ComputerVision
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

## Run Models

### Setting Up the Environment (on x86 Linux)

Install the required Python environment:

```bash
pip3 install -r requirements.txt
```

### Model Examples

1. Preprocess human-readable input into model input format.
2. Run model inference.
3. Postprocess model output into a human-readable format.

All model example codes can run end-to-end using the NPU on the O6:

```bash
python3 inference_npu.py
```

Additionally, OnnxRuntime can be used to run end-to-end examples locally on an x86 host or on the O6 using the CPU:

```bash
python3 inference_onnx.py
```

## CIX AI Model Hub Precompiled Model Download Center

For the examples covered in the CIX AI Model Hub, users can directly download ONNX models and precompiled models from [ModelScope](https://modelscope.cn/models/cix/ai_model_hub_24_Q4/files) without the need for manual compilation.

ModelScope Link: https://modelscope.cn/models/cix/ai_model_hub_24_Q4/files
