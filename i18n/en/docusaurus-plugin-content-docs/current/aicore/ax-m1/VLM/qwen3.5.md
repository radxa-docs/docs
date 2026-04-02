---
sidebar_position: 5
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Qwen3.5

Qwen3.5 is a native multimodal large model released by Alibaba Cloud's Tongyi Lab in **February 2026**, using a hybrid architecture (linear attention + MoE) with 397 billion total parameters and 17 billion activated parameters, supporting **201 languages**, and performing excellently in reasoning, programming, agent capabilities, and multimodal understanding.

This document demonstrates how to run this series of models on Radxa AX-M1.:

| Model        | Parameters | Quantization | Hugging Face Repo                                          |
| ------------ | ---------- | ------------ | ---------------------------------------------------------- |
| Qwen3.5-0.8B | 0.8B       | w8a16        | `AXERA-TECH/Qwen3.5-0.8B-AX650-C128-P1152-CTX2047`         |
| Qwen3.5-2B   | 2B         | w8a16        | `AXERA-TECH/Qwen3.5-2B-AX650-C128-P1152-CTX2047`           |
| Qwen3.5-4B   | 4B         | GPTQ-Int4    | `AXERA-TECH/Qwen3.5-4B-AX650-GPTQ-Int4-C128-P1152-CTX2047` |

## Install axllm

axllm is an LLM inference tool provided by AXERA, supporting command-line interaction and OpenAI-compatible API.

**Method 1: Clone the repo and run the install script**

```shell
git clone -b axllm https://github.com/AXERA-TECH/ax-llm.git
cd ax-llm
./install.sh
```

**Method 2: One-line install (default branch `axllm`)**

```shell
curl -fsSL https://raw.githubusercontent.com/AXERA-TECH/ax-llm/axllm/install.sh | bash
```

**Method 3: Download executable from GitHub Actions CI**

If you don't have a build environment, go to [ax-llm Actions](https://github.com/AXERA-TECH/ax-llm/actions?query=branch%3Aaxllm) to download the latest CI-exported executable:

```shell
chmod +x axllm
sudo mv axllm /usr/bin/axllm
```

## Download Model

### Create virtual environment and install huggingface_hub

```shell
python3 -m venv .venv
source .venv/bin/activate
pip install huggingface_hub
```

### Download model

<Tabs groupId="qwen35-model" queryString>
<TabItem value="08b">

```shell
mkdir -p Qwen3.5-0.8B
cd Qwen3.5-0.8B
hf download AXERA-TECH/Qwen3.5-0.8B-AX650-C128-P1152-CTX2047 --local-dir .
```

</TabItem>
<TabItem value="2b" default>

```shell
mkdir -p Qwen3.5-2B
cd Qwen3.5-2B
hf download AXERA-TECH/Qwen3.5-2B-AX650-C128-P1152-CTX2047 --local-dir .
```

</TabItem>
<TabItem value="4b">

```shell
mkdir -p Qwen3.5-4B
cd Qwen3.5-4B
hf download AXERA-TECH/Qwen3.5-4B-AX650-GPTQ-Int4-C128-P1152-CTX2047 --local-dir .
```

</TabItem>
</Tabs>

## Run Model

### Command-line interactive mode

<Tabs groupId="qwen35-model" queryString>
<TabItem value="08b">

```shell
axllm run Qwen3.5-0.8B/
```

</TabItem>
<TabItem value="2b" default>

```shell
axllm run Qwen3.5-2B/
```

</TabItem>
<TabItem value="4b">

```shell
axllm run Qwen3.5-4B/
```

</TabItem>
</Tabs>

**VLM Usage Instructions:**

- After entering `prompt`, you'll see `image >>`
  - Press Enter directly: Text-only conversation
  - Enter image path: Image + text conversation
  - Enter `video:<frames_dir>`: Video/multi-frame conversation

:::tip Usage Tip
If you typo and delete when entering the image path, the image path may not be recognized correctly. In this case, enter `/reset` to reset kvcache and re-enter.
:::

![Qwen3.5 example](/img/aicore-ax-m1/qwen3.5-example.webp)

<Tabs groupId="qwen35-model" queryString>
<TabItem value="08b">

```shell
$ axllm run Qwen3.5-0.8B/
...
Commands:
  /q, /exit  exit  /reset     reset kvcache
  /dd        delete one turn  /pp        print historyCtrl+C: stop current generationVLM enabled: after each prompt, input image path (empty = text-only). Use "video:<frames_dir>" for video.
----------------------------------------
prompt >>What is this picture about?
image >> ./image.png
18:47:34.460 INF Run:1023 | ttft: 906.48 ms

This image appears to be a composite image with a filter effect applied. The image shows several astronauts (which appear to be AI-generated) in a dense bamboo forest. Their poses resemble preparation for launch or a spacewalk test. The image has a black and white toning with strong backlighting, creating a mysterious, tense, or sci-fi atmosphere. This style closely resembles generative art or 3D rendering software like Midjourney or Stable Diffusion.

18:47:40.729 NTC Run:1145 | hit eos,avg 6.86 token/s
```

