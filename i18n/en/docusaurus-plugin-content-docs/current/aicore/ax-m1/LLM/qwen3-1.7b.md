---
sidebar_position: 1
doc_kind: page
last_verified: 2026-08-19
---

# Qwen3-1.7B

This document explains how to run [Qwen3-1.7B](https://huggingface.co/Qwen/Qwen3-1.7B) on a host device equipped with the Radxa AICore AX-M1.

| Model      | Parameters | Quantization | Hugging Face repo       |
| ---------- | ---------- | ------------ | ----------------------- |
| Qwen3-1.7B | 1.7B       | w8a16        | `AXERA-TECH/Qwen3-1.7B` |

## Install axllm

axllm is an LLM inference tool provided by AXERA. It supports command-line interaction and an OpenAI-compatible API.

**Method 1: Clone the repository and run the install script**

<NewCodeBlock tip="Host" type="device">

```bash
git clone -b axllm https://github.com/AXERA-TECH/ax-llm.git
cd ax-llm
./install.sh
```

</NewCodeBlock>

**Method 2: One-line install (default branch `axllm`)**

<NewCodeBlock tip="Host" type="device">

```bash
curl -fsSL https://raw.githubusercontent.com/AXERA-TECH/ax-llm/axllm/install.sh | bash
```

</NewCodeBlock>

**Method 3: Download the executable from GitHub Actions CI**

If you do not have a build environment, go to [ax-llm Actions](https://github.com/AXERA-TECH/ax-llm/actions?query=branch%3Aaxllm) and download the latest CI-exported executable:

<NewCodeBlock tip="Host" type="device">

```bash
chmod +x axllm
sudo mv axllm /usr/bin/axllm
```

</NewCodeBlock>

## Download the model

### Create a virtual environment and install huggingface_hub

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install huggingface_hub
```

</NewCodeBlock>

### Download the model

<NewCodeBlock tip="Host" type="device">

```bash
hf download AXERA-TECH/Qwen3-1.7B --local-dir ./Qwen3-1.7B
```

</NewCodeBlock>

## Run the model

### Command-line interactive mode

<NewCodeBlock tip="Host" type="device">

```bash
axllm run Qwen3-1.7B/
```

</NewCodeBlock>

```shell
$ axllm run Qwen3-1.7B/
...
prompt >> Hello
02:20:16.368 INF Run:4680 | ttft: 412.75 ms
<think>
Okay, the user said "Hello". I need to respond appropriately. Since they didn't ask a question, I should greet them back and offer assistance. Maybe say something like "Hello!" and ask how I can help. Keep it friendly and open-ended. Let me make sure it's concise and polite.
</think>

Hello!

How can I assist you today?

02:20:35.696 NTC Run:5095 | hit eos,decode avg 3.93 token/s
```

Enter `/q` or `/exit` to quit.

### OpenAI-compatible API server

<NewCodeBlock tip="Host" type="device">

```bash
axllm serve Qwen3-1.7B/
```

</NewCodeBlock>

After the server starts, you can call it over HTTP:

```python
from openai import OpenAI

API_URL = "http:" + "//127.0.0.1:8000/v1"
MODEL = "Qwen3-1.7B"

messages = [
    {"role": "system", "content": [{"type": "text", "text": "You are a helpful AI assistant."}]},
    {"role": "user", "content": "Hello"},
]

client = OpenAI(api_key="not-needed", base_url=API_URL)
completion = client.chat.completions.create(
    model=MODEL,
    messages=messages,
)

print(completion.choices[0].message.content)
```

## Performance

| Model      | Quantization | Host device | TTFT      | Generation speed |
| ---------- | ------------ | ----------- | --------- | ---------------- |
| Qwen3-1.7B | w8a16        | ROCK 5B+    | 417.09 ms | 4.00 token/s     |

:::info

- **TTFT** (Time To First Token): time to the first token
- **Generation speed**: tokens/second
- **Test platform**: ROCK 5B+ with AX-M1
  :::
