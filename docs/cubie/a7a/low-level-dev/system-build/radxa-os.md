---
sidebar_position: 3
---

# 编译 Radxa OS

教程主要介绍如何编译 Radxa OS，使用我们提供的 RadxaOS SDK（rsdk）源码搭配 Dev Containers 可以非常方便的编译 Radxa OS。

## 使用前提

- 适用平台：Windows / Linux / macOS
- 硬件环境：仅支持 x86_64 架构的 PC
- 软件环境：[VS Code](https://code.visualstudio.com/Download) + [Docker](https://www.docker.com/get-started/)

我们需要在自己的 PC 上安装 VS Code 和 Docker，然后使用 Docker 来运行编译环境。

:::tip 参考资料

- [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [Dev Containers Tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)
  :::

## 下载 RadxaOS SDK（rsdk）源码

打开终端，使用 `git clone` 命令下载 RadxaOS SDK（rsdk）源码。

<NewCodeBlock tip="PC@host$" type="host">

```
git clone --recurse-submodules https://github.com/RadxaOS-SDK/rsdk.git
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

打开 RadxaOS SDK（rsdk）源码目录：一般 `Dev Container` 拓展会自动识别文件夹下的配置文件，会提示你是否重新打开容器开发环境。

:::tip
首次启动开发环境时，Dev Containers 会自动下载并安装依赖，需要耐心等待一段时间。
:::

①：点击左下角的 `Remote` 选项

②：选择 `Reopen in Container` 选项

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/vscode-dev-container-reopen.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 编译 Radxa OS

启动开发环境后，进入 RadxaOS SDK（rsdk）源码目录，使用 `rsdk` 命令运行 TUI 界面。

<NewCodeBlock tip="PC@host$" type="host">

```
rsdk
```

</NewCodeBlock>

```
┌─────────────────┤ RSDK ├──────────────────┐
│ Please select a task:                     │
│                                           │
│            Build system image             │
│            =========                      │
│            About                          │
│                                           │
│         <Ok>             <Cancel>         │
│                                           │
└───────────────────────────────────────────┘
```

选择 `Build system image` 选项，可以进一步选择需要构建的主板型号。

```
┌─────────────────┤ RSDK ├──────────────────┐
│ Please select a product:                  │
│                                           │
│  (*) radxa-cubie-a7a                      │
│                                           │
│         <Ok>             <Cancel>         │
│                                           │
└───────────────────────────────────────────┘
```

选择 `yes` 后开始构建 Radxa OS，rsdk 会自动完成镜像编译。

```
┌─────────────────┤ RSDK ├───────────────────────┐
│                                                │
│ Are you sure to build for 'radxa-cubie-a7a'?   │
│                                                │
│                                                │
│          <Yes>             <No>                │
│                                                │
└────────────────────────────────────────────────┘
```

编译完成后，会在 `out` 目录下生成主板型号与系统版本对应的文件夹，该文件夹下会生成名称为 `output.img` 的 Radxa OS 镜像。
