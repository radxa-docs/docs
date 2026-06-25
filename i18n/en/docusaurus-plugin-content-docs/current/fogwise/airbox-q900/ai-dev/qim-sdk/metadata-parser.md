---
sidebar_position: 14
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Metadata Parser

`gst-ai-metadata-parser-example` performs object detection and parses the detection metadata (coordinates, class, confidence) into structured output, suitable for integration with external analytics systems or logging.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation) and [Model Download](./README.md#download-models-and-test-resources)

## Steps

### 1. Verify Model

```bash
ls -l /etc/models/yolox_quantized.tflite
```

### 2. View Configuration

```bash
cat /etc/configs/config-metadata-parser.json
```

### 3. Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
gst-ai-metadata-parser-example --config-file=/etc/configs/config-metadata-parser.json
```

</NewCodeBlock>

Press `Ctrl + C` to stop.

## Expected Output

```text
Running app with model: /etc/models/yolox_quantized.tflite and labels: /etc/labels/yolox.json
Using DSP delegate
VERBOSE: Replacing 329 out of 329 node(s) with delegate (TfLiteQnnDelegate) node
Pipeline state changed from PAUSED to PLAYING
```

The display shows the detection view while the terminal streams structured detection metadata (JSON format).

## Validation

- YOLOX model (329 ops) running on DSP
- Pipeline reaches `PLAYING` state
- Terminal outputs valid metadata structures
