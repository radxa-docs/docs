---
sidebar_position: 8
---

# DX-Tron

**DX-Tron (DXNN Model Viewer)** is a structure viewer for DXNN models. It is developed based on [Netron](https://github.com/lutzroeder/netron),
supporting Windows and Linux systems on X86 platform.

## Installation

Please download the DX-Tron installation package from the DX-M1 SDK [Resources Download](../download.md) page and extract it

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

#### Add Execute Permissions

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

In the folder window, double-click `DXTron Setup 0.0.8.exe`, then follow the installation wizard to complete the installation.

## Usage

In the GUI interface, click `Open Model` to open the dxnn format model file, and you can view the dxnn model structure.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-tron.webp"/>
</div>

<br />

In the right sidebar of the GUI interface, you can select to view the overall model graph, NPU graph, and CPU graph of the dxnn model

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-tron-2.webp"/>
</div>
