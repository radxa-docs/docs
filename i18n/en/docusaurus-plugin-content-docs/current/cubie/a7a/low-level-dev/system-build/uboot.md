---
sidebar_position: 1
---

# U-Boot Development

This tutorial mainly introduces how to compile U-Boot. Using the U-Boot source code we provide, combined with Dev Containers, makes compiling U-Boot very convenient.

## Prerequisites

- Supported Platforms: Windows / Linux / macOS
- Hardware Requirements: Only supports x86_64 architecture PCs
- Software Requirements: [VS Code](https://code.visualstudio.com/Download) + [Docker](https://www.docker.com/get-started/)

You need to install VS Code and Docker on your PC, and then use Docker to run the build environment.

:::tip Reference Materials

- [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [Dev Containers Tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)
  :::

## Download U-Boot Source Code

Open the terminal and use the `git clone` command to download the U-Boot source code.

<NewCodeBlock tip="PC@host$" type="host">

```
git clone --recurse-submodules https://github.com/radxa-pkg/u-boot-aw2501.git
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

Open the U-Boot source code directory. Generally, the `Dev Container` extension will automatically detect the configuration files in the folder and prompt you to reopen the container development environment.

:::tip
When starting the development environment for the first time, Dev Containers will automatically download and install dependencies. Please be patient and wait for the process to complete.
:::

① : Click the `Remote` option in the bottom left corner

② : Select the `Reopen in Container` option

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/vscode-dev-container-reopen.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Compile U-Boot

After starting the development environment, navigate to the U-Boot source code directory and use the `make deb` command to compile U-Boot.

<NewCodeBlock tip="PC@host$" type="host">

```
make deb
```

</NewCodeBlock>

Once the compilation is successful, the terminal will output the path to
