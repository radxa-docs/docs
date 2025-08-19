---
sidebar_position: 3
---

# 编译 Radxa OS

教程主要介绍如何编译 Radxa OS，，目前 Radxa OS 使用 `rsdk` 作为生成环境，使用 `rsdk` 可以非常方便的编译 Radxa OS。

- 生成环境容器化，无需额外配置生成依赖
- 模块化的生成代码，修改方便
- 支持 x86、ARM64 平台上运行

## 开发环境

### 安装依赖

<NewCodeBlock tip="PC@host$" type="host">

```
sudo apt-get update
sudo apt-get install git qemu-user-static binfmt-support
sudo apt-get install npm docker.io
sudo usermod -a -G docker $USER
```

</NewCodeBlock>

### 使用 rsdk

使用命令拉取 RadxaOS SDK（rsdk）开发环境并启动 Dev Container。

<NewCodeBlock tip="PC@host$" type="host">

```
git clone --recurse-submodules https://github.com/RadxaOS-SDK/rsdk.git
cd rsdk
npm install @devcontainers/cli
export PATH="$PWD/src/bin:$PWD/node_modules/.bin:$PATH"
rsdk devcon up
rsdk devcon
```

</NewCodeBlock>

当终端出现类似以下信息时，说明开发环境已经成功启动：

```
██████╗ ███████╗██████╗ ██╗  ██╗
██╔══██╗██╔════╝██╔══██╗██║ ██╔╝
██████╔╝███████╗██║  ██║█████╔╝
██╔══██╗╚════██║██║  ██║██╔═██╗
██║  ██║███████║██████╔╝██║  ██╗
╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝
RadxaOS Software Development Kit

Please run `rsdk shell` to enter the full development shell.

direnv: export +AR +AS +CC +CONFIG_SHELL +CXX +DETERMINISTIC_BUILD +DEVENV_DOTFILE +DEVENV_PROFILE +DEVENV_ROOT +DEVENV_RUNTIME
+DEVENV_STATE +DEVENV_TASKS +HOST_PATH +IN_NIX_SHELL +LD +LOCALE_ARCHIVE +NIX_BINTOOLS +NIX_BINTOOLS_WRAPPER_TARGET_HOST_x86_64_unknown_linux_gnu
+NIX_BUILD_CORES +NIX_CC +NIX_CC_WRAPPER_TARGET_HOST_x86_64_unknown_linux_gnu +NIX_CFLAGS_COMPILE +NIX_ENFORCE_NO_NATIVE +NIX_HARDENING_ENABLE +NIX_LDFLAGS
+NIX_PKG_CONFIG_WRAPPER_TARGET_HOST_x86_64_unknown_linux_gnu +NIX_STORE +NM +NODE_PATH +OBJCOPY +OBJDUMP +PKG_CONFIG +PKG_CONFIG_PATH +PYTHONHASHSEED +PYTHONNOUSERSITE
+PYTHONPATH +RANLIB +READELF +SIZE +SOURCE_DATE_EPOCH +STARSHIP_SESSION_KEY +STRINGS +STRIP +_PYTHON_HOST_PLATFORM +_PYTHON_SYSCONFIGDATA_NAME +__structuredAttrs +buildInputs
+buildPhase +builder +cmakeFlags +configureFlags +depsBuildBuild +depsBuildBuildPropagated +depsBuildTarget +depsBuildTargetPropagated +depsHostHost +depsHostHostPropagated
+depsTargetTarget +depsTargetTargetPropagated +doCheck +doInstallCheck +dontAddDisableDepTrack +hardeningDisable +mesonFlags +name +nativeBuildInputs +out +outputs +patches
+phases +preferLocalBuild +propagatedBuildInputs +propagatedNativeBuildInputs +shell +shellHook +stdenv +strictDeps +system ~PATH ~XDG_DATA_DIRS

vscode ➜ /workspaces/rsdk (main) $
```
