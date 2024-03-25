---
sidebar_position: 20
---

# 安装 ROOBI OS

:::tip

ROOBI OS 将会附带在您所购买的机器中，通常您无需手动安装。

:::

## 使用ROOBI Flasher

ROOBI Flasher 是用于恢复 ROOBI OS 的一个刷入工具，如果您因为不可控因素，使 ROOBI 系统无法启动，可通过该教程，将您的 ROOBI系统恢复到出厂时的状态。

:::note

**ROOBI OS** 运行再设备中用于刷入操作系统的软件，**ROOBI Flasher** 是用于刷入ROOBI OS 的软件。

**ROOBI OS** 不可直接运行在U盘中。

:::

1. 获取刷入镜像：

<details>
<summary>请选择合适的型号下载</summary>

> [PS006(SLiM X2L)](https://github.com/palmshell/RoobiOS/releases/download/ps006_flasher_v1.1.1/ps006_v1.1.1_flasher.img.xz)
>
> PS002(PuER N1) 敬请期待

</details>

2. 插入 U 盘 到您的主机。

3. 使用 balenaEtcher 将镜像写入U盘 。<InlineDanger> **请注意：这个操作会清空您U盘中的所有数据。** </InlineDanger>

![Balena_Etcher](/img/x/roobi/balena_etcher.webp)

4. 写入成功后移除U盘并插入到设备的 USB 接口上，任意一个 USB 接口都可正常运行，推荐插入到 USB3.0 的接口上。

5. 激活 eMMC：首先需要找到 eMMC Recovery 按钮（请查看相应产品示意图）。<InlineSuccess> 在开机之前，按住 `eMMC Recovery 按钮` 并保持，于此同时按下并立刻松开`电源按钮`，直到显示器亮起后即可松开 `eMMC Recovery 按钮`。</InlineSuccess>

6. 在显示画面后，立刻点击 `F7` 进入引导选择界面。

![Balena_Etcher](/img/x/roobi/boot_menu.webp)

7. 选择您的U盘设备，按 `Enter` 选择相应条目，启动刷入器。

![Balena_Etcher](/img/x/roobi/booting.webp)

8. 等待5秒后将会自动将 ROOBI 刷入到 eMMC 中。 （ <InlineDanger> **请注意：这个操作会清空您所在设备 eMMC 中所有内容，您可以在读秒结束前断开电源取消操作。** </InlineDanger> ）

![Balena_Etcher](/img/x/roobi/booting.webp)

9. 当您看到以下画面时则代表刷入成功，您可以按 `Enter` 即可重启进入操作系，也可点击电源键进行关机。

![Balena_Etcher](/img/x/roobi/success.webp)

:::tip

按 `Enter` 并**不会**直接进入到ROOBI OS 中。

:::

10. 通过该步骤可进入ROOBI OS：[进入Roobi界面](https://palmshell.feishu.cn/wiki/EdOYwLvJIi8N63kAkpDcpm9ZnZd#doxcnJwmj1RxewsnidCO8aK5pxh)

:::tip

该项与本教程第 5 步为相同操作。

如果您没有经过这一个步骤，则会正常进入操作系统。

:::
