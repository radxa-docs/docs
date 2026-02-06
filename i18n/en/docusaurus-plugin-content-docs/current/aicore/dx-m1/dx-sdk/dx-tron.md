---
sidebar_position: 8
---

# DX-Tron

**DX-Tron (DXNN model viewer)** is a structure viewer for DXNN models. It is developed based on [Netron](https://github.com/lutzroeder/netron) and supports Windows and Linux on the x86 platform.

## Installation

Download DX-Tron from the DX-M1 / DX-M1M SDK [Downloads page](../download.md).

### Linux

#### Install dependencies

<NewCodeBlock tip="X86 PC" type="PC">

```bash
sudo apt update
sudo apt install -y libfuse2 libxss1 libxtst6 libappindicator1 libgconf-2-4 libnss3
```

</NewCodeBlock>

#### Add execute permission

<NewCodeBlock tip="X86 PC" type="PC">

```bash
chmod +x DXTron-2.0.0.AppImage
```

</NewCodeBlock>

#### Launch DX-Tron

<NewCodeBlock tip="X86 PC" type="PC">

```bash
./DXTron-2.0.0.AppImage
```

</NewCodeBlock>

### Windows

Double-click `DXTron Setup 2.0.0.exe` in File Explorer and follow the installation wizard.

## Usage

In the GUI, click `Open Model` to open a DXNN model file and view its structure.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-tron.webp"/>
</div>

<br />

In the panel on the right, you can switch between the full model graph, the NPU graph, and the CPU graph.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-tron-2.webp"/>
</div>
