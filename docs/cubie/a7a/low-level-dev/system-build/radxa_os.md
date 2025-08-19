---
sidebar_position: 3
---

# 编译 Radxa OS

教程主要介绍如何编译 Radxa OS，使用我们提供的 RadxaOS SDK（rsdk）源码搭配 Dev Containers 可以非常方便的编译 Radxa OS。

## 使用前提

- 适用平台：Windows / Linux / macOS
- 硬件环境：仅支持 x86_64 架构的 PC
- 软件环境：[VS Code](https://code.visualstudio.com/Download) + [Docker Desktop](https://www.docker.com/products/docker-desktop/)

我们需要在自己的 PC 上安装 VS Code 和 Docker Desktop，然后使用 Docker Desktop 来运行编译环境。

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

## 启动开发环境

1. 打开 VS Code
2. 安装 Dev Containers 拓展
3. 打开 RadxaOS SDK（rsdk）源码目录，点击左侧活动栏中的 Dev Containers 图标，在弹出的菜单中选择 `Reopen in Container`，即可打开开发环境。

:::tip
首次启动开发环境时，Dev Containers 会自动下载并安装依赖，需要耐心等待一段时间。
:::

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

编译完成后，会在 `out` 目录下生成文件名称为 `output.img` 的 Radxa OS 镜像。
