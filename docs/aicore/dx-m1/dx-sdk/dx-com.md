---
sidebar_position: 2
---

# DX-COM 模型编译器

## 介绍

**DX-COM (模型编译器)** 可根据提供的 ONNX 模型和配置文件生成 NPU 指令集，将 ONNX 模型编译成在 NPU 上可执行的 DXNN 模型文件格式，DXNN 文件包含生成的指令集和权重信息。

## 安装方法

### 安装所需的库

- libgl1-mesa-glx
- libglib2.0-0

使用以下命令安装所需的库。

<NewCodeBlock tip="X86 PC" type="PC">

```bash
sudo apt-get install -y --no-install-recommends libgl1-mesa-glx libglib2.0-0 make
```

</NewCodeBlock>

### 下载 DX-COM 安装包

请在 DX-M1 SDK [资源下载](../download.md)页面下载 DX-COM 安装包并解压

<NewCodeBlock tip="X86 PC" type="PC">

```bash
tar -xvf dx_com_M1A_v1.38.1.tar.gz
```

</NewCodeBlock>

```bash
# Output Structure
dx_com
├── calibration_dataset
├── dx_com
│   ├── cv2/
│   ├── numpy/
│   ├── ...
│   └── dx_com
├── sample
│   ├── MobilenetV1.json
│   └── MobilenetV1.onnx
└── Makefile
```

## 使用方法

### 模型配置

编译模型使用的参数需要在 json 文件中进行配置。

#### 模型输入配置

设置 ONNX 模型输入层的名字和模型输入形状。

```vim
inputs : ONNX input name shape info
```

**示例：**

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

#### 模型校准配置

设置校准方法的参数。

**calibration_num**：用于校准的图像数量

如果希望尽量减少模型精度的下降，建议尝试不同的 `calibration_num` 值。你可以使用不同的设置（如 `calibration_num=1`、`5`、`10`、`100` 或 `1000`）来编译模型，测量每种设置下的精度，并选择精度最高的值。

**calibration_method**：校准方法

可选项：`["ema", "minmax"]`

:::tip
在大多数情况下，`"ema"` 能提供更好的精度，但某些情况使用 `"minmax"` 效果更佳。
:::

**示例：**

```json
...
"calibration_num": 100,
"calibration_method": "ema",
...
```

#### 数据加载配置

设置校准数据集的参数。建议选择用于训练或推理的同一批数据进行校准。

- dataset_path：校准数据集的根目录路径（会递归搜索文件）。

- file_extensions：目标图像的文件扩展名。

- preprocessings：图像预处理方法。

**示例：**

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

输入图像预处理配置

图像输入到 ONNX 模型之前所需的预处理流程。这些配置用于模型编译期间对校准数据集进行预处理。
其中带 (\*) 的项将在 NPU 侧执行，从而减轻 CPU 的处理负担。因此，这些迁移到 NPU 的预处理操作，在运行时软件中应被省略。如果不需要预处理，则本节可以跳过。

| 预处理项        | 参数/子选项                                   | 说明                                                                                                                                                                                                                    | 示例                          |
| --------------- | --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------- |
| `convertColor`  | `RGB2BGR`, `BGR2RGB`, `BGR2GRAY`, `BGR2YCrCb` | 转换颜色通道顺序                                                                                                                                                                                                        | `"RGB2BGR"`                   |
| `resize`        | `mode`                                        | `default` (opencv) 或 `torchvision`                                                                                                                                                                                     | `"default"` / `"torchvision"` |
|                 | `width`, `height`                             | 目标图像尺寸（仅 `default` 模式）                                                                                                                                                                                       | `width: 224`, `height: 224`   |
|                 | `size`                                        | 目标短边尺寸 （仅 `torchvision` 模式）                                                                                                                                                                                  | `size: 256`                   |
|                 | `interpolation`                               | 插值方式（可选）<br />**`default`** 模式可选: "NEAREST", "LINEAR"(default), "AREA", "CUBIC", "LANCZOS4" <br /> **`torchviion`** 模式可选: <br /> "NEAREST", "LANCZOS", "BILINEAR"(default), "BICUBIC", "BOX", "HAMMING" | `LINEAR`, `BILINEAR`          |
| `centercrop`    | `width`, `height`                             | 从图像中心裁剪指定尺寸                                                                                                                                                                                                  | `width: 224`, `height: 224`   |
| `transpose`     | `axis`                                        | 维度变换顺序                                                                                                                                                                                                            | `[2, 0, 1]`                   |
| `normalize (*)` | `mean`, `std`                                 | 归一化处理，支持单值或数组                                                                                                                                                                                              | `[0.5,0.5,0.5]`               |
| `mul (*)`       | `x`                                           | 所有像素乘以某个值                                                                                                                                                                                                      | `x: 255`                      |
| `add (*)`       | `x`                                           | 所有像素加上某个值                                                                                                                                                                                                      | `x: 0.1`                      |
| `subtract (*)`  | `x`                                           | 所有像素减去某个值                                                                                                                                                                                                      | `x: 0.1`                      |
| `div (*)`       | `x`                                           | 所有像素除以某个值                                                                                                                                                                                                      | `x: 255.0`                    |
| `expandDim`     | `axis`                                        | 在指定位置扩展一个维度                                                                                                                                                                                                  | `axis: 0`                     |

