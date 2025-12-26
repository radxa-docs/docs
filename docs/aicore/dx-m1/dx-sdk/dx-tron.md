---
sidebar_position: 8
---

# DX-Tron

**DX-Tron（DXNN 模型查看器）** 是 DXNN 模型的结构查看器。是基于 [Netron](https://github.com/lutzroeder/netron) 进行开发的，
支持 X86 平台的 Windows 与 Linux 系统。

## 安装方法

请在 DX-M1 SDK [资源下载](../download.md)页面下载 DX-Tron

### Linux 安装方法

#### 安装依赖

<NewCodeBlock tip="X86 PC" type="PC">

```bash
sudo apt update
sudo apt install -y libfuse2 libxss1 libxtst6 libappindicator1 libgconf-2-4 libnss3
```

</NewCodeBlock>

#### 添加执行权限

<NewCodeBlock tip="X86 PC" type="PC">

```bash
chmod +x DXTron-2.0.0.AppImage
```

</NewCodeBlock>

#### 启动 DX-Tron

<NewCodeBlock tip="X86 PC" type="PC">

```bash
./DXTron-2.0.0.AppImage
```

</NewCodeBlock>

### Windows 安装方法

在文件夹窗口中双击 `DXTron Setup 2.0.0.exe`, 然后按着安装引导进行安装即可。

## 使用方法

在 GUI 界面点击 `Open Model` 打开 dxnn 格式模型文件, 即可查看 dxnn 模型结构。

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/dx-tron.webp"/>
</div>

<br />

在 GUI 界面的右侧栏目可以选择查看 dxnn 模型的整体模型图，NPU graph， CPU graph

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/dx-tron-2.webp"/>
</div>
