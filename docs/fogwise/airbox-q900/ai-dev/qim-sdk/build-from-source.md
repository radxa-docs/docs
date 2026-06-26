---
sidebar_position: 16
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# 源码编译

QIM SDK 的所有 GStreamer 插件和示例应用已通过 [apt 安装](./README.md#安装) 提供预编译包，一般情况下无需自行编译。

你也可以在设备上直接编译源码，用于以下场景：

- 修改插件源码，定制后处理逻辑或添加自定义模型支持
- 调试插件内部行为
- 需要与预编译包不同的编译选项

编译产物包括 34 个 GStreamer 插件动态库（`.so`），覆盖 AI 推理引擎（`mltflite`、`mlqnn`、`mlsnpe`）、预处理（`mlvconverter`）、后处理（`mlpostprocess` 等）、视频处理（`vcomposer` 等）。详见下方步骤。

## 前提条件

- 已完成 [QIM SDK 安装](./README.md#安装)

## 安装编译依赖

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt-add-repository -s ppa:ubuntu-qcom-iot/qcom-ppa
sudo apt update
sudo apt install -y \
    qcom-adreno-dev \
    libgstreamer1.0-qcom-sample-apps-utils-dev
```

</NewCodeBlock>

## 编译 QIM 插件（从源码）

### 步骤 1：下载 QIM 源码

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~
apt source gst-plugins-qti-oss
cd gst-plugins-qti-oss-*
```

</NewCodeBlock>

### 步骤 2：CMake 编译

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
mkdir build && cd build

cmake \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DCMAKE_INSTALL_LIBDIR=lib/aarch64-linux-gnu \
   -DCMAKE_INSTALL_BINDIR=bin \
   -DCMAKE_INSTALL_SYSCONFDIR=/etc \
   -DGST_VERSION_REQUIRED=1.24.0 \
   -DENABLE_GST_PLUGIN_BASE=ON \
   -DENABLE_GST_ML_PLUGINS=ON \
   -DENABLE_GST_VIDEOPROC_PLUGINS=ON \
   -DENABLE_GST_SAMPLE_APPS=ON \
   ..

make -j$(nproc)
```

</NewCodeBlock>

### 步骤 3：安装

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo make install
```

</NewCodeBlock>

### 步骤 4：验证

```bash
ls /usr/lib/aarch64-linux-gnu/gstreamer-1.0/libgstqti*.so | wc -l
```

编译安装约 34 个插件动态库，输出如 `libgstqtimltflite.so`、`libgstqtimlvclassification.so` 等。

## 排障

### CMake 找不到 GStreamer

确认 GStreamer 开发包已安装：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
pkg-config --modversion gstreamer-1.0
```

</NewCodeBlock>

如果提示找不到，安装：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install libgstreamer1.0-dev
```

</NewCodeBlock>

## 参考

- [Python GStreamer 应用](./python-apps.md) — Python 开发方式
