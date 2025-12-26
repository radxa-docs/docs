---
sidebar_position: 7
---

# DX Model Zoo

**DX Model Zoo** 包含一些列已经编译过的目标分类，目标识别，图像分割，面部识别， 图片降噪等 dxnn 模型。
每个模型都提供原模型来源，onnx 模型，编译后的 dxnn 模型，编译配置文件下载，并附有的 benchmark， accuracy 等数据。

## DX Model Link

链接： [**DX Model Zoo**](https://developer.deepx.ai/wp-content/modelzoo/modelzoo_v2.0.0.html)

<div style={{textAlign: 'center'}}>
   <img src="/img/aicore-dx-m1/dx-model-zoo.webp"/>
  DX Model Zoo
</div>

## 安装方法

:::info
DX-Model-Zoo 仅支持在 X86 Ubuntu 20.04 LTS or 22.04 LTS 上使用
:::

### 克隆 DX-ALL-SUITE 仓库

:::tip
请按照 [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite) 克隆指定版本的 DX-ALL-SUITE 仓库
:::

### 安装 DXMZ (Deepx Model Zoo)

#### 手动安装

进入 `dx-all-suite/dx-modelzoo` 目录

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
cd dx-all-suite/dx-modelzoo
./install.sh
```

</NewCodeBlock>

安装完成后会在当前路径下生成 `./venv-dx-modelzoo-local` 虚拟环境，

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
source ./venv-dx-modelzoo-local/bin/activate
```

</NewCodeBlock>

## CLI 使用方法

### 列出模型列表

命令：

```bash
dxmz models
```

描述： 用于列出 Deepx Model Zoo 上的模型列表

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
dxmz models
```

</NewCodeBlock>

### 模型准确率评估

命令：

```bash
dxmz eval <model_name> [--onnx <path> | --dxnn <path>] --data_dir <dataset_path>
```

描述： 用于测量指定模型的准确率

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

## DX-Model-Zoo 文档构建

:::tip
更多关于 DX-Model-Zoo 的使用方法，请构建详细文档查阅
:::

### 安装 MkDocs

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
pip install mkdocs mkdocs-material mkdocs-video pymdown-extensions mkdocs-with-pdf markdown-grid-tables
```

</NewCodeBlock>

### 构建文档

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
cd docs
mkdocs build
```

</NewCodeBlock>

构建完成后会在 `output_web` 生成 `dx-modelzoo_v0.1.0.pdf`

### 启动文档服务

可以使用浏览器访问网页文档

<NewCodeBlock tip="X86 Ubuntu PC" type="PC">

```bash
mkdocs serve
```

</NewCodeBlock>
