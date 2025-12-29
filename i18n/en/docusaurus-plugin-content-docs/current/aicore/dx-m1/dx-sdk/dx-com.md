---
sidebar_position: 2
---

# DX-COM Model Compiler

## Overview

**DX-COM (model compiler)** generates NPU instruction sets based on the provided ONNX model and configuration file, compiling the ONNX model into a DXNN model file that can run on the NPU. A DXNN file contains the generated instruction set and weight data.

## System Requirements

| CPU          | x86 (x64)                      |
| ------------ | ------------------------------ |
| Memory (RAM) | ≥ 16GB                         |
| Storage      | ≥ 8GB                          |
| OS           | Ubuntu 18.04/20.04/22.04 (x64) |
| LDD Version  | ≥ 2.28                         |

## Installation

### Install Required Libraries

- libgl1-mesa-glx
- libglib2.0-0

Install the required libraries using the following command.

<NewCodeBlock tip="X86 PC" type="PC">

```bash
sudo apt-get install -y --no-install-recommends libgl1-mesa-glx libglib2.0-0 make
```

</NewCodeBlock>

### Download the DX-COM Package

Download the DX-COM package from the DX-M1 SDK [Downloads](../download.md) page and extract it.

<NewCodeBlock tip="X86 PC" type="PC">

```bash
tar -xvf dx_com_M1_v2.1.0.tar.gz
```

</NewCodeBlock>

## Usage

### Model Configuration

The parameters used for compilation must be configured in a JSON file.

#### Model Input Configuration

Set the input layer name and input shape for the ONNX model.

```vim
inputs : ONNX input name shape info
```

**Example:**

```json
{
  "inputs": {
    "input.1": [ # ONNX input's name
      1,        # Batch Size(MUST BE SET AS 1)
      3,        # ONNX input's shape
      512,
      512
    ]
  }
```

#### Calibration Method Configuration

Configure the parameters for the calibration method.

**calibration_num**: number of images used for calibration.

To minimize accuracy loss, try different `calibration_num` values. You can compile the model with different settings (e.g., `calibration_num=1`, `5`, `10`, `100`, or `1000`), measure the accuracy for each setting, and choose the one with the best accuracy.

**calibration_method**: calibration method.

Options: `["ema", "minmax"]`

:::tip
In most cases, `"ema"` provides better accuracy, but in some scenarios `"minmax"` may work better.
:::

**Example:**

```json
...
"calibration_num": 100,
"calibration_method": "ema",
...
```

#### Data Loader Configuration

Configure the parameters for the calibration dataset. It is recommended to use the same dataset you use for training or inference.

- dataset_path: root directory of the calibration dataset (files will be searched recursively).

- file_extensions: target image file extensions.

- preprocessings: image preprocessing steps.

**Example:**

```json
...
"default_loader": {
    "dataset_path": "/datasets/ILSVRC2012/",
    "file_extensions": [
      "jpeg",
      "jpg",
      "png",
      "JPEG"
    ],
    "preprocessings":
    [
      ...continued in next step...
    ]
  }
...
```

Input Image Preprocessing Configuration

The preprocessing pipeline required before feeding images into the ONNX model. These configurations are used to preprocess the calibration dataset during compilation.
Items marked with (\*) will be executed on the NPU side to reduce CPU workload. Therefore, preprocessing steps moved to the NPU should be omitted in runtime software. If no preprocessing is required, you can skip this section.

