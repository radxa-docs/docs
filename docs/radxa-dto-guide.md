---
title: Radxa SBC 添加 Device Tree Overlay
---

# Radxa SBC 添加 Device Tree Overlay

本文介绍如何在 Radxa SBC（如 ROCK 3A、ROCK 3B、E23、E25、CM3 等）上添加自定义 Device Tree Overlay（设备树overlay），而不需要直接修改内核的 DTS 文件。

## 概念说明

- **DTS**（Device Tree Source）：设备树源码，文本格式
- **DTO**（Device Tree Overlay）：设备树overlay，在已有设备树基础上做增量修改
- **DTC**（Device Tree Compiler）：设备树编译器，将 DTS 编译为 DTB
- **`rsetup`**：Radxa 提供的外壳配置工具，用于管理 overlay

## 操作流程

### 第一步：克隆仓库并准备构建环境

```bash
git clone https://github.com/radxa-pkg/radxa-overlays
cd radxa-overlays

# 安装构建依赖
sudo apt build-dep . -y
```

### 第二步：找到对应 SoC 的目录

Overlay 文件按 SoC 平台分类存放：

```
arch/arm64/boot/dts/rockchip/overlays/
├── rk3568-i2c1.dts     # RK3568 平台
├── rk3588-i2c1.dts     # RK3588 平台
├── ...
```

**注意**：overlay 文件名需要与主设备树中的节点名对应。例如 `&i2c1` 表示对主设备树中的 `i2c1` 节点做覆盖。

### 第三步：编写 Overlay DTS 文件

参考 `rk3568-i2c1.dts`：

```dts
/dts-v1/;
/plugin/;

/ {
    metadata {
        title = "Enable I2C1";
        compatible = "radxa,rock-3a", "radxa,rock-3b", "radxa,e23", "radxa,e25",
                     "radxa,cm3s-io", "radxa,radxa-cm3-sodimm-io";
        category = "misc";
        exclusive = "GPIO0_B4", "GPIO0_B3";
        description = "Enable I2C1.
On Radxa ROCK 3A this is SDA pin 27 and SCL pin 28.
On Radxa ROCK 3B this is SDA pin 27 and SCL pin 28.
On Radxa E23 this is SDA pin 36 and SCL pin 40.
On Radxa E25 this is SDA pin 1 and SCL pin 10.
On Radxa CM3S IO this is SDA pin3 and SCL pin 5";
    };
};

&i2c1 {
    status = "okay";
    pinctrl-names = "default";
    pinctrl-0 = <&i2c1_xfer>;
};
```

#### metadata 字段说明

| 字段 | 说明 |
|------|------|
| `title` | overlay 名称，在 `rsetup` 菜单中显示 |
| `compatible` | 适用设备列表，必须与主设备树的 compatible 匹配 |
| `category` | 分类，如 `misc`、`display`、`audio` 等 |
| `exclusive` | 互斥的 GPIO 引脚，与其他 overlay 冲突时提示 |
| `description` | 详细说明，在 rsetup UI 中可见 |

#### 常用 Overlay 操作

**启用节点**（如 I2C、SPI、UART）：

```dts
&i2c1 {
    status = "okay";
};
```

**修改节点属性**：

```dts
&uart2 {
    status = "okay";
    pinctrl-names = "default";
    pinctrl-0 = <&uart2m1_xfer>;
};
```

**添加子节点**：

```dts
&i2c1 {
    /* 添加一个设备到 i2c1 总线 */
    myDevice@3c {
        compatible = "vendor,my-device";
        reg = <0x3c>;
    };
};
```

### 第四步：编译打包

```bash
make deb
```

构建完成后会生成 `.deb` 包，位于上级目录：

```
../radxa-overlays_*.deb
```

### 第五步：安装并应用

```bash
sudo apt install -y ../radxa-overlays_*.deb
```

### 第六步：使用 rsetup 启用 overlay

```bash
sudo rsetup
```

进入交互菜单：

