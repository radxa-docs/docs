---
sidebar_position: 1
---

# 瑞莎 Taco

## 产品概述

瑞莎 Taco 是一款面向 [**树莓派 Compute Module 5（CM5）**](https://www.raspberrypi.com/products/compute-module-5/) 的高扩展载板，适合需要多存储、多网络和稳定供电能力的边缘计算与轻量服务器场景。

结合 CM5 在 CPU / 内存 / 图形与多媒体方面的性能基础，Taco 在接口侧提供了更完整的工程化扩展能力：

- 存储扩展：microSD 卡槽、M.2 M Key 2280 插槽、5x SATA 接口
- 网络扩展：千兆以太网、2.5G 以太网、M.2 E Key 2230 插槽
- 外设扩展：2x USB 3.2 Gen1 Type-A 接口、风扇、RTC等接口
- 供电与维护：12V 供电插孔 / 排针、RPI BOOT 按键、Type-C 烧录接口

这使 Taco 能在保持 CM5 生态兼容性的同时，快速搭建可落地的 NAS、网关、工业控制和本地 AI 推理平台。

## 产品清单

- 1x 瑞莎 Taco
- 1x 主动散热器
- 3x 亚克力板
- 1x 导热硅胶片
- 1x 硅胶脚垫（4个）
- 4x M2.5 \* 18mm 铜柱
- 8x M2.5 \* 6mm 螺丝
- 20x KM3 _ 5 _ 5mm 螺丝
- 1x 12V DC 电源适配器（单独包装）

<div style={{textAlign: 'center'}}>
  <img src="/img/accessories/taco/package-list.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

说明：图片仅为 Taco 包装盒清单，12V DC 电源适配器单独包装。

## 产品外观

| 序号 |    视图     | 序号 |    视图     | 序号 |    视图     |
| :--: | :---------: | :--: | :---------: | :--: | :---------: |
|  左  | Taco 正视图 |  中  | Taco 侧视图 |  右  | Taco 背视图 |

<div style={{textAlign: 'center'}}>
  <img src="/img/accessories/taco/radxa-taco-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 产品规格

| 类别       | 规格参数                                                                                                                        |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------- |
| 存储       | 1x microSD 卡槽<br />1x M.2 M Key 2280 插槽<br />5x SATA 接口                                                                   |
| 网络       | 1x 千兆以太网口<br />1x 2.5G 以太网口<br />1x M.2 E Key 2230 插槽                                                               |
| 显示       | 1x HDMI 2.0 (标准 Type A)                                                                                                       |
| USB        | 2x USB 3.2 Gen1 Type-A 端口<br />1x USB Type-C 端口，用于烧录系统                                                               |
| 供电       | 12V DC 供电插孔或 12V DC 供电排针                                                                                               |
| 风扇       | 1x 风扇接口，支持 PWM 转速控制                                                                                                  |
| RTC        | 1x RTC 纽扣电池座，断电时间保持                                                                                                 |
| 其他       | 1x 8-Pin 1.25mm GPIO 排针（GPIO、I2C 和 PWM）<br />1x 电源按键<br />1x 电源指示灯<br />5x SATA 状态指示灯<br />1x RPI BOOT 按键 |
| 兼容核心板 | 树莓派 CM5                                                                                                                      |
| 连接器     | 2x 100-Pin B2B 接口                                                                                                             |
| 尺寸       | 114 x 85 mm                                                                                                                     |

## 产品接口

<div style={{textAlign: 'center'}}>
  <img src="/img/accessories/taco/radxa-taco-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                        | 序号 | 说明                | 序号 | 说明                 |
| :--: | :-------------------------- | :--: | :------------------ | :--: | :------------------- |
|  1   | M.2 M Key 2280 插槽         |  2   | RTC 电池座          |  3   | 风扇接口             |
|  4   | 12V DC 电源排针             |  5   | 千兆以太网口        |  6   | 2.5G 以太网口        |
|  7   | 2x USB 3.2 Gen1 Type-A 接口 |  8   | SATA 状态指示灯     |  9   | 电源指示灯           |
|  10  | M.2 E Key 2230 插槽         |  11  | 2x 100-Pin B2B 接口 |  12  | microSD 卡槽         |
|  13  | 8-Pin 1.25mm GPIO 排针      |  14  | 12V DC 电源插孔     |  15  | USB Type-C（仅烧录） |
|  16  | 电源按键                    |  17  | 标准 HDMI           |  18  | 5x SATA 接口         |
|  19  | RPI BOOT 按键               |      |                     |      |                      |

## 接口说明

### 8-Pin 1.25mm GPIO 排针

用于连接外部设备，支持 GPIO、I2C 和 PWM 功能。

<div style={{textAlign: 'center'}}>
  <img src="/img/accessories/taco/radxa-taco-gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 应用场景

- **轻量 NAS / 家庭媒体中心**：利用 5x SATA 与 M.2 存储接口构建大容量本地存储。
- **双网口边缘网关**：千兆 + 2.5G 网口适合软路由、旁路网关与网络服务整合。
- **工业与设备控制**：通过 GPIO、RTC、风扇与稳定 12V 供电满足长期运行需求。
- **本地 AI 与视觉推理节点**：结合 CM5 的算力能力，部署边缘识别、检测与数据采集任务。
- **开发与教学平台**：接口类型丰富，适合进行 Linux 系统、驱动与硬件联调实验。
