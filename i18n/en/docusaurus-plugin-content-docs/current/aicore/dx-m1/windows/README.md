---
sidebar_position: 4
doc_kind: page
locale: en
board: dx-m1
task_type: getting-started
last_verified: 2026-06-30
---

# Windows Platform Support

The DX-M1 / DX-M1M AI accelerator supports Windows 10 / 11 x64. This guide covers driver installation, runtime setup, and application examples to help you get started with NPU inference on Windows.

## Prerequisites

- **Hardware**: DX-M1 or DX-M1M module installed via PCIe / M.2 interface
- **OS**: Windows 10 or Windows 11 (x64)
- **Runtime Library**: [Microsoft Visual C++ 2015-2022 Redistributable (x64)](https://aka.ms/vs/17/release/vc_redist.x64.exe)
- **Permissions**: Administrator privileges (required for driver installation and service registration)

## Driver Installation

The DX-M1 / DX-M1M communicates over PCIe on Windows and requires a companion driver.

First, clone the `dx_rt_windows` repository. All relative paths in the following steps (such as `m1\v3.2.0\...`) are relative to the root of this repository:

```bash
git clone https://github.com/DEEPX-AI/dx_rt_windows.git
cd dx_rt_windows
```

1. Navigate to `m1/v3.2.0/dxm1drv/`
2. Extract `dxm1drv.zip` to obtain `dxm1drv.inf`, `dxm1drv.sys`, and `dxm1drv.cat`
3. Right-click `dxm1drv.inf` and select **Install**
4. After installation, open Device Manager. Under **Processing accelerators**, you should see **DEEPX DEVICE - M1 PCI CONTROLLER**

## Runtime Installation

Once the driver is installed, set up the runtime daemon.

1. Open **Command Prompt (cmd)** or **PowerShell** as Administrator
2. Navigate to the runtime directory (using v3.2.0 as an example):

```bash
cd m1\v3.2.0\dx_rt\bin
```

3. Register and start the DXRT daemon:

```bash
dxrtd.exe --install
dxrtd.exe --start
```

`dxrtd.exe` is registered as a Windows service and starts automatically on system boot. You can also manage it via `services.msc`.

:::tip Version Selection
Both `v3.2.0` and `v3.3.1` use the same driver. `v3.2.0` provides the full set: driver + runtime + application examples; `v3.3.1` includes only the runtime.
:::

## Verification

Use `dxrt-cli.exe` to verify that the NPU device is recognized:

```bash
dxrt-cli.exe -s
```

Successful output should display device information similar to:

```text
Device Information:
  Device ID: 0
  Device Name: DX-M1
  Firmware Version: ...
  Status: Ready
```

You can also use `dxtop.exe` for real-time NPU monitoring:

```bash
dxtop.exe
```

## Application Examples

### Demo Applications (v3.0.2, Recommended)

`m1/v3.2.0/dx_app/v3.0.2/` provides prebuilt demo applications covering object detection, face recognition, pose estimation, semantic segmentation, and more.

1. On first use, run `m1/v3.2.0/dx_app/setup.bat` to download models and sample videos
2. Launch the interactive menu:

```bash
cd m1\v3.2.0\dx_app\v3.0.2
run_demo.bat
```

3. Follow the menu prompts to select a model and run inference

Common models include `yolov5_sync`, `yolov8_sync`, `scrfd_sync`, and `efficientnet_sync`, each available in synchronous (`_sync`) and asynchronous (`_async`) modes.

### Python Interface

Install the Python wheel to use the NPU directly from Python:

```bash
# Choose the wheel matching your Python version (Python 3.10 ~ 3.14 supported)
pip install m1\v3.2.0\dx_rt\python\dx_engine-1.1.4-cp312-cp312-win_amd64.whl
```

Python CLI inference example:

```bash
python m1\v3.2.0\dx_rt\python\cli\run_model.py -m <model.dxnn> -l 100
```

Python API example:

```python
from dx_engine import InferenceEngine

engine = InferenceEngine()
engine.load_model("model.dxnn")
engine.run()
```

## Troubleshooting

- **DEEPX device not visible in Device Manager**: Check the PCIe / M.2 physical connection and ensure the module is properly seated. Try rescanning for hardware changes (`devmgmt.msc` → Action → Scan for hardware changes).
- **`dxrt-cli.exe -s` fails**: Verify that `dxrtd.exe` is running (check `DXRT Daemon` service status in `services.msc`).
- **Demo produces no output**: Ensure `setup.bat` has been run to download models and video files. Network access to `sdk.deepx.ai` is required.
- **VC++ errors**: Confirm that Microsoft Visual C++ 2015-2022 Redistributable (x64) is installed.
