---
sidebar_position: 4
---

# Lower level development

Mainly introduces uboot, kernel, aosp compilation and packaging etc.

## Environment configuration

### Install repo

```bash
wget 'https://storage.googleapis.com/git-repo-downloads/repo' -P /tmp/
sudo cp /tmp/repo /usr/local/bin/repo
sudo chmod +x /usr/local/bin/repo
```

Or use a mirrored source:

```bash
echo "export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo/'" >> ~/.bashrc
source ~/.bashrc
curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo -o /tmp/repo
sudo cp /tmp/repo /usr/local/bin/repo
sudo chmod +x /usr/local/bin/repo
```

### Installing compilation dependencies

```bash
apt-get update -y && apt-get install -y openjdk-8-jdk python python-pip git-core gnupg flex bison gperf build-essential \
          zip curl liblz4-tool zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
          lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
          libgl1-mesa-dev libxml2-utils xsltproc unzip mtools u-boot-tools \
          htop iotop sysstat iftop pigz bc device-tree-compiler lunzip \
          dosfstools vim-common parted udev lzop rsync openjdk-8-jdk
pip install pycrypto
```

Configuring java environment variables

```bash
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar
```

### Creating a `DockerFile` file

```text
FROM ubuntu:xenial
RUN apt-get update -y && apt-get install -y openjdk-8-jdk python python-pip git-core gnupg flex bison gperf build-essential \
    zip curl liblz4-tool zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
    libgl1-mesa-dev libxml2-utils xsltproc unzip mtools u-boot-tools \
    htop iotop sysstat iftop pigz bc device-tree-compiler lunzip \
    dosfstools vim-common parted udev lzop rsync
RUN pip install pycrypto
RUN curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo > /usr/local/bin/repo && \
    chmod +x /usr/local/bin/repo
RUN which repo
ENV REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo/' USER=android9-docker
ARG USER_ID=0
ARG GROUP_ID=0
RUN groupadd -g ${GROUP_ID} jenkins-docker && useradd -m -g jenkins-docker -u ${USER_ID} android9-docker
# git config
RUN echo "[user]" > /home/android9-docker/.gitconfig"
RUN echo "   name = android9-docker" >> /home/android9-docker/.gitconfig
RUN echo "   email = android9-docker@radxa.com" >> /home/android9-docker/.gitconfig
USER android9-docker
```

### Building a Docker image

```bash
docker build -t android-builder:9.x --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` $(which-dir-dockerfile-in)
```

## Code Download

```bash
mkdir zero-android9
cd zero-android9
repo init -u https://gitlab.com/amlogic-android/manifests.git -b p-amlogic -m radxa-w2-p-release.xml
repo sync -d --no-tags -j4
```

## Compiling images

Compiling images can be done in two ways

### Method 1 (**recommended**)

Compile using SDK compilation scripts

```bash
./device/amlogic/common/quick_compile.sh 14 1
```

Wait for the compilation to complete and you will find the image in the IMAGE directory.

### Method two

You can compile the image step by step according to this method

1. Compile U-boot

```bash
cd bootloader/uboot-repo
./mk radxa_zero --systemroot
cp build/u-boot.bin ../../device/amlogic/$project_path/bootloader.img;
cp build/u-boot.bin.usb.bl2 ../../device/amlogic/faraday/upgrade/u-boot.bin.usb.bl2;
cp build/u-boot.bin.usb.tpl ../../device/amlogic/faraday/upgrade/u-boot.bin.usb.tpl;
cp build/u-boot.bin.sd.bin ../../device/device/amlogic/faraday/upgrade/u-boot.bin.sd.bin;
cd -
```

2. Compiling AOSP

```bash
source build/envsetup.sh
lunch faraday-userdebug
make otapackage -j$(nproc)
```

This will take a long time, please take a break and wait ......
The image will be saved as a zip archive in the out/target/product/faraday directory.
The file name format is as follows: faraday-fastboot-flashall-20211104.zip
