---
sidebar_position: 6
---

# MIPI DSI 接口

瑞莎 CM4 IO 板板载 1 个 4 通道 MIPI DSI 接口，可用于连接 DSI 显示屏。

## 兼容列表

| 底板           | DSI 显示屏                                                            |
| -------------- | --------------------------------------------------------------------- |
| 瑞莎 CM4 IO 板 | [Display 8HD](https://radxa.com/products/accessories/display-8hd)     |
| 瑞莎 CM4 IO 板 | [Display 10FHD](https://radxa.com/products/accessories/display-10fhd) |

:::tip 接口位置
可以参考 [硬件信息](./hardware_info.md) 教程找到对应硬件接口位置。
:::

## 硬件连接

使用主板的 MIPI DSI 接口连接显示屏，连接方式如下：

①： 连接主板的 MIPI DSI 接口，金手指（金属接触点）朝向主板方向

②： 连接显示器的接口，金手指（金属接触点）朝向显示器方向

<div style={{ textAlign: "center" }}>
  <img
    src="/img/cm4/cm4_io_display.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 软件使能

在终端命令行输入 `rsetup` 命令，使用 Rsetup 工具设置显示器选项。

<NewCodeBlock tip="radxa@device$" type="device">

```
rsetup
```

</NewCodeBlock>

1. 通过方向键选择 Overlays 选项，然后按回车键确认选择。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/rsetup-overlays.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

2. 通过方向键选择 Manage overlays 选项，然后按回车键确认选择。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/rsetup-overlays-manage.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

3. 通过方向键选择对应的 Display 选项，按空格键并出现 `*` 代表启用该功能，然后回车键确认选择。

- Display 8HD → 选择 `Enable Radxa Display 8HD` 选项
- Display 10FHD → 选择 `Enable Radxa Display 10FHD` 选项

4. 重启系统，配置生效。

## 接口引脚定义

可以参考 [资源汇总下载](../download.md) 页面的硬件原理图。
