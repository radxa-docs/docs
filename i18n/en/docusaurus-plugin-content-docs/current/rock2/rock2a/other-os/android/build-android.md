---
sidebar_position: 4
---

# Build Android

Introduces how to build and pack uboot, kernel, aosp and so on.

## Environment configuration

For Ubuntu >= 15.04 ,use Open JDK

```bash
sudo apt-get update
sudo apt-get install openjdk-8-jdk

```

## Download Radxa Android SDK

Radxa Android SDK contains hundreds of Git repositories, it use repo to download 

### Repo

Repo is a tool used in Android development to manage multiple Git repositories. It is a Python script that facilitates developers to version control and manage multiple Git libraries.

#### Download Repo

```bash
$ echo "export REPO_URL='https://storage.googleapis.com/git-repo-downloads/repo'" >> ~/.bashrc
$ source ~/.bashrc
$ curl https://storage.googleapis.com/git-repo-downloads/repo -o /tmp/repo
$ sudo cp /tmp/repo /usr/local/bin/repo
$ sudo chmod +x /usr/local/bin/repo
```

#### Download Code

```bash
$ repo init -u https://github.com/radxa/manifests -b Android13_RK3528 -m radxa.xml
$ repo sync -d --no-tags -j4
```

## Build Android

There are two ways to build android.

### Method I (**recommended**)

Build and pack the image in one command.

```bash
radxa:rock-android13 $ source build/envsetup.sh
radxa:rock-android13 $ lunch rk3528_rock_2a-userdebug
radxa:rock-android13 $ . /build.sh -UACKu
# get images from rockdev directory
```

Wait for the building to complete and you will find the images in the rockdev directory.

### Method II

Build the image step by step.

1. set up the environment

```bash
radxa:rock-android13 $ source build/envsetup.sh
radxa:rock-android13 $ lunch rk3528_rock_2a-userdebug
```

2. build U-boot

```bash
radxa:rock-android13 $ . /build.sh -U
```

3. build kernel

```bash
radxa:rock-android13 $ . /build.sh -CK
```

4. build AOSP

```bash
radxa:rock-android13 $ . /build.sh -A
```

5. Pack Image

```bash
radxa:rock-android13 $ . /build.sh -u
```
