---
sidebar_position: 3
---

# Compile Radxa OS

This tutorial mainly introduces how to compile Radxa OS. Using the RadxaOS SDK (rsdk) source code we provide, combined with Dev Containers, makes compiling Radxa OS very convenient.

## Prerequisites

- Supported Platforms: Windows / Linux / macOS
- Hardware Requirements: Only supports x86_64 architecture PCs
- Software Requirements: [VS Code](https://code.visualstudio.com/Download) + [Docker](https://www.docker.com/get-started/)

You need to install VS Code and Docker on your PC, and then use Docker to run the build environment.

:::tip Reference Materials

- [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [Dev Containers Tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)
  :::

## Download RadxaOS SDK (rsdk) Source Code

Open the terminal and use the `git clone` command to download the RadxaOS SDK (rsdk) source code.

<NewCodeBlock tip="PC@host$" type="host">

```
git clone --recurse-submodules https://github.com/RadxaOS-SDK/rsdk.git
```

</NewCodeBlock>

## Development Environment

### Install Extension Plugin

You need to install the Dev Containers extension in VS Code.

① : Click the `Extensions` option

② : Search for `Dev Containers`

③ : Select the Dev Containers extension

④ : Click the `Install` option to install the Dev Containers extension

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/vscode-dev-container.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Start Development Environment

Open the RadxaOS SDK (rsdk) source code directory. Generally, the `Dev Container` extension will automatically detect the configuration files in the folder and prompt you to reopen the container development environment.

:::tip
When starting the development environment for the first time, Dev Containers will automatically download and install dependencies. Please be patient and wait for the process to complete.
:::

① : Click the `Remote` option in the bottom left corner

② : Select the `Reopen in Container` option

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/vscode-dev-container-reopen.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Compile Radxa OS

After starting the development environment, navigate to the RadxaOS SDK (rsdk) source code directory and use the `rsdk` command to run the TUI interface.

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

Select the `Build system image` option to further choose the target board model.

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

Select `Yes` to start building Radxa OS. The `rsdk` tool will automatically complete the image compilation.

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

After the compilation is complete, a folder corresponding to the board model and system version will be generated in the `out` directory. Inside this folder, a Radxa OS image named `output.img` will be generated.
