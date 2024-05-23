---
sidebar_position: 20
---

# 安装 ROOBI OS

:::tip

ROOBI OS 将会附带在您所购买的机器中，通常您无需手动安装。

:::

## 使用ROOBI Flasher

ROOBI Flasher 是用于恢复 ROOBI OS 的一个刷入工具，如果您因为不可控因素，使 ROOBI 系统无法启动，可通过该教程，将您的 ROOBI 系统恢复到出厂时的状态。

:::note

**ROOBI OS** 运行再设备中用于刷入操作系统的软件，**ROOBI Flasher** 是用于刷入 ROOBI OS 的软件。

**ROOBI OS** 不可直接运行在 U 盘或 SD 卡中。

:::

1. 获取刷入镜像：

<details>
<summary>请选择合适的型号下载</summary>

> [SLiM X2L](https://gate.radxa.com/palmshell/RoobiOS/releases/download/ps006_flasher_v1.1.3/ps006_flasher-v1.1.3.img.xz)
>
> PuER N1 敬请期待
>
> [ROCK 5 ITX](https://gate.radxa.com/radxa/roobi-config/releases/download/Rock5-itx-ROOBI-v1.2.1ROCK5-itx-ROOBI-Flasher-v1.2.1/ROCK5-itx-ROOBI-Flasher-v1.2.1.img.xz)

</details>

<Tabs queryString="devices">
  <TabItem value="x" label="X 系列">

2. 将 U盘 插入到您的主机。

3. 使用 balenaEtcher 将镜像写入 U盘 。<InlineDanger> **请注意：这个操作会清空您 U盘 中的所有数据。** </InlineDanger>

![Balena_Etcher](/img/roobi/balena_etcher.webp)

4. 写入成功后移除 U盘 并插入到设备的 USB 接口上，任意一个 USB 接口都可正常运行，推荐插入到 USB3.0 的接口上。

5. 激活 eMMC ：首先需要找到 eMMC Recovery 按钮（请查看相应产品示意图）。<InlineSuccess> 在开机之前，按住 `eMMC Recovery 按钮` 并保持，于此同时按下并立刻松开`电源按钮`，直到显示器亮起后即可松开 `eMMC Recovery 按钮`。</InlineSuccess>

6. 在显示画面后，立刻点击 `F7` 进入引导选择界面。

![Balena_Etcher](/img/roobi/boot_menu.webp)

7. 选择您的U盘设备，按 `Enter` 选择相应条目，启动刷入器。

![Balena_Etcher](/img/roobi/booting.webp)

8. 等待5秒后将会自动将 ROOBI 刷入到 eMMC 中。 （ <InlineDanger> **请注意：这个操作会清空您所在设备 eMMC 中所有内容，您可以在读秒结束前断开电源取消操作。** </InlineDanger> ）

![Balena_Etcher](/img/roobi/booting.webp)

9. 当您看到以下画面时则代表刷入成功，您可以按 `Enter` 即可重启进入操作系，也可点击电源键进行关机。

![Balena_Etcher](/img/roobi/success.webp)

:::tip

按 `Enter` 并**不会**直接进入到ROOBI OS 中。

:::

10. 通过该步骤可进入ROOBI OS：[进入Roobi界面](./roobi-usage?devices=x#进入roobi界面)

:::tip

该项与本教程第 5 步为相同操作。

如果您没有经过这一个步骤，则会正常进入操作系统。

:::

  </TabItem>
  <TabItem value="itx" label="ROCK 5 ITX">

2. 将 SD卡 使用读卡器，连接到您的主机。

3. 使用 balenaEtcher 将镜像写入 U盘 。<InlineDanger> **请注意：这个操作会清空您 SD卡 中的所有数据。** </InlineDanger>

![Balena_Etcher](/img/roobi/balena_etcher.webp)

4. 写入完成后从主机中移除 SD卡 并将 SD 卡插入到 设备 [MicroSD](../rock5/rock5itx/getting-started/introduction#主板概览) 槽位中 位于编号 **4** 。

5. 移除您设备上其余存储介质，并上电启动

6. 等待5秒后将会自动将 ROOBI 刷入到 eMMC 中。 （ <InlineDanger> **请注意：这个操作会清空您所在设备 eMMC 中所有内容，您可以在读秒结束前断开电源取消操作。** </InlineDanger> ）

![start.webp](/img/roobi/start.webp)

7. 当您看到以下画面时则代表刷入成功，断电重启即可进入 ROOBI OS

![flashed.webp](/img/roobi/flashed.webp)

  </TabItem>
</Tabs>
