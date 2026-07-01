---
sidebar_position: 4
doc_kind: page
locale: zh
board: dx-m1
task_type: getting-started
last_verified: 2026-06-30
---

# Windows 平台支持

智核 DX-M1 / DX-M1M 支持 Windows 10 / 11 x64 平台。本页介绍驱动安装、运行时配置及应用示例，帮助你快速在 Windows 上使用 NPU 推理。

## 使用前提

- **硬件**：智核 DX-M1 或 DX-M1M 模组，已通过 PCIe / M.2 接口接入主机
- **操作系统**：Windows 10 或 Windows 11（x64）
- **运行库**：[Microsoft Visual C++ 2015-2022 Redistributable (x64)](https://aka.ms/vs/17/release/vc_redist.x64.exe)
- **权限**：管理员权限（驱动安装和服务注册需要）

## 驱动安装

智核 DX-M1 / DX-M1M 在 Windows 上通过 PCIe 接口通信，需安装配套驱动。

1. 解压 `dx_rt_windows` 软件包，进入 `m1/v3.2.0/dxm1drv/` 目录
2. 解压 `dxm1drv.zip`，得到 `dxm1drv.inf`、`dxm1drv.sys`、`dxm1drv.cat`
3. 右键点击 `dxm1drv.inf`，选择 **安装**
4. 安装完成后，打开设备管理器，在 **处理加速器 (Processing accelerators)** 下应能看到 **DEEPX DEVICE - M1 PCI CONTROLLER**

## 运行时安装

驱动安装完成后，安装运行时守护进程。

1. 以管理员身份打开 **命令提示符 (cmd)** 或 **PowerShell**
2. 进入运行时目录（以 v3.2.0 为例）：

```bash
cd m1\v3.2.0\dx_rt\bin
```

3. 注册并启动 DXRT 守护进程：

```bash
dxrtd.exe --install
dxrtd.exe --start
```

`dxrtd.exe` 注册为 Windows 服务后，系统启动时会自动运行。你也可以使用 `services.msc` 管理该服务。

:::tip 版本选择
`v3.2.0` 和 `v3.3.1` 使用相同的驱动，可按需选用。`v3.2.0` 提供完整的驱动 + 运行时 + 应用示例；`v3.3.1` 仅包含运行时。
:::

## 设备验证

使用 `dxrt-cli.exe` 验证 NPU 设备是否正常识别：

```bash
dxrt-cli.exe -s
```

正常输出应显示设备信息，类似：

```text
Device Information:
  Device ID: 0
  Device Name: DX-M1
  Firmware Version: ...
  Status: Ready
```

你也可以使用 `dxtop.exe` 实时监控 NPU 状态：

```bash
dxtop.exe
```

## 应用示例

### 演示应用（v3.0.2，推荐）

`m1/v3.2.0/dx_app/v3.0.2/` 提供预编译的演示程序，涵盖目标检测、人脸识别、姿态估计、语义分割等任务。

1. 首次使用需运行 `m1/v3.2.0/dx_app/setup.bat` 下载模型和示例视频
2. 运行交互式菜单：

```bash
cd m1\v3.2.0\dx_app\v3.0.2
run_demo.bat
```

3. 按菜单提示选择对应模型即可运行推理演示

常用模型包括 `yolov5_sync`、`yolov8_sync`、`scrfd_sync`、`efficientnet_sync` 等，均提供同步 (`_sync`) 和异步 (`_async`) 两种模式。

### Python 接口

安装 Python wheel 包后可直接在 Python 中调用 NPU：

```bash
# 根据 Python 版本选择对应的 wheel（支持 Python 3.10 ~ 3.14）
pip install m1\v3.2.0\dx_rt\python\dx_engine-1.1.4-cp312-cp312-win_amd64.whl
```

Python CLI 推理示例：

```bash
python m1\v3.2.0\dx_rt\python\cli\run_model.py -m <model.dxnn> -l 100
```

Python API 调用示例：

```python
from dx_engine import InferenceEngine

engine = InferenceEngine()
engine.load_model("model.dxnn")
engine.run()
```

## 故障排除

- **设备管理器中看不到 DEEPX 设备**：检查 PCIe / M.2 物理连接，确认模组已正确插入。尝试重新扫描硬件（`devmgmt.msc` → 操作 → 扫描检测硬件改动）。
- **dxrt-cli.exe -s 报错**：确认 `dxrtd.exe` 已启动（`services.msc` 中查看 `DXRT Daemon` 服务状态）。
- **运行 demo 无输出**：确认已执行 `setup.bat` 下载模型和视频文件，网络需能访问 `sdk.deepx.ai`。
- **VC++ 报错**：确认已安装 Microsoft Visual C++ 2015-2022 Redistributable (x64)。
