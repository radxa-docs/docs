---
sidebar_position: 8
---

# DX-Tron

**DX-Tron (DXNN Model Viewer)** is a structure viewer for DXNN models. It is developed based on [Netron](https://github.com/lutzroeder/netron) and supports Windows and Linux systems on x86 platforms.

## Installation

Please download the DX-Tron installation package from the DX-M1 SDK [Resource Download](../download.md) page and extract it:

<NewCodeBlock tip="X86 PC" type="PC">

```bash
unzip DX_Tron_v0.0.8.zip -d DX_Tron_v0.0.8
```

</NewCodeBlock>

### Linux Installation

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
cd DX_Tron_v0.0.8/Linux/
chmod +x DXTron-0.0.8.AppImage
```

</NewCodeBlock>

#### Launch DX-Tron

<NewCodeBlock tip="X86 PC" type="PC">

```bash
./DXTron-0.0.8.AppImage
```

</NewCodeBlock>

### Windows Installation

Double-click `DXTron Setup 0.0.8.exe` in the folder window, then follow the installation wizard to complete the setup.

## Usage

In the GUI interface, click `Open Model` to open a DXNN format model file and view the DXNN model structure.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-tron.webp"/>
</div>

<br />

In the right panel of the GUI interface, you can choose to view the overall model diagram, NPU graph, and CPU graph of the DXNN model.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-tron-2.webp"/>
</div>

<br />

## Features

1. View DXNN model structure
2. View input/output shapes of each node in the DXNN model
3. View attributes of each node in the DXNN model
4. View input/output data of each node in the DXNN model
5. View computation graph of each node in the DXNN model
6. View computation graph (NPU part) of each node in the DXNN model
7. View computation graph (CPU part) of each node in the DXNN model
