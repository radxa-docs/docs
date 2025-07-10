---
sidebar_position: 1
---

# Ollama 安装

Ollama 是一个强大的本地大语言模型（LLM）运行框架，让用户能够在自己的计算机上高效地运行各种开源大型语言模型。

## Ollama 特点

- 跨平台支持

支持 macOS、Linux 和 Windows 操作系统，满足不同用户群体的需求。

- 简单易用

提供简洁的命令行界面，使得下载、运行和管理大型语言模型变得非常便捷。

- 丰富的模型支持

支持运行多种开源大型语言模型，包括 DeepSeek、Qwen、LLama 等热门模型。

- 本地运行

所有模型都在本地运行，保障数据隐私和安全，无需依赖云端服务。

- 高效性能

针对本地环境优化，充分利用硬件资源，提供流畅的交互体验。

- 开发者友好

提供 API 接口，便于开发者将模型集成到自己的应用程序中。

## 安装 Ollama

我们可以使用官方提供的 Linux 安装脚本来安装 Ollama。

打开终端，下载并运行安装脚本：

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
curl -fsSL https://ollama.com/install.sh | sh
```
</NewCodeBlock>

终端会输出 ollama 的安装进度和安装信息，安装完成会输出类似下面信息：

```
>>> Installing ollama to /usr/local
>>> Downloading Linux arm64 bundle
######################################################################## 100.0%
>>> Creating ollama user...
>>> Adding ollama user to render group...
>>> Adding ollama user to video group...
>>> Adding current user to ollama group...
>>> Creating ollama systemd service...
>>> Enabling and starting ollama service...
Created symlink /etc/systemd/system/default.target.wants/ollama.service → /etc/systemd/system/ollama.service.
>>> The Ollama API is now available at 127.0.0.1:11434.
>>> Install complete. Run "ollama" from the command line.
WARNING: No NVIDIA/AMD GPU detected. Ollama will run in CPU-only mode.
```

## 验证 Ollama

我们可以使用 `ollama -v` 命令来查看 Ollama 的版本信息。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
ollama -v
```
</NewCodeBlock>

如果成功输出 Ollama 的版本号，说明 Ollama 安装成功。
