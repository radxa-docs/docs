---
sidebar_position: 1
---

# 硬件信息

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_block_diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                   | 序号 | 说明                                                             | 序号 | 说明            |
| :--: | :--------------------- | :--: | :--------------------------------------------------------------- | :--: | :-------------- |
|  1   | 高通 QCS6490           |  2   | 40-Pin GPIO 接口                                                 |  3   | M.2 M Key 插槽  |
|  4   | WiFi 6 / BT 5.4        |  5   | 天线接口                                                         |  6   | 电源按键        |
|  7   | 用户指示灯             |  8   | 电源指示灯                                                       |  9   | Type-C 供电接口 |
|  10  | 电源输入接口           |  11  | MIPI CSI（4 通道）                                               |  12  | microSD 卡槽    |
|  13  | MIPI DSI（4 通道）     |  14  | PoE 接口                                                         |  15  | 千兆以太网      |
|  16  | QSPI Nor Flash         |  17  | USB 2.0 Type-A 接口（上层）<br/> USB 3.1 OTG Type-A 接口（下层） |  18  | LPDDR5 内存     |
|  19  | 2x USB 2.0 Type-A 接口 |  20  | EDL 按键                                                         |  21  | 耳机插孔        |
|  22  | 标准 HDMI              |  23  | eMMC & UFS 模块二合一接口                                        |  24  | RTC 电池接口    |
|  25  | 2x MIPI CSI（2 通道）  |      |                                                                  |      |                 |

## M.2 M Key 插槽安装说明

Dragon Q6A 的 M.2 M Key 插槽支持 **M.2 2230** 尺寸的 NVMe SSD。

### 安装步骤：
1. 将 M.2 2230 NVMe SSD 以约 30° 角度插入 M.2 插槽
2. 轻轻按下 SSD 使其与插槽接触良好
3. 使用 **M2×3.5mm** 螺丝将 SSD 固定到主板上

### 注意事项：
- 确保使用正确的螺丝尺寸（M2×3.5mm）
- 不要过度拧紧螺丝，以免损坏 SSD 或主板
- Dragon Q6A 仅支持 **M.2 2230** 尺寸，不支持更长的 2242、2260 或 2280 尺寸
- 该插槽仅支持 NVMe 协议 SSD，不支持 SATA 协议 M.2 SSD