:::info
其中带 (\*) 的项将在 NPU 侧执行
:::

#### 模型配置示例

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

#### 精度增强方案配置

为了进一步提升模型精度，可选择使用增强精度方案（Enhanced Scheme），方案名称为 **DXQ-P0 \~ DXQ-P5**。

:::tip

- 各增强方案彼此独立，即可以同时启用多个方案。
- 使用这些方案**不一定总能带来精度提升**，建议根据实际情况评估效果；
- 在 **CPU-only 环境下启用这些方案会显著增加编译时间**。
  :::

| 方案编号   | 名称                     | 参数说明                                                                                                                          |
| ---------- | ------------------------ | --------------------------------------------------------------------------------------------------------------------------------- |
| **DXQ-P0** | 融合操作（Fusing）       | `alpha`：融合比率，取值范围 `0 < alpha < 1.0`，**推荐值：0.5**                                                                    |
| **DXQ-P1** | 寻找最优参数             | `true/false`，启用将显著增加 CPU 编译时间                                                                                         |
| **DXQ-P2** | 放宽校准范围寻找最优参数 | `alpha`：校准范围最小值比例，`0 < alpha < beta`，推荐值：**0.1**, `beta`：校准范围最大值比例，`alpha < beta < ∞`，推荐值：**1.0** |
| **DXQ-P3** | 参数微调（方法一）       | `num_samples`：用于校准的数据样本数量，`0 < num_samples < ∞`，**推荐值：1024**                                                    |
| **DXQ-P4** | 参数微调（方法二）       | 同 DXQ-P3                                                                                                                         |
| **DXQ-P5** | 参数微调（方法三）       | 同 DXQ-P3                                                                                                                         |

:::tip
DXQ-P3、DXQ-P4、DXQ-P5 虽然参数相同，但使用的是**不同的微调方法**。
:::

**精度增强配置例子**

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

**精度增强单度控制配置例子**

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

| 名称   | 编译速度 | 精度提升倾向 |
| ------ | -------- | ------------ |
| DXQ-P0 | 非常快   | 低           |
| DXQ-P1 | 快       | 低-中        |
| DXQ-P2 | 较慢     | 中-高        |
| DXQ-P3 | 非常慢   | 高           |
| DXQ-P4 | 非常慢   | 高           |
| DXQ-P5 | 非常慢   | 高           |

### 执行模型编译

当完成模型配置文件后使用以下命令进行模型编译

<NewCodeBlock tip="X86 PC" type="PC">

```bash
dx_com  -m <MODEL_PATH> -c <CONFIG_PATH> -o <OUTPUT_DIR>
        -m or --model_path <MODEL_PATH>: Path to Onnx Model[*.onnx]
        -c or --config_path <CONFIG_PATH>: Path to Model Config[*.json]
        -o or –output_dir <OUTPUT_PATH>: Path to Output Data Save Directory
        (optional) --shrink : only including compiled model to run NPU
```

</NewCodeBlock>

#### 编译例子

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
**DX-COM** 只支持 1 batchsize 的模型输入，如果模型输入是 (**batchsize**,C,H,W) 或 (**batchsize**,H,W,C) 请确保 batchsize 为 1
:::

编译成功后 dxnn 格式模型保存在 output/mobilenetv1 文件夹中。