</TabItem>
<TabItem value="2b" default>

```shell
$ axllm run Qwen3.5-2B/
...
Commands:
  /q, /exit  exit  /reset     reset kvcache
  /dd        delete one turn  /pp        print historyCtrl+C: stop current generationVLM enabled: after each prompt, input image path (empty = text-only). Use "video:<frames_dir>" for video.
----------------------------------------
prompt >>What is this picture about?
image >> ./image.png
18:51:33.945 INF Run:1023 | ttft: 1128.69 ms

This image depicts three astronauts in white spacesuits with reflective visors, standing in a lush green forest. The forest is filled with bamboo-like plants and tall trees, and the background is a dim forest environment. This scene conveys a sense of exploration into a mysterious and possibly alien world, emphasizing the contrast between the high technology of the spacesuits and the primitive, untouched natural environment. This could be a representation of a space exploration mission or a science fiction story about human exploration.

18:52:01.604 NTC Run:1145 | hit eos,avg 4.41 token/s
```

</TabItem>
<TabItem value="4b">

```shell
$ axllm run Qwen3.5-4B/
...
Commands:
  /q, /exit  exit  /reset     reset kvcache
  /dd        delete one turn  /pp        print historyCtrl+C: stop current generationVLM enabled: after each prompt, input image path (empty = text-only). Use "video:<frames_dir>" for video.
----------------------------------------
prompt >>What is this picture about?
image >> ./image.png
18:53:42.571 INF Run:1023 | ttft: 2158.10 ms

This image presents a surreal scene with three astronauts standing in a dense forest or jungle.

Here are the specific details of the scene:

- **Subjects**: Three individuals in bulky white spacesuits with helmets. They seem to be looking around or observing their surroundings.
- **Setting**: They are in a lush green environment. The background is filled with tall trees and vegetation resembling bamboo or palm trees, suggesting a tropical or temperate forest.
- **Atmosphere**: The image creates a sense of mystery and sci-fi adventure. It implies a narrative where space travelers may have landed on Earth to investigate an alien civilization or a lost civilization on Earth.
- **Visual Style**: The image has a slightly grainy, soft-focus quality, which is characteristic of AI-generated images or stylized digital photography. The lighting is somewhat muted, giving the scene a mysterious or early morning feel.

18:57:35.909 NTC Run:1145 | hit eos,avg 3.12 token/s
```

</TabItem>
</Tabs>

### OpenAI-compatible API server mode

<Tabs groupId="qwen35-model" queryString>
<TabItem value="08b">

```shell
axllm serve Qwen3.5-0.8B/
```

</TabItem>
<TabItem value="2b" default>

```shell
axllm serve Qwen3.5-2B/
```

</TabItem>
<TabItem value="4b">

```shell
axllm serve Qwen3.5-4B/
```

</TabItem>
</Tabs>

After the server starts, you can call it via HTTP requests:

<Tabs groupId="qwen35-model" queryString>
<TabItem value="08b">

```python
from openai import OpenAI

API_URL = "http://127.0.0.1:8000/v1"
MODEL = "Qwen3.5-0.8B"

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

</TabItem>
<TabItem value="2b" default>

```python
from openai import OpenAI

API_URL = "http://127.0.0.1:8000/v1"
MODEL = "Qwen3.5-2B"

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

</TabItem>
<TabItem value="4b">

```python
from openai import OpenAI

API_URL = "http://127.0.0.1:8000/v1"
MODEL = "Qwen3.5-4B"

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

</TabItem>
</Tabs>

## Performance

| Model        | Input Size | Image Count | TTFT       | Generation Speed | CMM Memory |
| ------------ | ---------- | ----------- | ---------- | ---------------- | ---------- |
| Qwen3.5-0.8B | 384×384    | 1           | 906.48 ms  | 6.86 token/s     | 1159 MB    |
| Qwen3.5-2B   | 384×384    | 1           | 1128.69 ms | 4.40 tokens/s    | 2645 MB    |
| Qwen3.5-4B   | 384×384    | 1           | 2192.79 ms | 3.10 tokens/s    | 3608 MB    |

:::info

- **TTFT** (Time To First Token): First token latency
- **Generation Speed**: Unit is tokens/second
- **Test Platform**: Rock 5B Plus + AX-M1
  :::