| Preprocessing   | Parameters / Options                          | Description                                                                                                                                                                                                                            | Example                       |
| --------------- | --------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------- |
| `convertColor`  | `RGB2BGR`, `BGR2RGB`, `BGR2GRAY`, `BGR2YCrCb` | Convert color channel order                                                                                                                                                                                                            | `"RGB2BGR"`                   |
| `resize`        | `mode`                                        | `default` (opencv) or `torchvision`                                                                                                                                                                                                    | `"default"` / `"torchvision"` |
|                 | `width`, `height`                             | Target image size (default mode only)                                                                                                                                                                                                  | `width: 224`, `height: 224`   |
|                 | `size`                                        | Target short-side size (torchvision mode only)                                                                                                                                                                                         | `size: 256`                   |
|                 | `interpolation`                               | Interpolation (optional)<br />Options for **`default`**: "NEAREST", "LINEAR"(default), "AREA", "CUBIC", "LANCZOS4" <br /> Options for **`torchvision`**: <br /> "NEAREST", "LANCZOS", "BILINEAR"(default), "BICUBIC", "BOX", "HAMMING" | `LINEAR`, `BILINEAR`          |
| `centercrop`    | `width`, `height`                             | Crop the given size from the image center                                                                                                                                                                                              | `width: 224`, `height: 224`   |
| `transpose`     | `axis`                                        | Dimension order (permute)                                                                                                                                                                                                              | `[2, 0, 1]`                   |
| `normalize (*)` | `mean`, `std`                                 | Normalization; supports scalar or array                                                                                                                                                                                                | `[0.5,0.5,0.5]`               |
| `mul (*)`       | `x`                                           | Multiply all pixels by a value                                                                                                                                                                                                         | `x: 255`                      |
| `add (*)`       | `x`                                           | Add a value to all pixels                                                                                                                                                                                                              | `x: 0.1`                      |
| `subtract (*)`  | `x`                                           | Subtract a value from all pixels                                                                                                                                                                                                       | `x: 0.1`                      |
| `div (*)`       | `x`                                           | Divide all pixels by a value                                                                                                                                                                                                           | `x: 255.0`                    |
| `expandDim`     | `axis`                                        | Expand one dimension at the specified axis                                                                                                                                                                                             | `axis: 0`                     |

:::info
Items marked with (\*) will be executed on the NPU side.
:::

#### Model Configuration Example

```json
"preprocessings": [               # Set pre-processings for Inference in order.
  {
      "convertColor": {
          "form": "BGR2RGB"     # Color Converter Format
      }
  },
  {
      "resize": {               # Resize Size
          "mode": "default",  # can be omitted (default)
          "width": 380,
          "height": 380        # this resize makes image shape into (380, 380, 3)
      }
  },
  {
      "centercrop": {         # Center crop the image
        "width": 320,
        "height": 320        # this centercrop makes image shape into (320, 320, 3)
        }
  },
  {
      "div": {                  # Division parameter
          "x": 255
      }
  },
  {
      "normalize": {            # mean, std for Normalization.
          "mean": [             # Dimension: 3D or single Value
              0.486,            # 3D: [0.486, 0.456, 0.406]
              0.456,            # single Value: [0.456] or 0.456
              0.406
          ],
          "std": [
              0.229,
              0.224,
              0.225
          ]
      }
  },
  {
      "transpose": {            # Transpose(permute) Axis Parameter
          "axis": [             # ex) HWC -> CHW : [2,0,1]
              2,
              0,
              1
          ]
      }
  },
  {
      "expandDim": {            # Expand Dimension
          "axis": 0
      }
  }
]
```

#### Enhanced Accuracy Scheme Configuration

To further improve model accuracy, you can enable the Enhanced Scheme options named **DXQ-P0 \~ DXQ-P5**.

:::tip

- Each scheme is independent, so you can enable multiple schemes at the same time.
- These schemes **do not always improve accuracy**; evaluate the results based on your use case.
- Enabling these schemes in a **CPU-only environment can significantly increase compilation time**.
  :::

| Scheme ID  | Name                   | Parameter Description                                                                                                                          |
| ---------- | ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| **DXQ-P0** | Fusing                 | `alpha`: fusing ratio, range `0 < alpha < 1.0`, **recommended: 0.5**                                                                           |
| **DXQ-P1** | Search Best Parameters | `true/false`; enabling it significantly increases CPU compilation time                                                                         |
| **DXQ-P2** | Relax Range Search     | `alpha`: min ratio of calibration range, `0 < alpha < beta`, recommended: **0.1**; `beta`: max ratio, `alpha < beta < ∞`, recommended: **1.0** |
| **DXQ-P3** | Fine-tuning (Method 1) | `num_samples`: number of samples for calibration, `0 < num_samples < ∞`, **recommended: 1024**                                                 |
| **DXQ-P4** | Fine-tuning (Method 2) | Same as DXQ-P3                                                                                                                                 |
| **DXQ-P5** | Fine-tuning (Method 3) | Same as DXQ-P3                                                                                                                                 |

