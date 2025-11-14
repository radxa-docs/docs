---
sidebar_position: 2
---

# DX-COM Model Compiler

## Introduction

**DX-COM (Model Compiler)** can generate NPU instruction sets based on the provided ONNX model and configuration file, compiling ONNX models into DXNN model file format that can be executed on NPU. DXNN files contain the generated instruction sets and weight information.

## System Requirements

| CPU              | x86 (x64)                        |
| ---------------- | -------------------------------- |
| Memory (RAM)     | ≥ 16GB                           |
| Storage Space    | ≥ 8GB                            |
| Operating System | Ubuntu 18.04, 20.04, 22.04 (x64) |
| LDD Version      | ≥ 2.28                           |

## Installation

### Install Required Libraries

- libgl1-mesa-glx
- libglib2.0-0

Use the following command to install the required libraries.

<NewCodeBlock tip="X86 PC" type="PC">

```bash
sudo apt-get install -y --no-install-recommends libgl1-mesa-glx libglib2.0-0 make
```

</NewCodeBlock>

### Download DX-COM Installation Package

Please download the DX-COM installation package from the DX-M1 SDK [Resources Download](../download.md) page and extract it

<NewCodeBlock tip="X86 PC" type="PC">

```bash
tar -xvf dx_com_M1_v1.60.1.tar.gz
```

</NewCodeBlock>

## Usage

### Model Configuration

Parameters used for model compilation need to be configured in a JSON file.

#### Model Input Configuration

Set the ONNX model input layer name and model input shape.

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

#### Model Calibration Configuration

Set parameters for the calibration method.

**calibration_num**: Number of images used for calibration

If you want to minimize model accuracy degradation, it is recommended to try different `calibration_num` values. You can compile the model with different settings (such as `calibration_num=1`, `5`, `10`, `100` or `1000`), measure the accuracy under each setting, and choose the value with the highest accuracy.

**calibration_method**: Calibration method

Available options: `["ema", "minmax"]`

:::tip
In most cases, `"ema"` provides better accuracy, but in some cases `"minmax"` works better.
:::

**Example:**

```json
...
"calibration_num": 100,
"calibration_method": "ema",
...
```

#### Data Loading Configuration

Set parameters for the calibration dataset. It is recommended to select the same batch of data used for training or inference for calibration.

- dataset_path: Root directory path of the calibration dataset (files will be searched recursively).

- file_extensions: File extensions of target images.

- preprocessings: Image preprocessing methods.

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

Input image preprocessing configuration

The preprocessing pipeline required before images are input to the ONNX model. These configurations are used to preprocess the calibration dataset during model compilation.
Items marked with (\*) will be executed on the NPU side, thereby reducing CPU processing burden. Therefore, these preprocessing operations migrated to NPU should be omitted in the runtime software. If no preprocessing is needed, this section can be skipped.

| Preprocessing Item | Parameters/Sub-options                        | Description                                                                                                                                                                                                                                     | Example                       |
| ------------------ | --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------- |
| `convertColor`     | `RGB2BGR`, `BGR2RGB`, `BGR2GRAY`, `BGR2YCrCb` | Convert color channel order                                                                                                                                                                                                                     | `"RGB2BGR"`                   |
| `resize`           | `mode`                                        | `default` (opencv) or `torchvision`                                                                                                                                                                                                             | `"default"` / `"torchvision"` |
|                    | `width`, `height`                             | Target image size (only `default` mode)                                                                                                                                                                                                         | `width: 224`, `height: 224`   |
|                    | `size`                                        | Target short side size (only `torchvision` mode)                                                                                                                                                                                                | `size: 256`                   |
|                    | `interpolation`                               | Interpolation method (optional)<br />**`default`** mode options: "NEAREST", "LINEAR"(default), "AREA", "CUBIC", "LANCZOS4" <br /> **`torchvision`** mode options: <br /> "NEAREST", "LANCZOS", "BILINEAR"(default), "BICUBIC", "BOX", "HAMMING" | `LINEAR`, `BILINEAR`          |
| `centercrop`       | `width`, `height`                             | Crop specified size from image center                                                                                                                                                                                                           | `width: 224`, `height: 224`   |
| `transpose`        | `axis`                                        | Dimension transformation order                                                                                                                                                                                                                  | `[2, 0, 1]`                   |
| `normalize (*)`    | `mean`, `std`                                 | Normalization processing, supports single value or array                                                                                                                                                                                        | `[0.5,0.5,0.5]`               |
| `mul (*)`          | `x`                                           | Multiply all pixels by a value                                                                                                                                                                                                                  | `x: 255`                      |
| `add (*)`          | `x`                                           | Add a value to all pixels                                                                                                                                                                                                                       | `x: 0.1`                      |
| `subtract (*)`     | `x`                                           | Subtract a value from all pixels                                                                                                                                                                                                                | `x: 0.1`                      |
| `div (*)`          | `x`                                           | Divide all pixels by a value                                                                                                                                                                                                                    | `x: 255.0`                    |
| `expandDim`        | `axis`                                        | Expand a dimension at specified position                                                                                                                                                                                                        | `axis: 0`                     |

