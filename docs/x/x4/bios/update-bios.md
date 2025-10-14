---
sidebar_position: 10
---

# 升级 BIOS

## BIOS 文件包下载

**Radxa X4 BIOS**

- X4 板载 eMMC 版本：[Radxa X4 标准 BIOS V007: 提升 eMMC 启动稳定性](https://dl.radxa.com/x/x4/Radxa_X4_BIOS_V007.zip)

- X4 无 eMMC 版本：[Radxa X4 标准 BIOS V004, 支持 ASM2806/1806, 添加了安全启动选项](https://dl.radxa.com/x/x4/Radxa_X4_BIOS_V004.zip)

<details>
<summary>旧版本 BIOS</summary>

- [Radxa X4 自定义 BIOS V003: PCIE Bifurcation ver (only 4 x1)](https://dl.radxa.com/x/x4/Radxa_X4_BIOS_V003.zip)

- [Radxa X4 自定义 BIOS V002 T 支持启用 IBECC 选项和隐藏选项](https://dl.radxa.com/x/x4/Radxa_X4_BIOS_V002_t.zip)

- [Radxa X4 标准 BIOS V0002 新增 16GB 内存支持](https://rock.sh/x4-bios-update)

</details>

:::warning

- 刷新自定义 BIOS 可能会导致保修失效，因此请谨慎操作。
- 使用方法：将下载的bios压缩文件解压到 FAT32格式的 U盘，确保U盘根目录有EFI文件夹，将 U 盘插入 X4 并选择从 USB 设备启动，系统会自动刷新 BIOS。
- 警告：BIOS 升级期间不要关闭计算机

:::

## 更新前准备

- Radxa X4 主板
- 至少 8GB 的 U 盘
- BIOS 的 EFI 文件

## BIOS 更新流程

- 将 U 盘格式化 fat32 格式。将下载的 EFI 压缩包解压放入 U 盘内。

- 将 U 盘插入 Radxa X4 主板，推荐插入 USB3.0 接口。

- 上电开机，按 F7 进入 BIOS 页面.

![BIOS_update_01](/img/x/x2l/bios_update_01.webp)

- 选择从 U 盘启动 UEFI 模式，然后会自动刷新 BIOS。等候完毕即可。

![BIOS_update_02](/img/x/x4/bios_update_02.webp)

![BIOS_update_03](/img/x/x4/bios_update_03.webp)
