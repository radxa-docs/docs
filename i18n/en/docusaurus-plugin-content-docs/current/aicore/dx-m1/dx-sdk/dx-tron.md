---
sidebar_position: 8
---

# DX-Tron

**DX-Tron (DXNN Model Viewer)** is a tool for inspecting DXNN model structures. It is developed based on [Netron](https://github.com/lutzroeder/netron) and supports Windows and Linux on x86 platforms.

## Installation

Download DX-Tron from the DX-M1 SDK [Downloads](../download.md) page.

### Linux

#### Install Dependencies

<NewCodeBlock tip="X86 PC" type="PC">

```bash
sudo apt update
sudo apt install -y libfuse2 libxss1 libxtst6 libappindicator1 libgconf-2-4 libnss3
```

</NewCodeBlock>

#### Add Execute Permission

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

In the right panel of the GUI, you can choose to view the overall model graph, the NPU graph, or the CPU graph.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-tron-2.webp"/>
</div>
