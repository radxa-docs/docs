---
sidebar_position: 18
doc_kind: page
locale: en
board: airbox-q900
task_type: ai-dev
last_verified: 2026-06-30
---

# Build from Source

The [Demos](./README.md#available-sample-applications) (`gst-ai-*`) and [Python Apps](./python-apps.md) use precompiled GStreamer plugins from apt. If you need to **modify plugin source code** (e.g., customize postprocessing logic, add custom model support) or **write your own C/C++ inference programs**, you can compile directly on the device.

## Hello-QIM: Minimal C/C++ Example

Hello-QIM is a minimal runnable GStreamer application showing how to create a pipeline and capture camera frames in C++. Use it as a starting point for custom applications.

### Download Source

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
git clone https://github.com/quic/sample-apps-for-qualcomm-linux
cd sample-apps-for-qualcomm-linux/Hello-QIM
```

</NewCodeBlock>

### Prepare Source File

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
cp main.cc gst-appsink.cc
```

</NewCodeBlock>

### Create Makefile

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

### Compile and Run

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
make
./gst-appsink -w 1280 -h 720
```

</NewCodeBlock>

Expected output:

```text
Hello-QIM: Success creating pipeline and received camera frame.
```

> If the device has no camera connected, pipeline creation still succeeds — it just won't receive frames.

## Compiling QIM Plugins (Advanced)

If you need to modify the GStreamer plugins themselves (not just call them), compile all plugins from source.

### Install Build Dependencies

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install -y \
    qcom-adreno-dev \
    libgstreamer1.0-qcom-sample-apps-utils-dev
```

</NewCodeBlock>

### Download and Compile

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

This produces approximately 34 plugin shared libraries (`libgstqtimltflite.so`, `libgstqtimlvclassification.so`, etc.).

## Troubleshooting

### CMake cannot find GStreamer

Check that GStreamer development packages are installed:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
pkg-config --modversion gstreamer-1.0
```

</NewCodeBlock>

If not found:

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt install libgstreamer1.0-dev
```

</NewCodeBlock>
