---
title: 获取源代码
sidebar_position: 0
---

经此芯授权，瑞莎在 GitLab 上发布了此芯 SDK 的可公开部分。用户可以自行通过该 SDK 对 O6 进行二次开发。

:::info
此芯 SDK 仅支持在 Debian 11 / Ubuntu 22.04 系统上进行编译。系统可用储存空间至少需 100GiB。

SDK 在容器内运行时可能会遇到权限问题，建议使用实体机或虚拟机进行编译。
:::

## 获取 `repo` 工具

SDK 提供了 [`repo`](https://gerrit.googlesource.com/git-repo) 兼容的
[manifest](https://gitlab.com/cix-linux/linux_repo/cix-manifest)来帮助用户快速在本地还原代码文件结构。

用户在下载 SDK 前，请首先在所使用的系统上安装该工具。 Debian 系统可参考以下命令：

```bash
sudo apt-get update
sudo apt-get install repo
```

关于 `repo` 命令的使用参考，请参见 [`AOSP` 文档](https://source.android.com/docs/setup/reference/repo)。

## 拉取代码

请执行以下命令：

```bash
mkdir cix-sdk
cd cix-sdk
repo init https://gitlab.com/cix-linux/linux_repo/cix-manifest.git
# Optionally, init with a specific version of manifest:
# repo init -m release/<version>/default.xml https://gitlab.com/cix-linux/linux_repo/cix-manifest.git
repo sync
```

代码全部下载完成后，您就可以进行[软件编译](build)了。
