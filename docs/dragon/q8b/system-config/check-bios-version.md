---
sidebar_position: 10
---

# 查看 BIOS 版本

本教程介绍如何在 Dragon Q8B 上查看当前主板的 BIOS 版本。

## 在系统中查看

如果系统可以正常启动，可以在系统中使用以下命令查询当前主板的 BIOS 版本：

<NewCodeBlock tip="radxa@radxa-dragon-q8b$" type="device">

```bash
sudo dmidecode -s bios-version
```

</NewCodeBlock>

终端会输出类似以下信息，其中 `260821` 表示 BIOS 固件的版本日期：

```text
6.0.260821.BOOT.MXF.1.1.c1-00167-MAKENA-1
```

## 在 BIOS 界面中查看

也可以在开机时按 **F2** 键进入 BIOS 界面，界面顶部会直接显示 BIOS 固件版本号。

更多 BIOS 相关信息，请参考 [BIOS 说明](../low-level-dev/bios)。