:::tip
Although DXQ-P3, DXQ-P4, and DXQ-P5 share the same parameters, they use **different fine-tuning methods**.
:::

**Enhanced scheme configuration example**

```json
  '''
  "enhanced_scheme": {
    "DXQ-P0": {
        "alpha": 0.5
    },
    "DXQ-P1": true,
    "DXQ-P2": {
        "alpha": 0.1,
        "beta": 1,
        "cosim_num": 2
    },
    "DXQ-P3": {
        "num_samples": 1024
    },
    "DXQ-P4": {
        "num_samples": 1024
    },
    "DXQ-P5": {
        "num_samples": 1024
    }
  },
}
```

**Enhanced scheme enable/disable example**

```json
  '''
  "enhanced_scheme": {
    "DXQ-P0": false,      # this line can be remove for not using 'DXQ-P0' scheme
    "DXQ-P1": false,
    "DXQ-P2": false,
    "DXQ-P3": true,        # only 'DXQ-P3' scheme works
    "DXQ-P4": false,
    "DXQ-P5": false
  },
 '''
```

| Name   | Compile Speed | Accuracy Improvement Tendency |
| ------ | ------------- | ----------------------------- |
| DXQ-P0 | Very fast     | Low                           |
| DXQ-P1 | Fast          | Low-Medium                    |
| DXQ-P2 | Slow          | Medium-High                   |
| DXQ-P3 | Very slow     | High                          |
| DXQ-P4 | Very slow     | High                          |
| DXQ-P5 | Very slow     | High                          |

### PPU Post-processing Acceleration

PPU (Post-Processing Unit) provides hardware-accelerated post-processing for object detection models. If your target model uses a YOLO-family architecture, you can add PPU configuration parameters in the model compilation config file.

#### Supported PPU Types

There are two supported object detection model architectures for PPU:

- **Type 0 (Anchor-Based YOLO)**

  Designed for anchor-based models, such as YOLOv3, YOLOv4, YOLOv5, and YOLOv7.

- **Type 1 (Anchor-Free YOLO)**

  Designed for anchor-free models, such as YOLOX.

#### Identify ONNX Nodes That Can Use PPU

