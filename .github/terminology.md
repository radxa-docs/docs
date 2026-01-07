# 术语表（Starter）

本文件作为仓库的唯一术语来源。请在新增或修正术语时同时更新本文件。

| 术语（Key）       |                               中文写法（首选） | 英文写法（首选）                               | 说明                                                                   |
| ----------------- | ---------------------------------------------: | ---------------------------------------------- | ---------------------------------------------------------------------- |
| Radxa             |                                          Radxa | Radxa                                          | 公司/品牌名，不翻译。                                                  |
| ROCK 5 系列       |           ROCK 5 / ROCK 5A / ROCK 5B / ROCK 5C | ROCK5 / ROCK5A / ROCK5B / ROCK5C               | 产品型号，保留官方写法。                                               |
| ZERO 系列         | ZERO / ZERO+ / ZERO2 / ZERO2+ / ZERO3 / ZERO3+ | ZERO / ZERO+ / ZERO2 / ZERO2+ / ZERO3 / ZERO3+ | 产品型号，保留官方写法。                                               |
| Cubie 系列        |              Cubie A7A / Cubie A7Z / Cubie A5E | Cubie A7A / Cubie A7Z / Cubie A5E              | 产品型号，保留官方写法。                                               |
| U-Boot            |                                         U-Boot | U-Boot                                         | 引导加载程序，使用官方写法。                                           |
| Linux 内核        |                                     Linux 内核 | Linux kernel                                   | 保留 Linux 大写写法，中文中带“内核”说明。                              |
| eMMC / UFS / NVMe |                              eMMC / UFS / NVMe | eMMC / UFS / NVMe                              | 存储接口名，使用大写缩写。                                             |
| system image      |                    系统镜像（或 system image） | system image                                   | 镜像文件的正式称呼，中文可并列原文。                                   |
| flash / 刷机      |                                刷机 / 写入镜像 | flash / write image                            | 建议首选译法为“写入镜像”；用词受上下文影响时可在术语表中注明替代用法。 |
| bootloader        |                                   引导加载程序 | bootloader                                     | 统一译法为“引导加载程序”。                                             |
| MicroSD / SD card |                                     MicroSD 卡 | MicroSD / SD card                              | 存储卡命名；写作 `MicroSD 卡` 时保留大小写。                           |
| GPIO              |                                           GPIO | GPIO                                           | 通用 I/O，首现可扩展为“通用输入输出（GPIO）”。                         |
| PCIe              |                                           PCIe | PCIe                                           | e 必须是小写 ｜                                                        |

---

## 如何使用与维护

- 提交新术语：在提出新术语的 PR 中更新本文件并说明来源与理由；维护者会审核并决定是否合并。
- 集成检查：建议将本文件导出为 Vale/textlint 的词典用于自动校验（可向维护者提交 Vale 规则提案）。
- 示例：若要在中文文档中引用 `U-Boot`，请写为 `U-Boot` 并在首次出现处说明其含义；若引用 `system image`，建议写为 `系统镜像 (system image)`。

---

> 自检清单（术语相关）：已核对术语表 / 文档术语与术语表一致 / 新术语已在本文件登记。
