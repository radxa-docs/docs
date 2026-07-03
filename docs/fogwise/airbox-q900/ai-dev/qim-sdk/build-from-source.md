---
sidebar_position: 18
doc_kind: page
locale: zh
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-30
---

# 源码编译

前面的 [Demo](./README.md#可用示例应用)（`gst-ai-*`）和 [Python 应用](./python-apps.md) 使用的是 apt 预编译的 GStreamer 插件。如果你需要**修改插件源码**（如定制后处理逻辑、添加自定义模型支持）或**写自己的 C/C++ 推理程序**，可以在设备上直接编译。

## Hello-QIM：最小 C/C++ 示例

Hello-QIM 是一个最小可运行的 GStreamer 应用，展示如何用 C++ 创建 pipeline 并获取摄像头帧。适合作为自定义应用的起点。

### 下载源码

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/quic/sample-apps-for-qualcomm-linux
cd sample-apps-for-qualcomm-linux/Hello-QIM
```

</NewCodeBlock>

### 准备源文件

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cp main.cc gst-appsink.cc
```

</NewCodeBlock>

### 创建 Makefile

```makefile
CC = g++
CFLAGS = -Wall -g $(shell pkg-config --cflags gstreamer-1.0)
LDFLAGS = $(shell pkg-config --libs gstreamer-1.0)

all: gst-appsink

gst-appsink: gst-appsink.o
	$(CC) -o $@ $^ $(LDFLAGS)

gst-appsink.o: gst-appsink.cc
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f gst-appsink gst-appsink.o
```

### 编译并运行

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
make
./gst-appsink -w 1280 -h 720
```

</NewCodeBlock>

预期输出：

```text
Hello-QIM: Success creating pipeline and received camera frame.
```

> 如果设备没有连接摄像头，pipeline 创建仍然会成功，只是收不到帧。

## 编译 QIM 插件（进阶）

如果需要修改 GStreamer 插件本身（而不仅仅是调用插件），可以从源码编译全部插件。

### 安装编译依赖

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y \
    qcom-adreno-dev \
    libgstreamer1.0-qcom-sample-apps-utils-dev
```

</NewCodeBlock>

### 下载并编译

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cd ~
apt source gst-plugins-qti-oss
cd gst-plugins-qti-oss-*
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
sudo make install
```

</NewCodeBlock>

编译安装约 34 个插件动态库（`libgstqtimltflite.so`、`libgstqtimlvclassification.so` 等）。

## 排障

### CMake 找不到 GStreamer

确认 GStreamer 开发包已安装：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
pkg-config --modversion gstreamer-1.0
```

</NewCodeBlock>

如果提示找不到：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install libgstreamer1.0-dev
```

</NewCodeBlock>
