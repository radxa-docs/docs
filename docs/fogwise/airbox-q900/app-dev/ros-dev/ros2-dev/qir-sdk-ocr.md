---
sidebar_position: 4
doc_kind: page
locale: zh
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# 基础 OCR

演示 OCR（光学字符识别）服务。该示例订阅 ROS 系统的图片话题，发布 OCR 识别结果。

## 管道架构

OCR 服务由三个 ROS 节点组成：

| 节点          | 说明                                  |
| ------------- | ------------------------------------- |
| `OCR_SERVER`  | 接收客户端请求，fork OCR 节点         |
| `OCR_ROSNODE` | 订阅图片话题，执行 OCR 识别并发布结果 |
| `OCR_CLIENT`  | 向服务器发送 OCR 请求并获取结果       |

## 前提条件

- 已完成 [QIR SDK 安装](qir-sdk.md)
- 准备好测试图片，例如 `~/test.jpg`

## 运行

在 **三个独立终端** 中分别执行以下命令：

**终端 1** — 启动 OCR 服务器：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 run ocr_service ocr_server
```

</NewCodeBlock>

**终端 2** — 发布测试图片：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 run ocr_service ocr_testnode --topic test --picture ~/test.jpg
```

</NewCodeBlock>

**终端 3** — 发起 OCR 请求：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 run ocr_service ocr_client test
```

</NewCodeBlock>

## 预期输出

终端 1 打印 OCR 识别结果，例如：

```text
[INFO] [Ocr_client_async]: Result of ocr_request: for test  True response  test_response
```

## 停止

各终端按 `Ctrl + C` 停止。
