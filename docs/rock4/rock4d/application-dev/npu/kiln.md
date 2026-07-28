---
sidebar_position: 25

doc_kind: page
source_of_truth: local
title: "Kiln：在主线内核上运行本地 LLM + 视觉（NPU）"
description: "使用 Kiln 在 ROCK 4D 上，于主线 Linux 内核运行厂商 RKLLM/RKNN NPU 栈：一条命令装好本地大模型对话、图像识别，以及 OpenAI 兼容 API（可接 Open WebUI）。"
locale: zh
board: rock4d
task_type: getting-started
last_verified: 2026-07-11
---

# Kiln：在主线内核上运行本地 LLM + 视觉（NPU）

本教程带你在 **ROCK 4D（RK3576）** 上，用 [Kiln](https://github.com/gahingwoo/kiln) 从零搭起一个
**私有、离线**的 AI 环境：在 NPU 上跟本地大模型对话、给图片做分类 / 目标检测，并暴露成 **OpenAI
兼容的 API**（可直接接 Open WebUI 这类 ChatGPT 式网页）。整个过程数据不出设备、无需联网推理、不用
API key。

Kiln 的特别之处是它运行在**主线 Linux 内核**（`linux-7.1.3`）上，而非厂商 6.1 BSP：它把厂商 GPL
`rknpu` 驱动以 out-of-tree 方式编译，配上闭源的 `librkllmrt`（大模型）/ `librknnrt`（视觉）运行时，
再加一小组针对 RK3576 NPU 的内核补丁（时钟 / 电源域 / 双 IOMMU），让 NPU 在主线内核上正常工作。

装好后你会得到这些命令：

| 命令           | 作用                                                |
| -------------- | --------------------------------------------------- |
| `kiln`         | 总入口菜单：对话 / 视觉 / 模型 / 服务 / 设置 / 诊断 |
| `kiln-chat`    | 在 NPU 上跟本地大模型对话                           |
| `kiln-vision`  | 图像分类 / YOLO 目标检测                            |
| `kiln-serve`   | OpenAI 兼容 HTTP API（接 Open WebUI、LangChain 等） |
| `kiln-convert` | 在板子上把 ONNX 转成 `.rknn`                        |
| `kiln-config`  | 配置 TUI（模型 / 参数 / 服务）                      |
| `kiln-doctor`  | 健康检查                                            |

:::note
Kiln 是独立的第三方开源项目，不属于 Radxa 官方支持范围。问题与反馈请到其
[仓库](https://github.com/gahingwoo/kiln)。目前它只在 ROCK 4D（RK3576）上做过完整验证。
:::

## Prerequisites

- 一块 **ROCK 4D（RK3576）**，运行 **Armbian**。
- 可用网络（首次安装需要联网下载内核与运行时；**以太网最稳**）。
- 模型自备（Kiln 不附带任何模型）：
  - **视觉**：无需自备，下面用 `kiln-convert` 在板上现转一个 MobileNet 分类器。
  - **大模型**：准备一个与 `librkllmrt` **1.2.0** 匹配的 `*-rk3576-w4a16.rkllm`（例如 Qwen2.5-1.5B
    或 Llama-3.2-1B），稍后放进 `/opt/models`。

## Steps

### 1. 安装

在 ROCK 4D 上执行这条命令：

```bash
curl -fsSL https://raw.githubusercontent.com/gahingwoo/kiln/main/scripts/kiln-install.sh | bash
```

它是**免手动**的：预下载所需内容、装上 Kiln 主线内核，然后**自己重启两次（共约 10–15 分钟）**完成
安装并进入就绪系统。

:::caution
安装过程中板子会自动重启两次，**请勿断电**。两次重启之间板载 Wi-Fi 会短暂断开——这是预期的，安装的
第二阶段离线完成、不需要网络。
:::

:::tip
想自己掌控重启，用**手动模式**——把脚本管道给带环境变量的 bash（它会告诉你何时重启、何时再跑一遍）：

```bash
curl -fsSL https://raw.githubusercontent.com/gahingwoo/kiln/main/scripts/kiln-install.sh | KILN_MANUAL=1 bash
```

:::

### 2. 验证安装

装完登录后，跑健康检查：

```bash
kiln-doctor
```

关键项应为 `[ OK ]`：

```text
NPU driver (rknpu)
  [ OK ] rknpu loaded
  [ OK ] render node present (/dev/dri/renderD128)

NPU MMU state (dmesg)
  [ OK ] all four MMU banks enabled (st=0x19/0x19/0x19/0x19)

Runtimes
  [ OK ] librkllmrt.so  RKLLM SDK (version: 1.2.0 ...)
  [ OK ] librknnrt.so   librknnrt version: 2.3.0 ...
```

看到 `rknpu loaded`、`renderD128`、四个 MMU bank `0x19`、以及两个运行时版本，就说明 NPU 已就绪。

### 3. 图像识别（视觉）

先在板上现转一个 MobileNet 分类器（首次会安装 rknn-toolkit2，约几分钟），再跑一张测试图：

```bash
kiln-convert mobilenet --set-active
kiln-vision /opt/models/test.jpg
```

预期输出（NPU 推理约 6 ms）：

```text
top-5 of 1000 classes  (NPU inference 5.9 ms):
  1. [ 494] chime, bell, gong            18.6719
  ...
[bench] rknn inference: 5.9 ms (169.5 fps)
```

想做**目标检测**（YOLO），转一个检测器并给第二个路径参数保存带框图：

```bash
kiln-convert yolov8n --set-active
kiln-vision /opt/models/test.jpg out.jpg
```

### 4. 大模型对话

把一个匹配 `librkllmrt` 1.2.0 的 `*-rk3576-w4a16.rkllm` 放进 `/opt/models`（从你的电脑 `scp` 过去），
然后：

```bash
kiln-chat
```

`kiln-chat` 会自动发现 `/opt/models` 里的 `.rkllm`，每轮回复后打印一行速度基准：

```text
you > 用一句话介绍 RK3576。
bot > ...
[bench] tokens=42  prefill(TTFT)=180 ms  decode=12.8 tok/s  total=...
```

:::tip
在提示符输入单独一个 `/` 回车，会弹出所有斜杠命令的菜单（`/model` 换模型、`/system` 设系统提示等），
不用记也不用先打 `/help`。
:::

### 5. 接入 Open WebUI / OpenAI 客户端

`kiln-serve` 把大模型放到一个 OpenAI 兼容的 HTTP API 后面，任何 OpenAI 客户端换个 base URL 就能用。

在板子上启动服务：

```bash
kiln-serve
```

它会打印**填好板子 IP 的连接串**，直接抄用即可：

```text
kiln-serve: ready [chat+classify]. Listening on 0.0.0.0:8080  (OpenAI /v1)
  -> Open WebUI / OpenAI:  OPENAI_API_BASE_URL=http://<board-ip>:8080/v1   (API key: any)
  -> test:                 curl http://<board-ip>:8080/v1/models
```

在**你的电脑**上用 Docker 跑 [Open WebUI](https://github.com/open-webui/open-webui)，指向板子（把
IP 换成上面打印的那个）：

```bash
docker run -d -p 3000:8080 -e OPENAI_API_BASE_URL=http://<board-ip>:8080/v1 -e OPENAI_API_KEY=kiln ghcr.io/open-webui/open-webui:main
```

然后打开 `localhost:3000`，模型选择器里就有板子上的模型，对话逐 token 从 NPU 流式输出。

用 `openai` SDK 也一样（只改 base URL）：

```python
from openai import OpenAI
client = OpenAI(base_url="http://<board-ip>:8080/v1", api_key="kiln")
r = client.chat.completions.create(model="kiln", messages=[{"role": "user", "content": "hello"}])
print(r.choices[0].message.content)
```

:::tip
`[server] host` 必须是 `0.0.0.0` 才能从别的机器连；若是 `127.0.0.1` 只有本机能连（`kiln-doctor`
会提醒）。改法：`kiln-config` → Server。
:::

### 6. 转换你自己的模型

`kiln-convert` 在板子上把 ONNX 转成版本匹配的 `.rknn`，无需 x86 机器：

```bash
kiln-convert mobilenet            # 拉 MobileNet + 转（分类）
kiln-convert yolov8n              # 拉 YOLOv8n + 转（检测；Ultralytics 为 AGPL，会先询问）
kiln-convert ./my_model.onnx      # 转你自己的 ONNX
```

它首次会建一个私有 `rknn-toolkit2` 环境并**锁到与运行时匹配的版本**，避免版本不匹配导致加载崩溃。
加 `--set-active` 会把结果写进配置、立即可用。

## Validation

到这里你应当已经能：`kiln-doctor` 全绿、`kiln-vision` 正确分类测试图（约 6 ms）、放入 `.rkllm` 后
`kiln-chat` 能对话、`kiln-serve` + Open WebUI 能在网页里聊天。也可以直接跑 `kiln` 打开菜单逐项体验。

## Troubleshooting

- **先跑 `kiln-doctor`**，把完整输出贴到 issue —— 这是最有用的信息。
- `std::out_of_range in rknn_inputs_set`：`.rknn` 用了不匹配的 rknn-toolkit2 版本转的；用
  `kiln-convert` 重转（它会自动锁版本）。
- 检测（YOLO）时崩溃：导出要**关 NMS**（`nms=False`）；`kiln-convert yolov8n` 会自动处理。
- 从别的机器连不上 `kiln-serve`：把 `[server] host` 设成 `0.0.0.0`（`kiln-config` → Server）。
- 更多报错对照 Kiln 的
  [故障排查文档](https://github.com/gahingwoo/kiln/blob/main/docs/zh/TROUBLESHOOTING.md)。

## 参考

- Kiln 仓库：[gahingwoo/kiln](https://github.com/gahingwoo/kiln)
- Kiln 中文文档：[README.zh-CN.md](https://github.com/gahingwoo/kiln/blob/main/README.zh-CN.md)
- Open WebUI 接入：[docs/zh/OPENWEBUI.md](https://github.com/gahingwoo/kiln/blob/main/docs/zh/OPENWEBUI.md)
