---
sidebar_position: 4
---

# 组装指南

## 安全注意事项

⚠️ **重要提示：开始组装前，请确保您的树莓派 5 已关机并断开所有电源连接。**

请仔细按照以下步骤进行正确组装。

## 安装铜柱

### 在树莓派 5 上

1. 找到树莓派 5 上的安装孔
2. 按照下图所示位置安装铜柱：
   - 对于内侧安装孔，使用 **M2.5×5+3 铜柱**
   - 对于外侧安装孔，使用 **M2.5×20 铜柱**

![在树莓派 5 上安装铜柱 - 步骤 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-1.webp)
![在树莓派 5 上安装铜柱 - 步骤 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-2.webp)

### 在瑞莎 Dual 2.5G Router HAT 上

1. 找到瑞莎 Dual 2.5G Router HAT 上的安装孔
2. 使用以下配件安装铜柱：
   - **M2×8.5 铜柱**
   - **M2×4×5 螺丝**

![在 Router HAT 上安装铜柱 - 步骤 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-3.webp)
![在 Router HAT 上安装铜柱 - 步骤 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-4.webp)

## 安装 FPC 连接线

1. 找到树莓派 5 上的 FPC 连接器
2. 小心地将 FPC 转接线插入树莓派 5 的 FPC 连接器
3. 将另一端连接到瑞莎 Dual 2.5G Router HAT 的 IPEX 连接器

⚠️ **重要提示：将 FPC 转接线插入树莓派 5 的 FPC 连接器时，请确保 FPC 连接线的黑色面朝外。**

![安装 FPC 连接线 - 步骤 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-5.webp)
![安装 FPC 连接线 - 步骤 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-6.webp)

## 将 HAT 连接到树莓派 5

1. 小心地将瑞莎 Dual 2.5G Router HAT 上的 40 针排针与树莓派 5 上的 40 针 GPIO 排针对齐
2. 轻轻按下以连接两块板

![连接两块板](/img/accessories/dual-2.5-router-hat/rpi-assemble-7.webp)

3. 连接后，使用 **M2.5×4×4 螺丝**固定板子，安装位置如下图所示：

![固定板子 - 步骤 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-8.webp)
![固定板子 - 步骤 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-9.webp)

## 安装散热片

1. 找到瑞莎 Dual 2.5G Router HAT 上的 Asmedia PCIe 交换芯片
2. 从散热片底部的导热垫上移除保护膜
3. 小心地将散热片对准并贴附到下图所示位置：

![散热片安装 - 步骤 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-b.webp)
![散热片安装 - 步骤 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-a.webp)

⚠️ **注意：散热片对于正常的热量管理至关重要。请勿在未安装散热片的情况下操作 HAT。**

## 安装 SSD

1. 找到瑞莎 Dual 2.5G Router HAT 上的 M.2 M-Key 插槽
2. 以 30 度角将 M.2 NVMe SSD 插入插槽
3. 轻轻按下 SSD 并使用 **M2×4×5 螺丝**固定，如图所示：

![SSD 安装 - 步骤 1](/img/accessories/dual-2.5-router-hat/rpi-assemble-10.webp)
![SSD 安装 - 步骤 2](/img/accessories/dual-2.5-router-hat/rpi-assemble-11.webp)

⚠️ **注意：确保 SSD 与 M.2 M-Key 接口兼容，并在用螺丝固定前正确就位。**

## 使用 FPC 扩展接口

瑞莎 Dual 2.5G Router HAT 包含一个 FPC 接口，可用于额外的 PCIe 扩展。以下是使用微雪 PCIe to M.2 MINI 转接板的示例。

### 所需组件

- 微雪 PCIe to M.2 MINI 转接板
- FPC 连接线
- M.2 SSD（MINI 尺寸）

![微雪 PCIe 转接板](/img/accessories/dual-2.5-router-hat/rpi-assemble-12.webp)

### 安装步骤

1. 找到瑞莎 Dual 2.5G Router HAT 上的 FPC 接口
2. 小心地将 FPC 连接线的一端连接到此接口，如图所示：

![将 FPC 连接到 Router HAT](/img/accessories/dual-2.5-router-hat/rpi-assemble-13.webp)

3. 将 FPC 连接线的另一端连接到微雪 PCIe to M.2 MINI 转接板：

![将 FPC 连接到转接板](/img/accessories/dual-2.5-router-hat/rpi-assemble-14.webp)

4. 将 M.2 SSD 插入微雪转接板并固定：

![在转接板上安装 SSD](/img/accessories/dual-2.5-router-hat/rpi-assemble-15.webp)

⚠️ **注意：FPC 接口与板载 M.2 插槽共享 PCIe 通道。同时使用两者可能会影响性能。**

## 最终步骤

1. 再次检查所有连接，确保所有螺丝都已正确拧紧
2. 将 12V 电源连接到瑞莎 Dual 2.5G Router HAT 上的 DC 插孔
3. 启动您的树莓派 5

您的瑞莎 Dual 2.5G Router HAT 现已准备就绪！
