---
sidebar_position: 7
---

# WebGL 使用指南

本教程用于在 Dragon Q6A 上验证浏览器是否启用了 WebGL（GPU 加速渲染）。

:::tip
如果你通过 SSH 远程操作，请确保系统已连接显示器并进入桌面环境，否则浏览器可能无法正常启用 GPU 加速。
:::

## 安装 chromium-browser

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo apt update
sudo apt install chromium-browser
```

</NewCodeBlock>

## 运行 chromium-browser

启动 chromium-browser：

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
chromium-browser
```

</NewCodeBlock>

打开以下任意页面即可查看 WebGL 支持情况：

- https://webglreport.com/
- https://get.webgl.org/

如果页面显示 WebGL 不可用，可在 `chrome://gpu` 页面查看 Graphics Feature Status 以排查是否启用了硬件加速。
