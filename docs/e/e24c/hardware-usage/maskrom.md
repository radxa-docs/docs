---
sidebar_position: 5
---

# Maskrom 模式

瑞莎 E24C 板载 Maskrom 按键，用于主板进入 Maskrom 模式。

## 进入 Maskrom 模式

主板上电过程中检测到 Maskrom 按键被按下，主板会自动进入 Maskrom 模式。

详细操作步骤：

1. 使用 Type-C 数据线连接主板和 PC
2. 使用卡针或牙签按压 Maskrom 按键
3. 使用电源适配器给主板供电
4. 松开 Maskrom 按键

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-maskrom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 验证设备模式

使用 RKDevTool 工具可以验证设备是否进入 Maskrom 模式。

正常情况下，RKDevTool 软件会自动识别主板当前所处模式； 若未识别到设备，可以重新按照以上步骤操作一遍。

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
