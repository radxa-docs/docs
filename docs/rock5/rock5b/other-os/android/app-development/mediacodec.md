---
sidebar_position: 7
description: 介绍 Rockchip MPP 媒体处理平台，包括硬件编解码库差异、编解码规格及使用例程
---

# RK MPP

瑞芯微提供的媒体处理软件平台（Media Process Platform，简称 MPP）是适用于瑞芯微芯片系列的通用媒体处理软件平台。

## 硬件编解码仓库差异

瑞芯微提供了 native-codec、rkvpu-codec、mpp-codec 等硬件编解码调用仓库，同时还有 libhwjpeg 专属 JPEG 硬编解码库。这些仓库基于 Android/Rockchip 多媒体架构分层设计，性能表现存在显著差异。

### 调用仓库差异

Rockchip 多媒体硬件编解码的底层核心是 MPP，直接对接 VPU 内核驱动；上层是 Android 原生 MediaCodec 框架，遵循 OMX 标准；中间层 libvpu 封装 MPP 接口并提供更易用的硬件调用能力。四类仓库分布在应用层、框架层、底层不同层级。

| 仓库名称     | 调用层级       | 核心依赖        |
| ------------ | -------------- | --------------- |
| native-codec | Android 框架层 | MediaCodec、OMX |
| rkvpu-codec  | Android 框架层 | libvpu、MPP     |
| mpp-codec    | Android 内核层 | MPP             |
| libhwjpeg    | Android 框架层 | MPP             |

### 差异描述

#### MediaCodec

MediaCodec 是多媒体"编解码器"组件，是 Android 底层多媒体支持基础框架的一部分。

MediaCodec 可以直接处理音视频裸流，能够精细控制编解码细节。

作为编解码器组件，MediaCodec 遵循 OpenMax 框架，可通过 codec-name 区分软硬件编解码器：

- `OMX.rk` 开头 → Rockchip 硬件编解码器
- `OMX.google` 或 `c2.android` 开头 → Google 软件编解码器

MediaCodec 提供 Java / Native (C++) 两层 API 接口，使用方法类似。Java 层应用设计可参考 [MediaCodec API](https://developer.android.com/reference/android/media/MediaCodec)。

#### native-codec

native-codec 为 Android Native 层 MediaCodec 编解码接口的使用范例。

#### rkvpu-codec

libvpu 硬编解码库中设计了 VpuApiLegacy 用户接口，使用 VpuCodecContext 对象可以方便地进行硬编解码接口调用。VpuApiLegacy 直接与底层编解码库交互，减少了中间环节的性能开销。

#### mpp-codec

MPP 是最底层的媒体中间件，直接与 VPU 内核驱动交互。无论是 native-codec 还是 rkvpu-codec，最终都需要与 MPP 交互完成硬件编解码。

#### libhwjpeg

由于 Google 原生 MediaCodec 不支持 JPEG 编解码，且 JPEG 编解码可能涉及 EXIF 头信息操作，需要在 Rockchip 系统多媒体应用中集成 JPEG 硬编解码功能。可使用 libhwjpeg 弥补 JPEG 硬编解码支持的不足。

## 编解码规格

### 解码规格

| SoC         | H264          | H265          | VP9           | JPEG           |
| ----------- | ------------- | ------------- | ------------- | -------------- |
| RK3588      | 7680x4320@30f | 7680x4320@60f | 7680x4320@60f | 1920x1080@280f |
| RK3576      | 4096x2304@60f | 4096x2304@60f | 4096x2304@60f | 3840x2160@90f  |
| RK3562      | 1920x1080@60f | 4096x2304@30f | 4096x2304@30f | 1920x1080@60f  |
| RK3528      | 4096x2304@30f | 4096x2304@60f | 4096x2304@60f | 1920x1080@120f |
| RK356X      | 4096x2304@30f | 4096x2304@60f | 4096x2304@60f | 1920x1080@80f  |
| RK3399      | 4096x2304@30f | 4096x2304@60f | 4096x2304@60f | 1920x1080@30f  |
| RK3328      | 4096x2304@30f | 4096x2304@60f | 4096x2304@60f | 1920x1080@30f  |
| RK3288      | 3840x2160@30f | 4096x2304@60f | N/A           | 1920x1080@30f  |
| RK3358/PX5  | 4096x2160@25f | 4096x2304@60f | N/A           | 1920x1080@30f  |
| RK3326/PX30 | 1920x1080@60f | 1920x1080@60f | N/A           | 1920x1080@30f  |
| RK312X      | 1920x1080@60f | 1920x1080@60f | N/A           | 1920x1080@30f  |

其他需要注意的点：

1. RK3588 支持 AVS2(7680x4320@60f) 及 AV1(3840x2160@60f) 解码
2. RK3528 支持 AVS2(4096x2160@60f) 解码
3. RK3562 不支持 mpeg1/2/4、vp8、h263 等格式解码
4. 除 RK3562 外，其他芯片支持 mpeg1/2/4、vp8、h263 解码，最大规格为 1080P

### 编码规格

| SoC         | H264          | H265          | VP8           | JPEG           |
| ----------- | ------------- | ------------- | ------------- | -------------- |
| RK3588      | 7680x4320@30f | 7680x4320@30f | 1920x1080@30f | 3840x2160@30f  |
| RK3576      | 3840x2160@60f | 3840x2160@60f | N/A           | 3840x2160@160f |
| RK3562      | 1920x1080@30f | N/A           | N/A           | N/A            |
| RK3528      | 1920x1080@60f | 1920x1080@60f | N/A           | 3840x2160@30f  |
| RK356X      | 1920x1080@60f | 1920x1080@60f | 1920x1080@30f | 1920x1080@60f  |
| RK3399      | 1920x1080@30f | N/A           | 1920x1080@30f | 1920x1080@30f  |
| RK3328      | 1920x1080@30f | 1920x1080@30f | 1920x1080@30f | 1920x1080@30f  |
| RK3288      | 1920x1080@30f | N/A           | 1920x1080@30f | 1920x1080@30f  |
| RK3368/PX5  | 1920x1080@30f | N/A           | 1920x1080@30f | 1920x1080@30f  |
| RK3326/PX30 | 1920x1080@30f | N/A           | 1920x1080@30f | 1920x1080@30f  |
| RK312X      | 1920x1080@30f | N/A           | 1920x1080@30f | 1920x1080@30f  |

## 仓库底层关联性

各仓库最终都依赖 MPP 对接 VPU 硬件，关系如下：

<img src="/img/rock5b/mpp_relationship.webp" alt="仓库依赖关系" />

## 播放器无法使用硬件解码器

**问题**：使用某些 Android 播放器播放视频时，无法使用硬件解码器。

**排查方法**：确认 Android 播放器在调用 MediaCodec 时是否选择了名为 `c2.rk.avc.decoder` 的解码器。如果过滤了 RK 专属解码器，会导致播放视频时无法使用硬件解码器。

## MediaCodec 使用例程

针对 Android 平台编解码开发场景，提供一份 MediaCodec 编解码例程：

- [MediaCodec 编解码项目](https://github.com/chenxmqqqq/Multimedia#)
