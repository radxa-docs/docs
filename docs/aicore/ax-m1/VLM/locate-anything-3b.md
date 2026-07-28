---
sidebar_position: 7
doc_kind: page
title: "LocateAnything-3B"
description: "在 AX-M1 8 GB 上部署 LocateAnything-3B，并通过命令行、OpenAI 兼容 API 和 WebUI 完成图像目标定位。"
locale: zh
product: aicore
board: ax-m1
task_type: inference
source_of_truth: local
---

# LocateAnything-3B

本文介绍如何在安装了 Radxa 智核 AX-M1 8 GB 的宿主设备上运行
[LocateAnything-3B](https://huggingface.co/AXERA-TECH/LocateAnything-3B)。该模型可以根据类别或自然语言描述，输出图像中目标的边界框或定位点。

本页面使用的预编译模型采用 W4A16 量化，输入图像尺寸为 560 × 560，模型包约占用 3.2 GiB 存储空间。模型运行时需要约 2.9 GiB CMM，因此建议使用 AX-M1 8 GB。

## 前置条件

- AX-M1 8 GB 已安装到 AArch64 Linux 宿主设备。
- 已按照[环境安装](../getting-started/env_install)完成 AXCL 驱动和固件安装，`axcl-smi` 可以正常识别 AX-M1。
- 宿主设备可以访问 GitHub 和 Hugging Face，并有至少 4 GiB 可用存储空间。
- 当前用户可以使用 `sudo` 安装 `axllm`。

## 操作步骤

### 检查 AX-M1 CMM

运行模型前检查 CMM 总量和剩余空间：

<NewCodeBlock tip="Host" type="device">

```bash
axcl-smi info --cmm
```

</NewCodeBlock>

AX-M1 8 GB 的 CMM 总量应接近以下数值：

```text
CMM Total           :  7208960 KiB
```

确保 `CMM Remain` 大于 3 GiB。如果剩余空间不足，请先退出其他使用 AX-M1 的程序。

### 安装 axllm

`axllm` 是 AXERA 提供的 LLM/VLM 推理工具，支持终端交互和 OpenAI 兼容 API。克隆官方仓库并运行安装脚本：

<NewCodeBlock tip="Host" type="device">

```bash
cd ~
git clone -b axllm https://github.com/AXERA-TECH/ax-llm.git
cd ax-llm
./install.sh
axllm --version
```

</NewCodeBlock>

确认版本信息中的后端和平台与宿主设备一致：

```text
backend          : AXCL
platform         : Linux aarch64
```

### 下载模型

创建 Python 虚拟环境，安装 Hugging Face 命令行工具并下载模型：

<NewCodeBlock tip="Host" type="device">

```bash
mkdir -p ~/ax-m1-models
cd ~/ax-m1-models
python3 -m venv .venv
source .venv/bin/activate
pip install -U huggingface_hub
hf download AXERA-TECH/LocateAnything-3B --local-dir ./locate-anything-3b
```

</NewCodeBlock>

确认运行所需的主要文件已经下载：

<NewCodeBlock tip="Host" type="device">

```bash
cd ~/ax-m1-models/locate-anything-3b
test -f config.json
test -f image_encoder_mlp.axmodel
test -f qwen2_post.axmodel
test -f qwen2_5_tokenizer.txt
```

</NewCodeBlock>

### 运行终端交互推理

启动模型：

<NewCodeBlock tip="Host" type="device">

```bash
cd ~/ax-m1-models/locate-anything-3b
axllm run .
```

</NewCodeBlock>

模型加载完成后，输入提示词和测试图片路径：

```text
prompt >> 找到图中的人
media >> ./test_data/locate-anything-online.jpg
```

模型会返回 `<ref>` 标签和一个或多个 `<box>`：

```text
<ref>人</ref><box><342><0><399><55></box><box><646><45><971><1000></box><box><842><0><950><200></box>
```

坐标使用 `0` 到 `1000` 的归一化空间，边界框格式为：

```text
<x_min><y_min><x_max><y_max>
```

输入 `/q` 退出交互程序。

### 启动 OpenAI 兼容 API

在模型目录启动服务：

<NewCodeBlock tip="Host" type="device">

```bash
cd ~/ax-m1-models/locate-anything-3b
axllm serve . --port 8010
```

</NewCodeBlock>

模型加载完成后，服务会显示以下接口：

```text
GET  /health
GET  /v1/models
POST /v1/chat/completions
```

打开另一个终端，检查服务状态和模型 ID：

<NewCodeBlock tip="Host" type="device">

```bash
API_BASE="http:"'//127.0.0.1:8010'
curl --fail "${API_BASE}/health"
curl --fail "${API_BASE}/v1/models"
```

</NewCodeBlock>

健康检查应返回 `"status": "healthy"`，模型列表应包含：

```text
AXERA-TECH/LocateAnything-3B
```

当前服务的最大并发数为 1。业务程序可以通过 `/v1/chat/completions` 接口发送 OpenAI 兼容的多模态请求。

### 启动轻量 WebUI

保持 `axllm serve` 运行，在另一个终端启动模型包附带的 WebUI：

<NewCodeBlock tip="Host" type="device">

```bash
cd ~/ax-m1-models/locate-anything-3b
API_BASE="http:"'//127.0.0.1:8010'
python3 ./locateanything_webui.py \
  --host 0.0.0.0 \
  --port 7861 \
  --serve-url "${API_BASE}" \
  --image-dir ./pexels-images \
  --model AXERA-TECH/LocateAnything-3B
```

</NewCodeBlock>

在同一局域网的浏览器中访问宿主设备 IP 地址的 7861 端口。界面支持上传图片、目标检测、短语定位、文字区域定位、文档版面分析和 GUI 元素定位，并在画布上绘制模型返回的框或点。

选择任务和检测类别后，可以预览待处理图片：

![LocateAnything WebUI 推理前界面](/img/aicore-ax-m1/locate-anything-webui-ready.webp)

网页默认提供 `person` 类别；示例中还添加了 `shoes` 类别。点击 **Detect** 后，可以看到模型也能较好地识别人物的鞋子：

![LocateAnything WebUI 检测结果](/img/aicore-ax-m1/locate-anything-webui-result.webp)

:::note
当前模型包中的 `locateanything_webui.py` 位于模型目录根部。如果模型包的 README 仍使用 `scripts/locateanything_webui.py`，请以实际下载的文件路径为准。
:::

:::info 其他运行方式
模型包还提供基于 pyaxengine 的单进程 WebUI 和纯命令行推理方式。相关依赖、参数及最新用法请参考 [模型仓库 README](https://huggingface.co/AXERA-TECH/LocateAnything-3B)。
:::

## 预期输出

`axllm run` 完成模型加载后会显示 `prompt >>`，并在推理后返回 `<ref>` 和 `<box>` 标签。`axllm serve` 完成加载后会监听 8010 端口，健康检查返回 `"status": "healthy"`，模型列表包含 `AXERA-TECH/LocateAnything-3B`。

以下数据在 ROCK 5B+ 和 AX-M1 8 GB 上使用模型附带的测试图片获得，仅供性能参考：

| 指标                |                     参考值 |
| ------------------- | -------------------------: |
| 模型完整初始化      |                   约 73 秒 |
| 输入长度            |                 431 tokens |
| Prefill 分块        |                          4 |
| TTFT                |                 2385.18 ms |
| Decode 速度         |              3.60 tokens/s |
| 模型驻留时 CMM Used | 2861176 KiB（约 2.73 GiB） |
| 模型退出后 CMM Used |     18876 KiB（约 18 MiB） |

TTFT 数据命中了测试图片的视觉缓存；首次处理新图片时，TTFT 通常会更高。性能会随宿主设备、运行时版本、提示词长度和图片缓存状态变化。

## 验证

完成以下检查以确认部署成功：

1. `axllm run` 能完整加载模型并返回 `<ref>` 和 `<box>` 标签。
2. 健康检查命令返回健康状态。
3. `/v1/models` 返回模型 ID `AXERA-TECH/LocateAnything-3B`。
4. 退出 `axllm` 后再次检查 CMM：

<NewCodeBlock tip="Host" type="device">

```bash
axcl-smi info --cmm
```

</NewCodeBlock>

`CMM Used` 应回落到启动模型前的基线。如果没有回落，请检查是否仍有 `axllm` 或 WebUI 进程运行。

## 停止服务

在前台运行 `axllm serve` 和 WebUI 的终端中分别按 `Ctrl+C`。确认端口已经释放：

<NewCodeBlock tip="Host" type="device">

```bash
ss -ltnp | grep -E ':(7861|8010)'
```

</NewCodeBlock>

命令没有输出表示两个端口均未被监听。
