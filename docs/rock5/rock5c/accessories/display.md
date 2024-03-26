---
sidebar_position: 3
---

# 显示屏

目前支持的显示屏如下：

<table>
  <tr>
    <th>Screen Name</th>
    <th>分辨率</th>
  </tr>
  <tr>
    <td>ALLNET 5 inch DSI Display</td>
    <td>800 ×3(RGB) ×480 像素</td>
  </tr>
  <tr>
    <td>Radxa Display 8 HD</td>
    <td>800x1280 像素</td>
  </tr>
  <tr>
    <td>Radxa Display 10HD</td>
    <td>800x1280 像素</td>
  </tr>
  <tr>
    <td>Radxa Display 10FHD</td>
    <td>1200x1920 像素 </td>
  </tr>
  <tr>
    <td>Raspberry Pi 7 inch Touchscreen</td>
    <td>800 x 480 像素</td>
  </tr>
</table>

## 配置

以 `radxa 8hd display` 为例：

<!-- ![显示屏安装-01](/img/rock5c/accessories/display/rock5c-display-8hd-FPC.webp)
![显示屏安装-02](/img/rock5c/accessories/display/rock5c-display-8hd-connected.webp) -->

- 准备好 Radxa Display 8HD 或者 Radxa Display 10HD，通过 FPC 线接上 ROCK 5C。

- 通过左下角 Application Launcher 打开 Kconsole 终端, 运行 `rsetup` 命令：

```bash
radxa@rock-5c:~$ rsetup
```

- 通过[设备树配置](../os-config/rsetup#overlays)来启用瑞莎 8 寸触摸屏的 Overlay。

:::caution [注意]

1. 请启用 `[] Enable Radxa Display 8 HD` 项 Overlay。
2. 在启用成功显示 `[*] Enable Radxa Display 8 HD` 后退出重启才能使配置生效。

:::

## 购买链接

- [Radxa 8HD Display](https://radxa.com/products/accessories/display-8hd)
- [Radxa 10FHD Display](https://radxa.com/products/accessories/display-10fhd)
