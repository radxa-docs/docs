---
sidebar_position: 25

doc_kind: page
source_of_truth: local
title: "Kiln: local LLM + vision on the NPU (mainline kernel)"
description: "Use Kiln on the ROCK 4D to run the vendor RKLLM/RKNN NPU stack on a mainline Linux kernel: one command for a local LLM chat, image recognition, and an OpenAI-compatible API you can point Open WebUI at."
locale: en
board: rock4d
task_type: getting-started
last_verified: 2026-07-11
---

# Kiln: local LLM + vision on the NPU (mainline kernel)

This tutorial walks you through building a **private, offline** AI setup on the
**ROCK 4D (RK3576)** with [Kiln](https://github.com/gahingwoo/kiln): chat with a local
LLM on the NPU, classify / detect objects in images, and expose an **OpenAI-compatible
API** (which you can point a ChatGPT-style web UI like Open WebUI at). Nothing leaves the
device — no cloud, no API keys.

What makes Kiln different is that it runs on a **mainline Linux kernel** (`linux-7.1.3`)
instead of the vendor 6.1 BSP: it builds the vendor GPL `rknpu` driver out-of-tree, drives
it with the closed `librkllmrt` (LLM) / `librknnrt` (vision) runtimes, and adds a small set
of RK3576 NPU kernel patches (clock / power-domain / two-IOMMU) so the NPU works on a
mainline kernel.

After installing you get these commands:

| Command        | What it does                                                           |
| -------------- | ---------------------------------------------------------------------- |
| `kiln`         | Umbrella menu: chat / vision / models / serve / settings / diagnostics |
| `kiln-chat`    | Chat with a local LLM on the NPU                                       |
| `kiln-vision`  | Image classification / YOLO object detection                           |
| `kiln-serve`   | OpenAI-compatible HTTP API (Open WebUI, LangChain, …)                  |
| `kiln-convert` | Convert an ONNX to `.rknn` on the board                                |
| `kiln-config`  | Config TUI (models / parameters / server)                              |
| `kiln-doctor`  | Health check                                                           |

:::note
Kiln is an independent third-party open-source project, not part of official Radxa
support. Report issues on its [repository](https://github.com/gahingwoo/kiln). It has been
fully validated only on the ROCK 4D (RK3576).
:::

## Prerequisites

- A **ROCK 4D (RK3576)** running **Armbian**.
- A working network (the first install downloads the kernel and runtimes; **Ethernet is
  most reliable**).
- You supply the models (Kiln ships none):
  - **Vision**: nothing to prepare — below you convert a MobileNet classifier on the board
    with `kiln-convert`.
  - **LLM**: a `*-rk3576-w4a16.rkllm` matched to `librkllmrt` **1.2.0** (e.g. Qwen2.5-1.5B
    or Llama-3.2-1B), placed in `/opt/models` later.

## Steps

### 1. Install

Run this on the ROCK 4D:

```bash
curl -fsSL https://raw.githubusercontent.com/gahingwoo/kiln/main/scripts/kiln-install.sh | bash
```

It is hands-off: it pre-downloads what it needs, installs the Kiln mainline kernel, then
**reboots itself twice (~10–15 minutes total)** to finish setup and land in a ready system.

:::caution
The board reboots itself twice during install — **do not cut power**. Onboard Wi-Fi is
briefly down between the reboots; that is expected, as phase 2 finishes offline and does
not need the network.
:::

:::tip
To drive the reboots yourself, use **manual mode** — pipe the script to bash with the
environment variable set (it tells you when to reboot and re-run):

```bash
curl -fsSL https://raw.githubusercontent.com/gahingwoo/kiln/main/scripts/kiln-install.sh | KILN_MANUAL=1 bash
```

:::

### 2. Verify the install

After logging in, run the health check:

```bash
kiln-doctor
```

The key items should read `[ OK ]`:

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

`rknpu loaded`, `renderD128`, the four MMU banks at `0x19`, and both runtime versions mean
the NPU is ready.

### 3. Image recognition (vision)

Convert a MobileNet classifier on the board (the first conversion installs rknn-toolkit2,
a few minutes), then run a test image:

```bash
kiln-convert mobilenet --set-active
kiln-vision /opt/models/test.jpg
```

Expected output (NPU inference ~6 ms):

```text
top-5 of 1000 classes  (NPU inference 5.9 ms):
  1. [ 494] chime, bell, gong            18.6719
  ...
[bench] rknn inference: 5.9 ms (169.5 fps)
```

For **object detection** (YOLO), convert a detector and pass a second path to save an
annotated image:

```bash
kiln-convert yolov8n --set-active
kiln-vision /opt/models/test.jpg out.jpg
```

### 4. LLM chat

Place a `*-rk3576-w4a16.rkllm` matched to `librkllmrt` 1.2.0 in `/opt/models` (scp it from
your computer), then:

```bash
kiln-chat
```

`kiln-chat` auto-discovers any `.rkllm` in `/opt/models` and prints a speed benchmark after
each reply:

```text
you > Describe the RK3576 in one sentence.
bot > ...
[bench] tokens=42  prefill(TTFT)=180 ms  decode=12.8 tok/s  total=...
```

:::tip
Type a lone `/` at the prompt to open a menu of the slash commands (`/model` to switch
model, `/system` to set a system prompt, etc.) — no need to memorize them or run `/help`.
:::

### 5. Connect Open WebUI / an OpenAI client

`kiln-serve` puts the LLM behind an OpenAI-compatible HTTP API, so any OpenAI client works
by just changing the base URL.

Start the server on the board:

```bash
kiln-serve
```

It prints a **connection string with the board's IP already filled in** — copy it:

```text
kiln-serve: ready [chat+classify]. Listening on 0.0.0.0:8080  (OpenAI /v1)
  -> Open WebUI / OpenAI:  OPENAI_API_BASE_URL=http://<board-ip>:8080/v1   (API key: any)
  -> test:                 curl http://<board-ip>:8080/v1/models
```

On **your computer**, run [Open WebUI](https://github.com/open-webui/open-webui) with
Docker, pointing it at the board (replace the IP with the one printed above):

```bash
docker run -d -p 3000:8080 -e OPENAI_API_BASE_URL=http://<board-ip>:8080/v1 -e OPENAI_API_KEY=kiln ghcr.io/open-webui/open-webui:main
```

Open `localhost:3000`; the board's model appears in the picker and chat streams
token-by-token off the NPU.

The `openai` SDK works the same way (just the base URL changes):

```python
from openai import OpenAI
client = OpenAI(base_url="http://<board-ip>:8080/v1", api_key="kiln")
r = client.chat.completions.create(model="kiln", messages=[{"role": "user", "content": "hello"}])
print(r.choices[0].message.content)
```

:::tip
`[server] host` must be `0.0.0.0` to accept connections from other machines; `127.0.0.1`
is local-only (`kiln-doctor` warns about it). Change it via `kiln-config` → Server.
:::

### 6. Convert your own models

`kiln-convert` turns an ONNX into a version-matched `.rknn` on the board — no x86 machine:

```bash
kiln-convert mobilenet            # pull MobileNet + convert (classify)
kiln-convert yolov8n              # pull YOLOv8n + convert (detect; Ultralytics is AGPL, it asks)
kiln-convert ./my_model.onnx      # convert your own ONNX
```

On first use it builds a private `rknn-toolkit2` environment **pinned to your runtime
version**, so a converted model can't be version-mismatched. Add `--set-active` to write
the result into the config for immediate use.

## Validation

At this point you should be able to: get an all-green `kiln-doctor`, classify the test image
with `kiln-vision` (~6 ms), chat with `kiln-chat` once a `.rkllm` is in place, and chat from
a web page via `kiln-serve` + Open WebUI. You can also just run `kiln` for a menu of all of
the above.

## Troubleshooting

- **Run `kiln-doctor` first** and paste its full output into an issue — it's the most useful
  thing to include.
- `std::out_of_range in rknn_inputs_set`: the `.rknn` was converted with a mismatched
  rknn-toolkit2 version; reconvert with `kiln-convert` (it pins the matching version).
- Crash on a YOLO model: export with **NMS off** (`nms=False`); `kiln-convert yolov8n`
  handles this for you.
- Can't reach `kiln-serve` from another machine: set `[server] host` to `0.0.0.0`
  (`kiln-config` → Server).
- For more errors see Kiln's
  [troubleshooting guide](https://github.com/gahingwoo/kiln/blob/main/docs/TROUBLESHOOTING.md).

## References

- Kiln repository: [gahingwoo/kiln](https://github.com/gahingwoo/kiln)
- Kiln documentation: [README.md](https://github.com/gahingwoo/kiln/blob/main/README.md)
- Open WebUI integration: [docs/OPENWEBUI.md](https://github.com/gahingwoo/kiln/blob/main/docs/OPENWEBUI.md)
