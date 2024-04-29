---
sidebar_position: 3
---

# Display

<img src="/img/rock5itx/rock5itx-lcd0.webp" alt="rock5itx lcd0" width="700" />

- 准备好 Radxa Display 8HD 或者 Radxa Display 10HD，通过 FPC 线接上 ROCK 5 ITX。

- 通过左下角 Application Launcher 打开 Kconsole 终端, 运行 `rsetup` 命令：

```bash
radxa@rock-5itx:~$ rsetup
```

- 通过[设备树配置](../os-config/rsetup#overlays)来启用瑞莎 8 寸触摸屏的 Overlay。

:::caution [注意]

1. 请启用 `[] Enable Radxa Display 8HD on LCD0` 项 Overlay。
2. 在启用成功显示 `[*] Enable Radxa Display 8HD on LCD0` 后退出重启才能使配置生效。

:::
