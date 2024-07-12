---
sidebar_position: 3
---

# AV out 接口

## Vedio 测试

使用 MINI AV 转 HDMI 视频转换器连接 ROCK 2A 的 AV Out，和 HDMI 显示屏，

<img src="/img/rock2a/rock-2a-av-out.webp" width="800" alt="rock 2a pack" />


- 开启 Overlay

  1. 打开 Kconsole 终端, 运行 rsetup 命令：

  <pre> $ rsetup </pre>

  2. 通过 [设备树配置](/rock2/rock2a/radxa-os/rsetup.md)。来启用 Enable analog video output 的 Overlay。

  :::tip

  请启用 [] Enable analog video output 项 Overlay。<br/>
  在启用成功显示 [*] Enable analog video output 后退出重启才能使配置生效。

  :::

  3. 重启系统

- 测试

  重启后，HDMI 屏能成功显示系统画面。


## 音频测试

- 插入耳机

  将耳机插入 ROCK 2A 的耳机插孔。

  <img src="/img/rock2a/rock-2a-headphone.webp" width="800" alt="rock 2a pack" />

- 确认硬件连接

  确保耳机正确插入耳机插孔，连接牢固，没有松动。

- 检查声音设置

  打开系统的声音设置，通常可以在系统设置或控制面板中找到。确保音频输出设备已正确设置为耳机

- 播放音频

  播放音频文件，如音乐、视频或其他媒体文件，以确保声音能够通过耳机输出

- 检查音量控制

  确保系统音量和应用程序音量设置合适，并且未静音

- 使用终端命令测试

  在终端中使用命令行工具来测试音频输出。可以使用 aplay 或 speaker-test 命令，例如：

  使用 aplay 播放音频文件：

  ```bash
  aplay test.wav
  ```
  
  检查播放是否正常、是否有杂音。
