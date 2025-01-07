---
sidebar_position: 4
---

# Low Level Development

Introduces how to build and pack uboot, kernel, aosp and so on.

## Environment configuration

For Ubuntu >= 15.04 ,use Open JDK

```bash
sudo apt-get update
sudo apt-get install openjdk-8-jdk

```

## Download Radxa Android SDK

Radxa Android SDK contains hundreds of Git repositories, and it would be very tedious to download them one by one without repo.

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

#### Code download

```bash
$ repo init -u https://github.com/radxa/manifests.git -b Android12_RK3588_Radxa_rk12 -m rockchip-s-release.xml
$ repo sync -d --no-tags -j4
```

## Mirror compilation

Mirror compilation can be done using two methods

### Method 1 (**recommended**)

Compile using the SDK compilation script method

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch Radxa_PS009-userdebug # If compile the user version, choose Radxa_PS009-user
radxa:rock-android12 $ ./build.sh -UACKu
# get images from IMAGE directory
```

Wait for the build to complete and you will find the images in the IMAGE directory.

### Method two

You can compile the image step by step according to this method

1. Set up the environment for compiling the project

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch Radxa_PS009-userdebug # If compile the user version, choose Radxa_PS009-user
```

2. Compile U-boot

```bash
radxa:rock-android12 $ ./build.sh -U
```

3. Compile the kernel

```bash
radxa:rock-android12 $ ./build.sh -CK
```

4. Compile AOSP

```bash
radxa:rock-android12 $ ./build.sh -A
```

5. Make Images

```bash
radxa:rock-android12 $ ./build.sh -u
```