<Tabs queryString="backend">

    <TabItem value="Type 0">


    Trace backward from the model outputs to find detection heads whose `Conv` output shape is `[1, num_anchors*(5+num_classes), H, W]`. These conv outputs are typically followed by `reshape`, `permute`, and other post-processing operations.

    Using [yolo5s.onnx](https://github.com/ultralytics/yolov5/releases/download/v6.0/yolov5s.onnx) as an example: YOLOv5s has `num_anchors=3` and `num_classes=80`, so the `Conv` nodes to look for have output shape `[1, 255, H, W]`.
    By tracing backward from the model outputs, you can identify three `Conv` nodes: `Conv_196`, `Conv_308`, and `Conv_420`. Configure these node names in the PPU section of the compilation config file.

    <div style={{textAlign: 'center'}}>
       <img src="/en/img/aicore-dx-m1/ppu-type0.webp"/>
       Yolov5s PPU Conv node
    </div>

    ```json
    '''
      "ppu": {
        "type":0,
        "conf_thres":0.25,
        "activation": "Sigmoid",
        "num_classes": 80,
        "layer": {
          "Conv_196": {
            "num_anchors": 3
          },
          "Conv_308": {
            "num_anchors": 3
          },
          "Conv_420": {
            "num_anchors": 3
          }
        }
      },
    '''
    ```

    </TabItem>

    <TabItem value="Type 1">

    Trace backward from the model outputs. For each detection scale, identify three types of `Conv` nodes: `bbox`, `obj_conf`, and `cls_conf`.

    - `bbox`: conv layer that outputs bounding box regression values `[1, 4, H, W]`

    - `obj_conf`: conv layer that outputs object confidence scores `[1, 1, H, W]`

    - `cls_conf`: conv layer that outputs class prediction scores (e.g. `[1, 80, H, W]`)

    Using [YOLOXS-1.onnx](https://sdk.deepx.ai/modelzoo/onnx/YOLOXS-1.onnx) as an example: YOLOXS has three scales. You need to identify nine `Conv` nodes in total (`bbox`, `obj_conf`, `cls_conf` for each scale).
    By tracing backward from the model outputs, you can identify these 9 `Conv` nodes and then configure their names in the PPU section of the compilation config file.

    <div style={{textAlign: 'center'}}>
       <img src="/en/img/aicore-dx-m1/ppu-type1.webp"/>
       Yolov5s PPU Conv node
    </div>

    ```json
    '''
      "ppu": {
        "type":1,
        "conf_thres":0.25,
        "num_classes": 80,
        "layer": [
        {
        "bbox": "Conv_261",
        "obj_conf": "Conv_262",
        "cls_conf": "Conv_254"
        },
        {
        "bbox": "Conv_282",
        "obj_conf": "Conv_283",
        "cls_conf": "Conv_275"
        },
        {
        "bbox": "Conv_303",
        "obj_conf": "Conv_304",
        "cls_conf": "Conv_296"
        }
        ]
      },
    '''
    ```

    </TabItem>

</Tabs>

#### Parameter Description

| Parameter        | Type   | Description                                                                                                          |
| ---------------- | ------ | -------------------------------------------------------------------------------------------------------------------- |
| `type`           | int    | Model type identifier. Setting `type=1` indicates an **Anchor-Free YOLO model**.                                     |
| `conf_thres`     | float  | Confidence threshold for filtering detections.<br/>**Note: fixed at compile time and cannot be changed at runtime.** |
| `num_classes`    | int    | Number of classes supported by the model.                                                                            |
| `layer`          | list   | Detection head configuration list. Each element corresponds to one head and contains the following fields:           |
| `layer.bbox`     | string | Layer name that outputs **Bounding Box** coordinates.                                                                |
| `layer.obj_conf` | string | Layer name that outputs **Object Confidence**.                                                                       |
| `layer.cls_conf` | string | Layer name that outputs **Class Confidence**.                                                                        |

### Run Model Compilation

After finishing the model configuration file, compile the model using the following command.

<NewCodeBlock tip="X86 PC" type="PC">

```bash
dx_com  -m <MODEL_PATH> -c <CONFIG_PATH> -o <OUTPUT_DIR>
        -m or --model_path <MODEL_PATH>: Path to Onnx Model[*.onnx]
        -c or --config_path <CONFIG_PATH>: Path to Model Config[*.json]
        -o or –output_dir <OUTPUT_PATH>: Path to Output Data Save Directory
        (optional) --shrink : only including compiled model to run NPU
```

</NewCodeBlock>

#### Compilation Examples

:::tip
The `sample` directory under dx-com contains multiple example compilation config files.
:::

<NewCodeBlock tip="X86 PC" type="PC">

```bash
$./dx_com/dx_com    \
    -m sample/MobilenetV1.onnx \
    -c sample/MobilenetV1.json \
    -o output/mobilenetv1

# shrink option
$./dx_com/dx_com    \
    -m sample/MobilenetV1.onnx \
    -c sample/MobilenetV1.json \
    -o output/mobilenetv1 \
    --shrink
```

</NewCodeBlock>

:::tip
**DX-COM** only supports models with batch size 1. If the model input shape is (**batchsize**, C, H, W) or (**batchsize**, H, W, C), make sure `batchsize` is set to 1.
:::

After successful compilation, the DXNN model will be saved under the `output/mobilenetv1` directory.

## Build DX-COM Documentation

:::tip
For more details on how to use DX-COM, please build the full documentation and refer to it.
:::

### Clone the DX-ALL-SUITE Repository

:::tip
Clone the specified DX-ALL-SUITE version following [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite).
:::

### Install MkDocs

<NewCodeBlock tip="Host" type="device">

```bash
pip install mkdocs mkdocs-material mkdocs-video pymdown-extensions mkdocs-with-pdf markdown-grid-tables
```

</NewCodeBlock>

### Build Documentation

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-compiler
mkdocs build
```

</NewCodeBlock>

After the build completes, `DEEPX_DX-COM_UM_v2.1.0_Nov_2025.pdf` will be generated in the current directory.

### Start the Documentation Server

You can access the documentation in a web browser.

<NewCodeBlock tip="Host" type="device">

```bash
mkdocs serve
```

</NewCodeBlock>
