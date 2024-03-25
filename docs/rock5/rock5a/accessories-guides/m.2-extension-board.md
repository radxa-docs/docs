---
sidebar_position: 20
---

# 如何在ROCK 5A上设置M.2 E Key extension board

- 这是带 M.2 扩展板的 ROCK5A。

![ROCK5A Install M.2 Extension Board](/img/rock5a/rock5a-m2-extension-board-01.webp)

- 下图显示了 RADXA M.2 扩展板和包含的部件。

**请点击链接了解详情.[M.2 Extension Board](../../../accessories/m2-extension-board)**

![ROCK5A Install M.2 Extension Board](/img/accessories/m2-extension-board-03.webp)

- 请先区分 IPEX 线缆的正反面, 如图所示。

**我们为 ROCK 5A 提供的 IPEX 线的两端方向是相同的。**

![ROCK5A Install M.2 Extension Board](/img/accessories/m2-extension-board-04.webp)

- 请注意，**环扣**需要卡入连接器。

![E key to M key](/img/accessories/ekey-to-mkey-01.webp)

## 安装指南

1、M.2 E 键转 M.2 M 键板，带 IPEX 电缆。 **注意这里安装的IPEX线是正面朝上的，环扣需要卡在接口上，确保固定。**

![ROCK5A Install M.2 Extension Board](/img/accessories/m2-extension-board-02.webp)

2、M.2 扩展板，带 IPEX 电缆。 **注意这里安装的IPEX线是正面朝上的，环扣需要卡在接口上，确保固定。**

![ROCK5A Install M.2 Extension Board](/img/accessories/m2-extension-board-01.webp)

3、请将产品附带的M2.5x18+6铜柱和M2.5x5铜柱安装在ROCK5A上，如图所示。

![ROCK5A Install M.2 Extension Board](/img/rock5a/rock5a-m2-extension-board-04.webp)

4、请将 IPEX 线缆的一端连接到 M.2 E key to M Key board，另一端连接到 M.2 Extension Board 并将 M.2 E key to M key board 安装到 ROCK5A M.2 E 连接器， 如图所示。

![ROCK5A Install M.2 Extension Board](/img/rock5a/rock5a-m2-extension-board-03.webp)

5、最后，使用M2.5x5+5铜柱组装M.2扩展板。

![ROCK5A Install M.2 Extension Board](/img/rock5a/rock5a-m2-extension-board-02.webp)

## 查看挂载情况

1、可以通过`lsblk`查看SSD卡是否被识别。

```bash
radxa@rock-5a:~$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
mmcblk0      179:0    0  14.5G  0 disk
├─mmcblk0p1  179:1    0    16M  0 part /config
└─mmcblk0p2  179:2    0  14.4G  0 part /
mmcblk0boot0 179:32   0     4M  1 disk
mmcblk0boot1 179:64   0     4M  1 disk
zram0        254:0    0   3.8G  0 disk [SWAP]
nvme0n1      259:0    0 238.5G  0 disk
radxa@rock-5a:~$
```

2、这时你可以看到，系统已经识别出SSD(**nvme0n1**)。

## 系统启动

1. 请查看教程 [Install OS to M.2 NVMe SSD](../getting-started/install-os)
