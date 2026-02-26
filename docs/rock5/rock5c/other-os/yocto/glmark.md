---
sidebar_position: 15
---

# glmark2 使用

glmark2 是一个开源、跨平台的基准测试工具，专门用于评估和衡量计算机系统的 OpenGL (ES) 2.0 及更高版本 的图形性能。

## 基准测试

利用 glmark2 对 GPU 进行基准测试。

### 桌面终端

使用鼠标和键盘打开桌面左上角的终端，运行命令：

```text
glmark2-es2-wayland
```

效果如下：

<div style={{textAlign: 'center'}}>
    <img src="/img/rock5c/yocto_glmark2_002.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

### 串口终端

打开串口终端运行命令：

```text
root@rockchip-rk3588s-rock-5c:~# XDG_RUNTIME_DIR=/run/user/1000/ WAYLAND_DISPLAY=wayland-0 glmark2-es2-wayland
```

效果如下：

<div style={{textAlign: 'center'}}>
    <img src="/img/rock5c/yocto_glmark2_001.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
