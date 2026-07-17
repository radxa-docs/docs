---
sidebar_position: 4
doc_kind: page
locale: en
board: airbox-q900
task_type: app-dev
last_verified: 2026-07-10
---

# Basic OCR

Demonstrates OCR (Optical Character Recognition) service. It subscribes to image topics from the ROS system and publishes OCR recognition results.

## Pipeline Architecture

The OCR service consists of three ROS nodes:

| Node          | Description                                                    |
| ------------- | -------------------------------------------------------------- |
| `OCR_SERVER`  | Receives client requests, forks OCR nodes                      |
| `OCR_ROSNODE` | Subscribes to image topics, performs OCR and publishes results |
| `OCR_CLIENT`  | Sends OCR requests to server and retrieves results             |

## Prerequisites

- [QIR SDK installed](qir-sdk.md)
- A test image prepared, e.g. `~/test.jpg`

## Run

Execute in **three separate terminals**:

**Terminal 1** — Start the OCR server:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 run ocr_service ocr_server
```

</NewCodeBlock>

**Terminal 2** — Publish a test image:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 run ocr_service ocr_testnode --topic test --picture ~/test.jpg
```

</NewCodeBlock>

**Terminal 3** — Send an OCR request:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
source /opt/ros/jazzy/setup.bash
ros2 run ocr_service ocr_client test
```

</NewCodeBlock>

## Expected Output

Terminal 1 prints the OCR recognition result, e.g.:

```text
[INFO] [Ocr_client_async]: Result of ocr_request: for test  True response  test_response
```

## Stop

Press `Ctrl + C` in each terminal to stop.
