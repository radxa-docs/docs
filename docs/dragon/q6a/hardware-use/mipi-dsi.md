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

## 硬件连接

将 MIPI 显示屏通过 FPC 排线连接到 Dragon Q6A 的 MIPI DSI 接口。

:::tip 接口位置
可以参考 [硬件信息](./hardware-info) 教程找到对应硬件接口位置
:::

## 接口引脚定义

可以参考 [资源汇总下载](../download) 页面的硬件原理图。

## 已知问题与解决方案

### Radxa Display 8 HD 启动问题

部分用户在启用 Radxa Display 8 HD 的 DSI overlay 后遇到启动失败问题（蓝灯常亮后闪烁，无显示输出）。

**原因：**
这是一个已知的兼容性问题，与特定内核版本相关。

**受影响版本：**
- `linux-image-6.18.2-3-qcom` 及更早版本

**解决方案：**
1. 检查当前内核版本：
   ```bash
   apt policy linux-image-6.18.2-4-qcom
   ```
2. 如果 `linux-image-6.18.2-4-qcom` 可用，更新系统：
   ```bash
   sudo apt update
   sudo apt upgrade
   ```
3. 重启系统

**如果问题仍然存在：**
- 请暂时禁用 DSI overlay，等待 [linux-qcom](https://github.com/radxa-pkg/linux-qcom/releases) 发布修复版本
- 可以通过串口或恢复模式访问系统来禁用 overlay

**注意：** 此问题仅影响 Radxa Display 8 HD 的 DSI overlay，Radxa Display 10 FHD 和其他功能不受影响。