:::info
Items marked with (\*) will be executed on the NPU side
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

#### Accuracy Enhancement Scheme Configuration

To further improve model accuracy, you can choose to use the accuracy enhancement scheme (Enhanced Scheme), with scheme names **DXQ-P0 ~ DXQ-P5**.

:::tip

- Each enhancement scheme is independent, meaning multiple schemes can be enabled simultaneously.
- Using these schemes **does not always bring accuracy improvement**, it is recommended to evaluate the effect based on actual situations;
- Enabling these schemes in **CPU-only environments will significantly increase compilation time**.
  :::

| Scheme ID  | Name                                               | Parameter Description                                                                                                                                                                               |
| ---------- | -------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **DXQ-P0** | Operation Fusion (Fusing)                          | `alpha`: Fusion ratio, value range `0 < alpha < 1.0`, **recommended value: 0.5**                                                                                                                    |
| **DXQ-P1** | Find Optimal Parameters                            | `true/false`, enabling will significantly increase CPU compilation time                                                                                                                             |
| **DXQ-P2** | Relax Calibration Range to Find Optimal Parameters | `alpha`: Minimum value ratio of calibration range, `0 < alpha < beta`, recommended value: **0.1**, `beta`: Maximum value ratio of calibration range, `alpha < beta < ∞`, recommended value: **1.0** |
| **DXQ-P3** | Parameter Fine-tuning (Method 1)                   | `num_samples`: Number of data samples used for calibration, `0 < num_samples < ∞`, **recommended value: 1024**                                                                                      |
| **DXQ-P4** | Parameter Fine-tuning (Method 2)                   | Same as DXQ-P3                                                                                                                                                                                      |
| **DXQ-P5** | Parameter Fine-tuning (Method 3)                   | Same as DXQ-P3                                                                                                                                                                                      |

:::tip
Although DXQ-P3, DXQ-P4, DXQ-P5 have the same parameters, they use **different fine-tuning methods**.
:::

**Accuracy Enhancement Configuration Example**

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

**Accuracy Enhancement Single Scheme Control Configuration Example**

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

| Name   | Compilation Speed | Accuracy Improvement Tendency |
| ------ | ----------------- | ----------------------------- |
| DXQ-P0 | Very Fast         | Low                           |
| DXQ-P1 | Fast              | Low-Medium                    |
| DXQ-P2 | Slower            | Medium-High                   |
| DXQ-P3 | Very Slow         | High                          |
| DXQ-P4 | Very Slow         | High                          |
| DXQ-P5 | Very Slow         | High                          |

### Execute Model Compilation

When the model configuration file is completed, use the following command to compile the model

<NewCodeBlock tip="X86 PC" type="PC">

```bash
dx_com  -m <MODEL_PATH> -c <CONFIG_PATH> -o <OUTPUT_DIR>
        -m or --model_path <MODEL_PATH>: Path to Onnx Model[*.onnx]
        -c or --config_path <CONFIG_PATH>: Path to Model Config[*.json]
        -o or –output_dir <OUTPUT_PATH>: Path to Output Data Save Directory
        (optional) --shrink : only including compiled model to run NPU
```

</NewCodeBlock>

#### Compilation Example

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
**DX-COM** only supports model input with 1 batchsize. If model input is (**batchsize**,C,H,W) or (**batchsize**,H,W,C), please ensure batchsize is 1
:::

After successful compilation, the dxnn format model is saved in the output/mobilenetv1 folder.
