---
sidebar_position: 10
description: "Yocto Build"
---

# Yocto Build

import RKYocto from '../../../common/yocto/\_yocto-rockchip.mdx';

<RKYocto />

## glmark2

This section demonstrates GPU benchmark testing on ROCK 5C using glmark2.

### Method 1: Serial Terminal

Execute the following command in the serial terminal:

```
root@rockchip-rk3588s-rock-5c:~# XDG_RUNTIME_DIR=/run/user/1000/ WAYLAND_DISPLAY=wayland-0 glmark2-es2-wayland
```

Result:

<div style={{textAlign: 'center'}}>
    <img src="/en/img/rock5c/yocto_glmark2_001.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

### Method 2: Desktop Terminal

The desktop environment includes the glmark2 runtime. After connecting keyboard and mouse, open the terminal window from the top-left corner of the desktop and run:

```
glmark2-es2-wayland
```

Result:

<div style={{textAlign: 'center'}}>
    <img src="/en/img/rock5c/yocto_glmark2_002.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
