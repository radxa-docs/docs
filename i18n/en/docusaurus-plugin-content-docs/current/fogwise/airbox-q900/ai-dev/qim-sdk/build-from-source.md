---
sidebar_position: 16
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-24
---

# Build from Source

All QIM SDK GStreamer plugins and sample applications are already available as pre-built packages via [apt installation](./README.md#installation). In most cases, source compilation is unnecessary.

You can also compile from source directly on the device, which is useful for:

- Modifying plugin source code to customize post-processing logic or add custom model support
- Debugging plugin internals
- Using build options that differ from the pre-built packages

The build produces 34 GStreamer plugin shared libraries (`.so`), covering AI inference engines (`mltflite`, `mlqnn`, `mlsnpe`), preprocessing (`mlvconverter`), post-processing (`mlpostprocess` and others), and video processing (`vcomposer` and others). See the steps below.

## Prerequisites

- Completed [QIM SDK Installation](./README.md#installation)

## Install Build Dependencies

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt-add-repository -s ppa:ubuntu-qcom-iot/qcom-ppa
sudo apt update
sudo apt install -y \
    qcom-adreno-dev \
    libgstreamer1.0-qcom-sample-apps-utils-dev
```

</NewCodeBlock>

## Build QIM Plugins from Source

### Step 1: Download QIM Source

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~
apt source gst-plugins-qti-oss
cd gst-plugins-qti-oss-*
```

</NewCodeBlock>

### Step 2: CMake Build

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

### Step 3: Install

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo make install
```

</NewCodeBlock>

### Step 4: Verify

```bash
ls /usr/lib/aarch64-linux-gnu/gstreamer-1.0/libgstqti*.so | wc -l
```

Approximately 34 plugin shared libraries are installed, such as `libgstqtimltflite.so`, `libgstqtimlvclassification.so`, etc.

## Troubleshooting

### CMake cannot find GStreamer

Verify GStreamer development packages are installed:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
pkg-config --modversion gstreamer-1.0
```

</NewCodeBlock>

If not found, install:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install libgstreamer1.0-dev
```

</NewCodeBlock>

## Reference

- [Python GStreamer Apps](./python-apps.md) — Python development approach
