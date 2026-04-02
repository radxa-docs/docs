---
sidebar_position: 5
---

# Qwen3.5

Qwen3.5 是阿里云通义实验室于 **26年2月份** 发布的原生多模态大模型，采用混合架构（线性注意力 + MoE），总参数量 3970 亿、激活 170 亿参数，支持 **201 种语言**，在推理、编程、智能体能力与多模态理解方面表现优异。

本文档演示如何在瑞莎 AX-M1 上运行该系列模型：

| 模型         | 参数量 | 量化方式  | Hugging Face 仓库                                          |
| ------------ | ------ | --------- | ---------------------------------------------------------- |
| Qwen3.5-0.8B | 0.8B   | w8a16     | `AXERA-TECH/Qwen3.5-0.8B-AX650-C128-P1152-CTX2047`         |
| Qwen3.5-2B   | 2B     | w8a16     | `AXERA-TECH/Qwen3.5-2B-AX650-C128-P1152-CTX2047`           |
| Qwen3.5-4B   | 4B     | GPTQ-Int4 | `AXERA-TECH/Qwen3.5-4B-AX650-GPTQ-Int4-C128-P1152-CTX2047` |

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

## 运行模型

### 命令行交互模式

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

**VLM 使用说明：**

- 每轮输入 `prompt` 后，会提示 `image >>`
  - 直接回车：本轮仅文本对话
  - 输入图片路径：图文对话
  - 输入 `video:<frames_dir>`：视频/多帧对话

:::tip 使用提示
如果在输入图片路径时打错字再删掉，可能无法正确识别图片路径。遇到这种情况时，请输入 `/reset` 重置 kvcache 后重新输入。
:::

![Qwen3.5 示例图片](/img/aicore-ax-m1/qwen3.5-example.webp)

<Tabs groupId="qwen35-model" queryString>
<TabItem value="08b">

```shell
$ axllm run Qwen3.5-0.8B/
...
Commands:
  /q, /exit  退出  /reset     重置 kvcache
  /dd        删除一轮对话  /pp        打印历史对话
Ctrl+C: 停止当前生成VLM enabled: after each prompt, input image path (empty = text-only). Use "video:<frames_dir>" for video.
----------------------------------------
prompt >>这张图片是关于什么的？
image >> ./image.png
18:47:34.460 INF Run:1023 | ttft: 906.48 ms

这张图片展示了几位宇航员（看起来可能是由AI生成的）在一片茂密的竹林中。他们的姿势像是正在准备发射或进行太空行走测试。图像采用了灰白和黑色的色调，并带有强烈的逆光效果，营造出一种神秘、紧张或者科幻的氛围。

18:47:40.729 NTC Run:1145 | hit eos,avg 6.86 token/s
```

</TabItem>
<TabItem value="2b" default>

```shell
$ axllm run Qwen3.5-2B/
...
Commands:
  /q, /exit  退出  /reset     重置 kvcache
  /dd        删除一轮对话  /pp        打印历史对话
Ctrl+C: 停止当前生成VLM enabled: after each prompt, input image path (empty = text-only). Use "video:<frames_dir>" for video.
----------------------------------------
prompt >>这张图片是关于什么的？
image >> ./image.png
18:51:33.945 INF Run:1023 | ttft: 1128.69 ms

这张图片展示了三位穿着白色宇航服、戴着反光头盔的宇航员，站在一片翠绿的森林中。森林里满是竹子般的植物和高大的树木，背景是一片昏暗的森林环境。这个场景传达出一种探索神秘而可能是外星世界的感觉，强调了宇航服的高科技与原始、未开发的自然环境之间的对比。这可能是太空探索任务或人类探索的科幻故事。

18:52:01.604 NTC Run:1145 | hit eos,avg 4.41 token/s
```

</TabItem>
<TabItem value="4b">

```shell
$ axllm run Qwen3.5-4B/
...
Commands:
  /q, /exit  退出  /reset     重置 kvcache
  /dd        删除一轮对话  /pp        打印历史对话
Ctrl+C: 停止当前生成VLM enabled: after each prompt, input image path (empty = text-only). Use "video:<frames_dir>" for video.
----------------------------------------
prompt >>这张图片是关于什么的？
image >> ./image.png
18:53:42.571 INF Run:1023 | ttft: 2158.10 ms

这张图片展示了一个超现实的场景，三名宇航员站在一片茂密的森林或丛林中。

以下是场景的具体细节：

- **主体**：有三名穿着笨重白色太空探索服、戴着头盔的个人。他们似乎正在环顾四周或观察周围环境。
- **环境**：他们身处一片郁郁葱葱的绿色环境中。背景布满了高大树木和类似竹子或棕榈树的植被，暗示着热带或温带森林。
- **氛围**：图片营造出一种神秘和科幻冒险的感觉。它暗示了一个太空旅行者可能降落在地球上调查外星文明或地球上失落的文明的故事。
- **视觉风格**：图片有一种略带颗粒感、柔焦的质感，这是AI生成图像或风格化数字摄影的典型特征。光线有些柔和，给场景一种神秘或清晨的感觉。

18:57:35.909 NTC Run:1145 | hit eos,avg 3.12 token/s
```

</TabItem>
</Tabs>

### OpenAI 兼容 API 服务模式

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

服务启动后，可通过 HTTP 请求调用：

<Tabs groupId="qwen35-model" queryString>
<TabItem value="08b">

```python
from openai import OpenAI

API_URL = "http://127.0.0.1:8000/v1"
MODEL = "Qwen3.5-0.8B"

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

</TabItem>
<TabItem value="2b" default>

```python
from openai import OpenAI

API_URL = "http://127.0.0.1:8000/v1"
MODEL = "Qwen3.5-2B"

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

</TabItem>
<TabItem value="4b">

```python
from openai import OpenAI

API_URL = "http://127.0.0.1:8000/v1"
MODEL = "Qwen3.5-4B"

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

</TabItem>
</Tabs>

## 性能

| 模型         | 输入尺寸 | 图片数量 | TTFT       | 生成速度      | CMM 内存 |
| ------------ | -------- | -------- | ---------- | ------------- | -------- |
| Qwen3.5-0.8B | 384×384  | 1        | 906.48 ms  | 6.86 token/s  | 1159 MB  |
| Qwen3.5-2B   | 384×384  | 1        | 1128.69 ms | 4.40 tokens/s | 2645 MB  |
| Qwen3.5-4B   | 384×384  | 1        | 2192.79 ms | 3.10 tokens/s | 3608 MB  |

:::info

- **TTFT** (Time To First Token)：首 token 延迟
- **生成速度**：单位为 tokens/second
- **测试平台**：Rock 5B Plus + AX-M1
  :::
