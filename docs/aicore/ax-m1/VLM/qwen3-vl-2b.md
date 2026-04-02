---
sidebar_position: 6
---

# Qwen3-VL-2B-Instruct

本文档演示如何在瑞莎 AX-M1 上运行 Qwen3-VL-2B-Instruct 模型：

| 模型                 | 参数量 | 量化方式  | Hugging Face 仓库                           |
| -------------------- | ------ | --------- | ------------------------------------------- |
| Qwen3-VL-2B-Instruct | 2B     | GPTQ-Int4 | `AXERA-TECH/Qwen3-VL-2B-Instruct-GPTQ-Int4` |

## 安装 axllm 工具

axllm 是 AXERA 提供的 LLM 推理工具，支持命令行交互和 OpenAI 兼容 API。

**方式一：克隆仓库后执行安装脚本**

```shell
git clone -b axllm https://github.com/AXERA-TECH/ax-llm.git
cd ax-llm
./install.sh
```

**方式二：一行命令安装（默认分支 `axllm`）**

```shell
curl -fsSL https://raw.githubusercontent.com/AXERA-TECH/ax-llm/axllm/install.sh | bash
```

**方式三：下载 GitHub Actions CI 导出的可执行程序**

如果没有编译环境，请到 [ax-llm Actions](https://github.com/AXERA-TECH/ax-llm/actions?query=branch%3Aaxllm) 下载最新 CI 导出的可执行程序：

```shell
chmod +x axllm
sudo mv axllm /usr/bin/axllm
```

## 下载模型

### 创建虚拟环境并安装 huggingface_hub

```shell
python3 -m venv .venv
source .venv/bin/activate
pip install huggingface_hub
```

### 下载模型

```shell
mkdir -p Qwen3-VL-2B
cd Qwen3-VL-2B
hf download AXERA-TECH/Qwen3-VL-2B-Instruct-GPTQ-Int4 --local-dir .
```

## 运行模型

### 命令行交互模式

```shell
axllm run Qwen3-VL-2B/
```

**VLM 使用说明：**

- 每轮输入 `prompt` 后，会提示 `image >>`
  - 直接回车：本轮仅文本对话
  - 输入图片路径：图文对话
  - 输入 `video:<frames_dir>`：视频/多帧对话

:::tip 使用提示
如果在输入图片路径时打错字再删掉，可能无法正确识别图片路径。遇到这种情况时，请输入 `/reset` 重置 kvcache 后重新输入。
:::

![Qwen3-VL-2B 示例图片](/img/aicore-ax-m1/qwen3.5-example.webp)

```shell
$ axllm run Qwen3-VL-2B/
...
Commands:
  /q, /exit  退出  /reset     重置 kvcache
  /dd        删除一轮对话  /pp        打印历史对话
Ctrl+C: 停止当前生成VLM enabled: after each prompt, input image path (empty = text-only). Use "video:<frames_dir>" for video.
----------------------------------------
prompt >> 这是一张什么图片？
image >> ./image.png
18:53:42.571 INF Run:1023 | ttft: 740.26 ms
这是一张描绘太空人（宇航员）在丛林中探险的图片。他们穿着白色宇航服，站在茂密的绿色植物中，背景是深色的，整体色调偏冷，营造出一种神秘、科幻的氛围。

18:57:35.909 NTC Run:1145 | hit eos,avg 4.65 token/s
```

### OpenAI 兼容 API 服务模式

```shell
axllm serve Qwen3-VL-2B/
```

服务启动后，可通过 HTTP 请求调用：

```python
from openai import OpenAI

API_URL = "http://127.0.0.1:8000/v1"
MODEL = "Qwen3-VL-2B"

messages = [
    {"role": "system", "content": [{"type": "text", "text": "你是一个乐于助人的AI助手。"}]},
    {"role": "user", "content": "你好"},
]

client = OpenAI(api_key="not-needed", base_url=API_URL)
completion = client.chat.completions.create(
    model=MODEL,
    messages=messages,
)

print(completion.choices[0].message.content)
```

## 性能

| 模型                 | 输入尺寸 | 图片数量 | TTFT      | 生成速度     | CMM 内存 |
| -------------------- | -------- | -------- | --------- | ------------ | -------- |
| Qwen3-VL-2B-Instruct | 384×384  | 1        | 740.26 ms | 4.65 token/s | 2384 MB  |

:::info

- **TTFT** (Time To First Token)：首 token 延迟
- **生成速度**：单位为 tokens/second
  :::
