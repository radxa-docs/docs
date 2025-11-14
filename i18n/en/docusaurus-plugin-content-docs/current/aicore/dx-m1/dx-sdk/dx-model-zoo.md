---
sidebar_position: 7
---

# DX Model Zoo

**DX Model Zoo** contains a series of pre-compiled dxnn models for object classification, object detection, image segmentation, face recognition, image denoising, and more.
Each model provides the original model source, ONNX model, compiled DXNN model, compilation configuration file downloads, along with benchmark, accuracy, and other data.

## DX Model Link

Link: [**DX Model Zoo**](https://developer.deepx.ai/wp-content/modelzoo/model_zoo_fin.html)

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx-model-zoo.webp"/>
  DX Model Zoo
</div>

## Installation

### Clone DX-ALL-SUITE Repository

:::tip
Please follow [DX-ALL-SUITE](./dx-sdk-introduction#dx-all-suite) to clone the specified version of the DX-ALL-SUITE repository
:::

### Install DXMZ (Deepx Model Zoo)

Navigate to the `dx-all-suite/dx-modelzoo` directory

<NewCodeBlock tip="Host" type="device">

```bash
cd dx-all-suite/dx-modelzoo
./setup.sh
```

</NewCodeBlock>

After installation, a `./venv-dx-modelzoo-local` virtual environment will be created in the current path,

<NewCodeBlock tip="Host" type="device">

```bash
source ./venv-dx-modelzoo-local/bin/activate
```

</NewCodeBlock>

## CLI Usage

### List Model List

Command:

```bash
dxmz models
```

Description: Used to list the model list on Deepx Model Zoo

<NewCodeBlock tip="Host" type="device">

```bash
dxmz models
```

</NewCodeBlock>

```bash
(venv-dx-modelzoo-local) rock@rock-5b-plus:~/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-modelzoo$ dxmz models
/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-modelzoo/venv-dx-modelzoo-local/lib/python3.11/site-packages/pydantic_settings/main.py:426: UserWarning: Config key `pyproject_toml_table_header` is set in model_config but will be ignored because no PyprojectTomlConfigSettingsSource source is configured. To use this config key, add a PyprojectTomlConfigSettingsSource source to the settings sources via the settings_customise_sources hook.
  self._settings_warn_unused_config_keys(sources, self.model_config)
/mnt/ssd/deepx/dx_rt_SDK_v2.9.5/dx-all-suite/dx-modelzoo/venv-dx-modelzoo-local/lib/python3.11/site-packages/pydantic_settings/main.py:426: UserWarning: Config key `toml_file` is set in model_config but will be ignored because no TomlConfigSettingsSource source is configured. To use this config key, add a TomlConfigSettingsSource source to the settings sources via the settings_customise_sources hook.
  self._settings_warn_unused_config_keys(sources, self.model_config)
Available Model List:
['AlexNet', 'BiSeNetV1', 'BiSeNetV2', 'DeepLabV3PlusDRN', 'DeepLabV3PlusMobileNetV2', 'DeepLabV3PlusMobilenet', 'DeepLabV3PlusResNet101', 'DeepLabV3PlusResNet50', 'DeepLabV3PlusResnet', 'DenseNet121', 'DenseNet161', 'DnCNN_15', 'DnCNN_25', 'DnCNN_50', 'EfficientNetB2', 'EfficientNetV2S', 'HarDNet39DS', 'MobileNetV1', 'MobileNetV2', 'MobileNetV3Large', 'MobileNetV3Small', 'OSNet0_25', 'OSNet0_5', 'RegNetX400MF', 'RegNetX800MF', 'RegNetY200MF', 'RegNetY400MF', 'RegNetY800MF', 'RepVGGA1', 'ResNeXt26_32x4d', 'ResNeXt50_32x4d', 'ResNet101', 'ResNet152', 'ResNet18', 'ResNet34', 'ResNet50', 'SSDMV1', 'SSDMV2Lite', 'SqueezeNet1_0', 'SqueezeNet1_1', 'VGG11', 'VGG11BN', 'VGG13', 'VGG13BN', 'VGG19BN', 'WideResNet101_2', 'WideResNet50_2', 'YOLOv5m_Face', 'YOLOv5s_Face', 'YOLOv7_Face', 'YOLOv7_TTA_Face', 'YOLOv7_W6_Face', 'YOLOv7_W6_TTA_Face', 'YOLOv7s_Face', 'YoloV3', 'YoloV5L', 'YoloV5M', 'YoloV5N', 'YoloV5S', 'YoloV7', 'YoloV7E6', 'YoloV7Tiny', 'YoloV8L', 'YoloV8M', 'YoloV8N', 'YoloV8S', 'YoloV8X', 'YoloV9C', 'YoloV9S', 'YoloV9T', 'YoloXS']
```

### Model Accuracy Evaluation

Command:

```bash
dxmz eval <model_name> [--onnx <path> | --dxnn <path>] --data_dir <dataset_path>
```

Description: Used to measure the accuracy of the specified model

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

## Dataset Downloads

- [**ImageNet**](http://www.image-net.org/challenges/LSVRC/2012/nnoupb/ILSVRC2012_img_val.tar)
- [**COCO2017**](http://images.cocodataset.org/zips/val2017.zip)
- [**PascalVOC - VOC2007**](http://host.robots.ox.ac.uk/pascal/VOC/voc2007/index.html)
- [**PascalVOC - VOC2012**](http://host.robots.ox.ac.uk/pascal/VOC/voc2012/#devkit)
- [**Cityscapes**](https://www.cityscapes-dataset.com/)
- [**WiderFace**](http://shuoyang1213.me/WIDERFACE/)
- [**BSD68**](https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/bsds/)
