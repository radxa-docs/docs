---
title: Obtain the Source Code
sidebar_position: 0
---

With the authorization of CIX, Risha has released the publicly available part of the CIX SDK on GitLab. Users can conduct secondary development of the O6 through this SDK by themselves.

:::info
The CIX SDK only supports compilation on Debian 11 / Ubuntu 22.04 systems. The available storage space of the system should be at least 100GiB.

When the SDK runs in a container, permission issues may occur. It is recommended to use a physical machine or a virtual machine for compilation.
:::

## Obtain the `repo` Tool

The SDK provides a [manifest](https://gitlab.com/cix-linux/linux_repo/cix-manifest) that is compatible with the [`repo`](https://gerrit.googlesource.com/git-repo) tool to help users quickly restore the code file structure locally.

Before downloading the SDK, users should first install this tool on the system they are using. For Debian systems, you can refer to the following commands:

```bash
sudo apt-get update
sudo apt-get install repo
```

For reference on the usage of the `repo` command, please refer to the [`AOSP` documentation](https://source.android.com/docs/setup/reference/repo).

## Pull the Code

Please execute the following commands:

```bash
mkdir cix-sdk
cd cix-sdk
repo init https://gitlab.com/cix-linux/linux_repo/cix-manifest.git
# Optionally, init with a specific version of manifest:
# repo init -m release/<version>/default.xml https://gitlab.com/cix-linux/linux_repo/cix-manifest.git
repo sync
```

After all the code has been downloaded, you can proceed with [software compilation](build).
