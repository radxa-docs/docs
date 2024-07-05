---
sidebar_position: 8
---

import DISPLAY from "../../../../common/accessories/\_display-usage.mdx";

# MIPI DSI 接口

## 接口差异

- ROCK 5B 有一个四通道 MIPI DSI 显示器连接器
- ROCK 5B+ 配备了一个四通道 MIPI DSI 连接器

## 支持列表

<Tabs queryString="versions">
    <TabItem value="ROCK 5B">
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
          <td>1280x800 像素</td>
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
    </TabItem>
    <TabItem value="ROCK 5B+">
      <table>
        <tr>
          <th>Screen Name</th>
          <th>分辨率</th>
        </tr>
        <tr>
          <td>Radxa Display 8 HD</td>
          <td>1280x800 像素</td>
        </tr>
        <tr>
          <td>Radxa Display 10HD</td>
          <td>1200x1920 像素 </td>
        </tr>
        <tr>
          <td>Radxa Display 10FHD</td>
          <td>1200x1920 像素 </td>
        </tr>
      </table>
    </TabItem>
</Tabs>

## 配件使用

:::tip

以下两个仅作为示例，除了可能的排线和 Overlay 不同外，其他屏幕的操作步骤类似。

:::

### 瑞莎 8 寸 HD 高清显示屏

<DISPLAY product="ROCK 5B" display_connection_img="/img/rock5b/rock5b-display-8hd-connected.webp" model="rock-5b" rsetup_path="../../radxa-os/rsetup#overlays" display_name="瑞莎 8 寸 HD 高清显示屏" overlays_title="Enable Radxa Display 8HD" />

### 树莓派 7 寸触控显示屏

<DISPLAY product="ROCK 5B+" display_connection_img="/img/rock5b/rock5bp-rpi-7inch-display.webp" model="rock-5b" rsetup_path="../../radxa-os/rsetup#overlays" display_name="树莓派7寸触控显示屏" overlays_title="Enable Raspberry Pi 7-inch Touchscreen" />
