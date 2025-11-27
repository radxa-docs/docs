---
sidebar_position: 5
---

# 安装系统

我们提供 3 种方式给用户安装系统，以下是三种方式的优缺点：

1. 使用我们提供的 EDK2 固件和英伟达官方提供的 SD 卡系统镜像

参考教程 [通过 EDK2 固件启动系统](./install-system/radxa-bios-system)。

- 优点：支持 U 盘和 NVMe 固态硬盘启动系统，安装系统简单
- 缺点：无法进入 MAXN_SUPER 模式

2. 通过 SDK Manager 安装系统

参考教程 [通过 SDK Manager 安装系统](./install-system/sdk-manager)。

- 优点：可自行部署组件环境
- 缺点：无法进入 MAXN_SUPER 模式，只支持 NVMe 固态硬盘启动系统

3. 通过命令行安装 Super 系统

参考教程 [通过命令行安装 Super 系统](./install-system/super-system)。

- 优点：可进入 MAXN_SUPER 模式
- 缺点：只支持 NVMe 固态硬盘启动系统

<DocCardList />
