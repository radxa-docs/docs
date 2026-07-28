---
sidebar_position: 6
---

# Qwen3-VL-2B-Instruct

This document demonstrates how to run the Qwen3-VL-2B-Instruct model on Radxa AX-M1.:

| Model                | Parameters | Quantization | Hugging Face Repo                           |
| -------------------- | ---------- | ------------ | ------------------------------------------- |
| Qwen3-VL-2B-Instruct | 2B         | GPTQ-Int4    | `AXERA-TECH/Qwen3-VL-2B-Instruct-GPTQ-Int4` |

## Install axllm

axllm is an LLM inference tool provided by AXERA, supporting command-line interaction and OpenAI-compatible API.

**Method 1: Clone the repo and run the install script**

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

**Method 3: Download executable from GitHub Actions CI**

If you don't have a build environment, go to [ax-llm Actions](https://github.com/AXERA-TECH/ax-llm/actions?query=branch%3Aaxllm) to download the latest CI-exported executable:

<NewCodeBlock tip="Host" type="device">

```bash
chmod +x axllm
sudo mv axllm /usr/bin/axllm
```

</NewCodeBlock>

## Download Model

### Create virtual environment and install huggingface_hub

<NewCodeBlock tip="Host" type="device">

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install huggingface_hub
```

</NewCodeBlock>

### Download model

<NewCodeBlock tip="Host" type="device">

```bash
hf download AXERA-TECH/Qwen3-VL-2B-Instruct-GPTQ-Int4 --local-dir ./Qwen3-VL-2B
```

</NewCodeBlock>

## Run Model

### Command-line interactive mode

<NewCodeBlock tip="Host" type="device">

```bash
axllm run Qwen3-VL-2B/
```

</NewCodeBlock>

**VLM Usage Instructions:**

- After entering `prompt`, you'll see `image >>`
  - Press Enter directly: Text-only conversation
  - Enter image path: Image + text conversation
  - Enter `video:<frames_dir>`: Video/multi-frame conversation

:::tip Usage Tip
If you typo and delete when entering the image path, the image path may not be recognized correctly. In this case, enter `/reset` to reset kvcache and re-enter.
:::

![Qwen3-VL-2B Example](/img/aicore-ax-m1/qwen3.5-example.webp)

```shell
$ axllm run Qwen3-VL-2B/
...
Commands:
  /q, /exit  exit  /reset     reset kvcache
  /dd        delete one turn  /pp        print history
Ctrl+C: stop current generationVLM enabled: after each prompt, input image path (empty = text-only). Use "video:<frames_dir>" for video.
----------------------------------------
prompt >>What is this picture about?
image >> ./image.png
18:53:42.571 INF Run:1023 | ttft: 740.26 ms

This image depicts astronauts exploring in a jungle. They are wearing white spacesuits, standing among lush green plants, with a dark background and a overall cool tone, creating a mysterious, sci-fi atmosphere.

18:57:35.909 NTC Run:1145 | hit eos,avg 4.65 token/s
```

### OpenAI-compatible API server mode

<NewCodeBlock tip="Host" type="device">

```bash
axllm serve Qwen3-VL-2B/
```

</NewCodeBlock>

After the server starts, you can call it via HTTP requests:

```python
from openai import OpenAI

API_URL = "http:" + "//127.0.0.1:8000/v1"
MODEL = "Qwen3-VL-2B"

messages = [
    {"role": "system", "content": [{"type": "text", "text": "You are a helpful assistant."}]},
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

| Model                | Input Size | Image Count | TTFT      | Generation Speed | CMM Memory |
| -------------------- | ---------- | ----------- | --------- | ---------------- | ---------- |
| Qwen3-VL-2B-Instruct | 384×384    | 1           | 740.26 ms | 4.65 token/s     | 2384 MB    |

:::info

- **TTFT** (Time To First Token): First token latency
- **Generation Speed**: Unit is tokens/second
- **Test Platform**: Rock 5B Plus + AX-M1
  :::
