---
sidebar_position: 10
description: "Yocto 构建"
---

# Yocto 构建

import RKYocto from '../../../common/yocto/\_yocto-rockchip.mdx';

<RKYocto />

## glmark2

本小节会在rock5c上展示利用glmark2对GPU进行基准测试

### 方式一 串口终端

在串口中断中执行如下命令

```
root@rockchip-rk3588s-rock-5c:~# XDG_RUNTIME_DIR=/run/user/1000/ WAYLAND_DISPLAY=wayland-0 glmark2-es2-wayland
```

效果如下

<div style={{textAlign: 'center'}}>
    <img src="/img/rock5c/yocto_glmark2_001.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>


### 方式二 桌面终端

桌面自带glmark2的运行环境，再接上键鼠后直接打开桌面左上角的终端窗口运行。

```
glmark2-es2-wayland
```

效果如下

<div style={{textAlign: 'center'}}>
    <img src="/img/rock5c/yocto_glmark2_002.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

