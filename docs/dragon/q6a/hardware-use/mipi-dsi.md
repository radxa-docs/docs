---
sidebar_position: 11
---

# MIPI DSI 接口

瑞莎 Dragon Q6A 板载 1 个 4-lane MIPI DSI 接口，用于连接 MIPI 显示屏。

## 支持显示器

|                                     型号                                     | 尺寸（单位：英寸） |   分辨率   |
| :--------------------------------------------------------------------------: | :----------------: | :--------: |
| [Radxa Display 10 FHD](https://radxa.com/products/accessories/display-10fhd) |        10.1        | 1200\*1920 |
|   [Radxa Display 8 HD](https://radxa.com/products/accessories/display-8hd)   |         8          | 800\*1280  |

:::note
仅支持上表列出的瑞莎官方显示器。第三方显示器（例如 Raspberry Pi 7\" 触控屏）未经官方适配：即使通过转接排线完成物理连接，显示与触控功能仍取决于系统镜像中是否包含匹配的 panel driver / 设备树，无法保证兼容。
:::

:::note
上表为屏幕兼容列表，但**并非所有系统镜像都包含全部型号的面板配置**：

- **Radxa OS（Linux）**：上表中的 Display 10 FHD 与 Display 8 HD 均可正常使用。
- **Android**：当前 Dragon Q6A 的 Android 镜像未包含 Display 10 FHD 的面板配置，**Display 10 FHD 在 Android 下暂不支持**（连接后可能出现黑屏）。

各系统镜像实际支持的屏幕型号以其发布说明为准。
:::

## 硬件连接

将 MIPI 显示屏通过 FPC 排线连接到 Dragon Q6A 的 MIPI DSI 接口（39-Pin / 0.3mm 间距 FPC 接口）。

:::tip 接口位置
可以参考 [硬件信息](./hardware-info) 教程找到对应硬件接口位置
:::

## 接口引脚定义

可以参考 [资源汇总下载](../download) 页面的硬件原理图。
