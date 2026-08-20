---
sidebar_position: 1
doc_kind: page
last_verified: 2026-08-19
---

# Qwen3-1.7B

此文档讲解如何在安装了瑞莎智核 AX-M1 的 host 设备上运行 [Qwen3-1.7B](https://huggingface.co/Qwen/Qwen3-1.7B)。

| 模型       | 参数量 | 量化方式 | Hugging Face 仓库       |
| ---------- | ------ | -------- | ----------------------- |
| Qwen3-1.7B | 1.7B   | w8a16    | `AXERA-TECH/Qwen3-1.7B` |

## 安装 axllm 工具

axllm 是 AXERA 提供的 LLM 推理工具，支持命令行交互和 OpenAI 兼容 API。

**方式一：克隆仓库后执行安装脚本**

<NewCodeBlock tip="Host" type="device">

```bash
git clone -b axllm https://github.com/AXERA-TECH/ax-llm.git
cd ax-llm
./install.sh
```

</NewCodeBlock>

**方式二：一行命令安装（默认分支 `axllm`）**

<NewCodeBlock tip="Host" type="device">

```bash
curl -fsSL https://raw.githubusercontent.com/AXERA-TECH/ax-llm/axllm/install.sh | bash
```

</NewCodeBlock>

**方式三：下载 GitHub Actions CI 导出的可执行程序**

如果没有编译环境，请到 [ax-llm Actions](https://github.com/AXERA-TECH/ax-llm/actions?query=branch%3Aaxllm) 下载最新 CI 导出的可执行程序：

<NewCodeBlock tip="Host" type="device">

```bash
chmod +x axllm
sudo mv axllm /usr/bin/axllm
```

</NewCodeBlock>

## 下载模型

### 创建虚拟环境并安装 huggingface_hub

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install huggingface_hub
```

</NewCodeBlock>

### 下载模型

<NewCodeBlock tip="Host" type="device">

```bash
hf download AXERA-TECH/Qwen3-1.7B --local-dir ./Qwen3-1.7B
```

</NewCodeBlock>

## 运行模型

### 命令行交互模式

<NewCodeBlock tip="Host" type="device">

```bash
axllm run Qwen3-1.7B/
```

</NewCodeBlock>

```shell
$ axllm run Qwen3-1.7B/
...
Commands:
  /q, /exit  退出
  /reset     重置 kvcache
  /dd        删除一轮对话
  /pp        打印历史对话
Ctrl+C: 停止当前生成
----------------------------------------
prompt >> 你好
11:01:53.634 INF Run:4680 | ttft: 417.09 ms
<think>
好的，用户打招呼说“你好”，我应该回应一个友好的问候。可能需要确认他们是否需要帮助，或者只是想聊聊天。保持友好和开放的态度，让用户感到被欢迎。可以简单回应“你好！有什么我可以帮助你的吗？”这样既礼貌又明确，同时为用户提供进一步帮助的途径。确保语言自然，避免过于机械化的回复。
</think>

你好！有什么我可以帮助你的吗？

11:02:15.661 NTC Run:5095 | hit eos,decode avg 4.00 token/s
```

输入 `/q` 或 `/exit` 退出。

### OpenAI 兼容 API 服务模式

<NewCodeBlock tip="Host" type="device">

```bash
axllm serve Qwen3-1.7B/
```

</NewCodeBlock>

服务启动后，可通过 HTTP 请求调用：

```python
from openai import OpenAI

API_URL = "http:" + "//127.0.0.1:8000/v1"
MODEL = "Qwen3-1.7B"

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

| 模型       | 量化方式 | host 设备 | TTFT      | 生成速度     |
| ---------- | -------- | --------- | --------- | ------------ |
| Qwen3-1.7B | w8a16    | ROCK 5B+  | 417.09 ms | 4.00 token/s |

:::info

- **TTFT** (Time To First Token)：首 token 延迟
- **生成速度**：单位为 tokens/second
- **测试平台**：Rock 5B Plus + AX-M1
  :::
