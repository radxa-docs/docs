---
sidebar_position: 4
---

# Maskrom 按键

瑞莎 ROCK 4D 板载 Maskrom 按键，用于进入 Maskrom 模式。

## 使用指南

### 进入 Maskrom 模式

主板上电前，按住 Maskrom 按键，上电后可以松开按键。

### 验证设备模式

使用 RKDevTool 工具可以验证设备是否进入 Maskrom 模式。

正常情况下，RKDevTool 软件会自动识别到 ROCK 4D 主板当前所处模式； 若未识别到设备，可以重新按照以上步骤操作一遍。

<Tabs queryString="maskrom-display">

<TabItem value="Windows">
打开 RKDevTool 软件查看识别到的设备信息：
<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/maskrom-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="PC">
使用 `rkdeveloptool ld` 命令查看识别到的设备信息：
<NewCodeBlock tip="PC-Host$" type="host">
```
sudo rkdeveloptool ld
```
</NewCodeBlock>

输出类似内容：识别到一个 Maskrom 设备

<NewCodeBlock tip="PC-Host$" type="host">
```
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```
</NewCodeBlock>

</TabItem>

</Tabs>
