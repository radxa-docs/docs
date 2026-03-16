---
sidebar_position: 1
---

# Stable Diffusion 1.5 Euler

此文档讲解如何在安装了瑞莎智核 AX-M1 的 host 设备上运行 Stable Diffusion 1.5 Euler 模型进行文生图推理。

:::tip
本示例基于社区用户 [SHANKAR_THAKUR](https://forum.radxa.com/t/radxa-axm1-projects/30411) 提供的方案，感谢其贡献。
:::

## 环境准备

在开始之前，请确保：

- 瑞莎智核 **AX-M1** 已正确安装并连接到主机
- 主机（支持 Rock 5B/5B+ 或 Raspberry Pi 5）已安装瑞莎官方镜像或其他适配操作系统
- 确保网络连接正常，可访问 GitHub 和 HuggingFace

:::tip
Raspberry Pi 5 也可作为主机，只要 AX-M1 已连接且 AXCLRT 运行时可在该操作系统上运行。
:::

:::caution
请确保 AX-M1 硬件连接稳定。如遇推理失败，首先检查硬件连接状态和设备温度。
:::

## 克隆项目仓库

<NewCodeBlock tip="Host" type="device">

```bash
git clone https://github.com/Mojo24x7/SD1.5_AXM1-AX8850_Euler && cd SD1.5_AXM1-AX8850_Euler
```

</NewCodeBlock>

## 创建虚拟环境

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv
```

</NewCodeBlock>

## 激活虚拟环境并升级 pip

<NewCodeBlock tip="Host" type="device">

```bash
source .venv/bin/activate && pip install -U pip
```

</NewCodeBlock>

## 安装项目依赖

<NewCodeBlock tip="Host" type="device">

```bash
pip install -r requirements.txt
```

</NewCodeBlock>

## 下载并安装 pyaxengine

pyaxengine 是爱芯元智官方提供的 Python API 库，用于在 AX-M1 上运行推理。

<NewCodeBlock tip="Host" type="device">

```bash
wget https://github.com/AXERA-TECH/pyaxengine/releases/download/0.1.3.rc2/axengine-0.1.3-py3-none-any.whl
pip install axengine-0.1.3-py3-none-any.whl
```

</NewCodeBlock>

## 下载预训练模型

首先安装 git-lfs：

<NewCodeBlock tip="Host" type="device">

```bash
sudo apt update && sudo apt install git-lfs
git lfs install
```

</NewCodeBlock>

从 HuggingFace 克隆模型仓库：

<NewCodeBlock tip="Host" type="device">

```bash
git clone https://huggingface.co/Mojo24x7/sd15-axm1-euler512-axmodels hf_axmodels
```

</NewCodeBlock>

复制模型文件到指定目录：

<NewCodeBlock tip="Host" type="device">

```bash
mkdir -p axmodels
cp -v hf_axmodels/*.axmodel axmodels/
```

</NewCodeBlock>

:::tip
模型文件较大，下载可能需要较长时间，请耐心等待。
:::

## 运行文生图推理

<NewCodeBlock tip="Host" type="device">

```bash
python3 scripts/txt2img_axengine_euler.py \
  --weights_dir ./axmodels \
  --tokenizer_dir ./support/tokenizer \
  --scheduler_dir ./support/scheduler \
  --vae_config ./support/vae/config.json \
  --prompt "a cinematic ultra realistic portrait photo" \
  --steps 30 \
  --out ./out/txt2img_euler_512.png
```

</NewCodeBlock>

### 参数说明

| 参数              | 说明             |
| ----------------- | ---------------- |
| `--weights_dir`   | 模型权重目录     |
| `--tokenizer_dir` | 分词器目录       |
| `--scheduler_dir` | 调度器配置目录   |
| `--vae_config`    | VAE 配置文件路径 |
| `--prompt`        | 输入文本提示词   |
| `--steps`         | 推理步数         |
| `--out`           | 输出图片路径     |

### 预期输出

推理成功后，输出图片保存在 `./out/txt2img_euler_512.png`。

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-ax-m1/sd15-euler-inference-result.webp"/>
   Stable Diffusion 1.5 Euler 推理结果示例
</div>

## 运行 Web UI 界面

该项目还提供了 Web UI 界面，方便交互式生成图片：

<NewCodeBlock tip="Host" type="device">

```bash
python run_ui.py --base_dir ./ --out_root ./out --venv_py ~/SD1.5_AXM1-AX8850_Euler/.venv/bin/python --token_max_len 100
```

</NewCodeBlock>

:::tip
请确保虚拟环境路径与实际路径一致。如果路径不同，请修改 `--venv_py` 参数指向正确的 Python 解释器路径。
:::

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-ax-m1/sd15-euler-web-ui.webp"/>
   Stable Diffusion 1.5 Euler Web UI 界面
</div>

## 常见问题

### 推理失败如何排查？

1. **检查硬件连接**：确保 AX-M1 模块正确连接至 M.2 接口
2. **检查设备温度**：高温可能导致性能降级或推理失败
3. **检查虚拟环境**：确保使用正确的虚拟环境中的 Python 解释器
4. **查看日志输出**：详细日志通常会指出具体错误原因

### 模型下载失败怎么办？

- 检查网络连接，确保可以访问 HuggingFace
- 尝试使用代理或镜像站点
- 可以手动下载模型文件后复制到对应目录

### 推理速度较慢？

- 检查 AX-M1 散热情况，必要时添加散热片
- 确认 NPU 正常工作（可通过 `axcl-smi` 命令查看）
