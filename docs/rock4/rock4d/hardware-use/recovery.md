---
sidebar_position: 4
---

# Recovery 引脚

:::tip
在硬件版本 v1.12 及之后的版本中，去除了 Recovery 引脚，改为了供电引脚，如果需要进入 Loader 模式，请进入系统后使用 `reboot loader` 命令。
:::

瑞莎 ROCK 4D 引出 Recovery 引脚，用于进入 Loader 模式。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-recovery.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

### 进入 Loader 模式

主板上电前，使用杜邦线或者跳线帽将 Recovery 引脚短接，上电后可以断开短接。

### 验证设备模式

使用 RKDevTool 工具可以验证设备是否进入 Loader 模式。

:::tip
RKDevTool 的使用可以参考 [RKDevTool 使用](../low-level-dev/tool_rkdevtool) 教程。
:::

正常情况下，RKDevTool 软件会自动识别到 ROCK 4D 主板当前所处模式； 若未识别到设备，可以重新按照以上步骤操作一遍。

<Tabs queryString="recovery-display">

<TabItem value="Windows">
打开 RKDevTool 软件查看识别到的设备信息：
<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/loader-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux/MacOS">
使用 `rkdeveloptool ld` 命令查看识别到的设备信息：
<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool ld
```
</NewCodeBlock>

输出类似内容：说明识别到一个 Loader 设备

```text
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Loader
```

</TabItem>

</Tabs>
