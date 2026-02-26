---
sidebar_position: 6
---

# MIPI CSI 接口

瑞莎 CM4 IO 板板载 1 个 4 通道 MIPI CSI 接口、2 个 2 通道 MIPI CSI 接口，可用于连接 CSI 摄像头。

## 兼容列表

| 底板           | CSI 摄像头                                                   |
| -------------- | ------------------------------------------------------------ |
| 瑞莎 CM4 IO 板 | [Camera 4K](https://radxa.com/products/accessories/camera4k) |

:::tip 接口位置
可以参考 [硬件信息](./hardware_info.md) 教程找到对应硬件接口位置。
:::

## 硬件连接

使用主板的 MIPI CSI 接口连接摄像头，连接方式如下：以 Camear 4K 为例

①： 连接主板的 MIPI CSI 接口，金手指（金属接触点）朝向主板方向

②： 连接显示器的接口，金手指（金属接触点）朝向显示器方向

<div style={{ textAlign: "center" }}>
  <img
    src="/img/cm4/cm4_io_camera.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 软件使能

在终端命令行输入 `rsetup` 命令，使用 Rsetup 工具设置显示器选项。

<NewCodeBlock tip="radxa@device$" type="device">

```bash
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

- Camera 4K → 选择 `Enable Radxa Camera 4K` 选项

4. 重启系统，配置生效。

## 接口引脚定义

可以参考 [资源汇总下载](../download.md) 页面的硬件原理图。