```
Radxa Overlay Configuration
├── Overlay: Enable I2C1                  [ ]   ← 勾选启用
├── Save and exit                              ← 保存退出
```

也可以用命令行：

```bash
# 查看可用 overlay
sudo rsetup --list

# 启用指定 overlay
sudo rsetup --enable-overlay rk3568-i2c1

# 禁用 overlay
sudo rsetup --disable-overlay rk3568-i2c1
```

## 完整示例：新增 SPI1 Overlay

假设在 RK3568 平台上需要启用 SPI1：

### 1. 创建文件

`arch/arm64/boot/dts/rockchip/overlays/rk3568-spi1.dts`：

```dts
/dts-v1/;
/plugin/;

/ {
    metadata {
        title = "Enable SPI1";
        compatible = "radxa,rock-3a", "radxa,rock-3b", "radxa,e23", "radxa,e25";
        category = "misc";
        exclusive = "GPIO1_M1", "GPIO1_M2";
        description = "Enable SPI1 on 40-pin header.";
    };
};

&spi1 {
    status = "okay";
    pinctrl-names = "default";
    pinctrl-0 = <&spi1m1_xfer>;
};
```

### 2. 提交到 GitHub PR（推荐）

Fork 仓库后在你自己分支上提交 PR：

```bash
git checkout -b add-spi1-overlay
git add arch/arm64/boot/dts/rockchip/overlays/rk3568-spi1.dts
git commit -m "overlay: add SPI1 enable for RK3568 platforms"
git push origin add-spi1-overlay
# 然后在 GitHub 上提 PR
```

官方 merge 后，新 overlay 会随 `radxa-overlays` 包更新自动推送到设备。

## 方式二：本地编译后通过 rsetup 加载（无需 PR）

不想提 PR？可以直接在设备上编译，然后通过 rsetup 加载第三方 overlay。

### 第一步：克隆 overlay 仓库

```bash
git clone https://github.com/radxa/overlays.git
cd overlays
```

### 第二步：编写自己的 Overlay 文件

在对应目录创建 DTS 文件，例如 `arch/arm64/boot/dts/rockchip/overlays/rk3568-spi1.dts`。

### 第三步：编译 DTBO

```bash
# 编译单个 overlay 文件
dtc -I dts -O dtb -o arch/arm64/boot/dts/rockchip/overlays/rk3568-spi1.dtbo \
  arch/arm64/boot/dts/rockchip/overlays/rk3568-spi1.dts

# 或者用项目自带的 Makefile
make
```

### 第四步：通过 rsetup 安装第三方 Overlay

```bash
sudo rsetup
```

进入菜单：

```
Overlays
└── Install 3rd party overlay
```

然后选择你刚编译的 overlay（路径为 `arch/arm64/boot/dts/rockchip/overlays/*.dts`），确认后退出并重启。

### 第五步：验证

```bash
# 查看已加载的 overlay
cat /boot/extlinux/extlinux.conf

# 或检查 overlay 是否生效
ls /boot/dtb/rockchip/overlay/
```

---

## 附录

### 查找可用的节点名

查看主设备树源文件（需要内核源码）：

```bash
# 查看主设备树中已有的 i2c 节点
grep -r "i2c[0-9]" arch/arm64/boot/dts/rockchip/ --include="*.dts" | head
```

### 查看当前已加载的 overlay

```bash
ls /boot/dtb/rockchip/overlay/ 2>/dev/null
# 或
cat /sys/kernel/debug/device-tree/overlay/ 2>/dev/null
```

### rsetup 常用命令

```bash
rsetup --help
rsetup --list              # 列出所有 overlay
rsetup --enable-overlay    # 启用
rsetup --disable-overlay   # 禁用
rsetup --reboot            # 更改后重启
```

如果觉得改动有通用价值，欢迎提 PR 到 [radxa-pkg/radxa-overlays](https://github.com/radxa-pkg/radxa-overlays)，官方 merge 后所有人就都能用了。
