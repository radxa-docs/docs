---
sidebar_position: 7
---

# DX Model Zoo

**DX Model Zoo** includes a series of pre-compiled DXNN models for image classification, object detection, image segmentation, face recognition, image denoising, and more.
Each model provides the original model source, the ONNX model, the compiled DXNN model, the compilation config file download, and benchmark/accuracy data.

## DX Model Link

Link: [**DX Model Zoo**](https://developer.deepx.ai/wp-content/modelzoo/modelzoo_v2.0.0.html)

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-model-zoo.webp"/>
  DX Model Zoo
</div>

## Installation

:::info
DX-Model-Zoo is only supported on x86 Ubuntu 20.04 LTS or 22.04 LTS.
:::

### Clone the DX-ALL-SUITE Repository

:::tip
Clone the specified DX-ALL-SUITE version following [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite).
:::

### Install DXMZ (Deepx Model Zoo)

#### Manual Installation

Enter the `dx-all-suite/dx-modelzoo` directory.

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
cd dx-all-suite/dx-modelzoo
./install.sh
```

</NewCodeBlock>

After installation, a virtual environment will be created at `./venv-dx-modelzoo-local`.

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
source ./venv-dx-modelzoo-local/bin/activate
```

</NewCodeBlock>

## CLI Usage

### List Models

Command:

```bash
dxmz models
```

Description: list all models available in Deepx Model Zoo.

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
dxmz models
```

</NewCodeBlock>

### Evaluate Model Accuracy

Command:

```bash
dxmz eval <model_name> [--onnx <path> | --dxnn <path>] --data_dir <dataset_path>
```

Description: measure the accuracy of a specified model.

```bash
# To use onnx runtime:
dxmz eval <Model Name> --onnx <onnx file path> --data_dir <dataset root dir path>
# Example:
dxmz eval ResNet18 --onnx ./ResNet18.onnx --data_dir ./datasets/ILSVRC2012/val


# To use DX-Runtime:
dxmz eval <Model Name> --dxnn <dxnn file path> --data_dir <dataset root dir path>
# Example:
dxmz eval ResNet18 --dxnn ./ResNet18.dxnn --data_dir ./datasets/ILSVRC2012/val
```

## Build DX-Model-Zoo Documentation

:::tip
For more details on how to use DX-Model-Zoo, please build the full documentation and refer to it.
:::

### Install MkDocs

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
pip install mkdocs mkdocs-material mkdocs-video pymdown-extensions mkdocs-with-pdf markdown-grid-tables
```

</NewCodeBlock>

### Build Documentation

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
cd docs
mkdocs build
```

</NewCodeBlock>

After the build completes, `dx-modelzoo_v0.1.0.pdf` will be generated under `output_web`.

### Start the Documentation Server

You can access the documentation in a web browser.

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
mkdocs serve
```

</NewCodeBlock>
