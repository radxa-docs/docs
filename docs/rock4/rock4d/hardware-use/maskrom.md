---
sidebar_position: 4
---

# Maskrom 按键

瑞莎 ROCK 4D 板载 Maskrom 按键，用于进入 Maskrom 模式。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-maskrom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

### 进入 Maskrom 模式

① : 主板上电前，按住 Maskrom 按键，上电后可以松开按键

② : 使用数据线连接主板的 USB 3.0 Type-A OTG 端口和电脑的端口

### 验证设备模式

使用 RKDevTool 工具可以验证设备是否进入 Maskrom 模式。

:::tip
RKDevTool 的使用可以参考 [RKDevTool 使用](../low-level-dev/tool_rkdevtool) 教程。
:::

正常情况下，RKDevTool 软件会自动识别到 ROCK 4D 主板当前所处模式； 若未识别到设备，可以重新按照以上步骤操作一遍。

<Tabs queryString="maskrom-display">

<TabItem value="Windows">
打开 RKDevTool 软件查看识别到的设备信息：
<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/maskrom-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux/MacOS">
使用 `rkdeveloptool ld` 命令查看识别到的设备信息：
<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool ld
```
</NewCodeBlock>

输出类似内容：说明识别到一个 Maskrom 设备

```text
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

</TabItem>

</Tabs>
