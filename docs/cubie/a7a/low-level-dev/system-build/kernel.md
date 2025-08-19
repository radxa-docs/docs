---
sidebar_position: 2
---

# Kernel 开发

教程主要介绍如何编译 Kernel，使用我们提供的 Kernel 源码搭配 Dev Containers 可以非常方便的编译 Kernel。

## 使用前提

- 适用平台：Windows / Linux / macOS
- 硬件环境：仅支持 x86_64 架构的 PC
- 软件环境：[VS Code](https://code.visualstudio.com/Download) + [Docker](https://www.docker.com/get-started/)

我们需要在自己的 PC 上安装 VS Code 和 Docker，然后使用 Docker 来运行编译环境。

:::tip 参考资料

- [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [Dev Containers Tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)
  :::

## 下载 Kernel 源码

打开终端，使用 `git clone` 命令下载 Kernel 源码。

<NewCodeBlock tip="PC@host$" type="host">

```
git clone --recurse-submodules https://github.com/radxa-pkg/linux-a733.git
```

</NewCodeBlock>

## 开发环境

### 安装拓展插件

我们需要在 VS Code 中安装 Dev Containers 拓展。

① ：点击 `Extensions` 选项

② ：搜索 `Dev Containers`

③ ：选择 Dev Containers 拓展

④ ：点击 `Install` 选项安装 Dev Containers 拓展

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/vscode-dev-container.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 启动开发环境

打开 Kernel 源码目录：一般 `Dev Container` 拓展会自动识别文件夹下的配置文件，会提示你是否重新打开容器开发环境。

:::tip
首次启动开发环境时，Dev Containers 会自动下载并安装依赖，需要耐心等待一段时间。
:::

①：点击左下角的 `Remote` 选项

②：选择 `Reopen in Container` 选项

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/vscode-dev-container-reopen.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 编译 Kernel

启动开发环境后，进入 Kernel 源码目录，使用 `make deb` 命令编译 Kernel。

<NewCodeBlock tip="PC@host$" type="host">

```
make deb
```

</NewCodeBlock>

编译成功后，终端会输出生成文件的路径。
