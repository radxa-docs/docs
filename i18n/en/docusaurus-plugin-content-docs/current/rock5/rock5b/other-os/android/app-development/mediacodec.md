---
sidebar_position: 7
description: Introduction to Rockchip MPP media processing platform, including hardware codec library differences, codec specifications, and usage examples
---

# RK MPP

Rockchip's Media Process Platform (MPP) is a general-purpose media processing software platform for Rockchip chip series.

## Hardware Codec Repository Differences

Rockchip provides hardware codec repositories including native-codec, rkvpu-codec, mpp-codec, and a dedicated JPEG hardware codec library libhwjpeg. These repositories are designed based on Android/Rockchip multimedia architecture layering, with significant performance differences.

### Repository Comparison

The core of Rockchip multimedia hardware codec is MPP, which directly interfaces with the VPU kernel driver. The upper layer is the native Android MediaCodec framework, following the OMX standard. The middle layer libvpu encapsulates MPP interfaces and provides easier hardware calling capabilities. The four types of repositories are distributed across different layers: application layer, framework layer, and bottom layer.

| Repository   | Layer             | Core Dependency |
| ------------ | ----------------- | --------------- |
| native-codec | Android Framework | MediaCodec, OMX |
| rkvpu-codec  | Android Framework | libvpu, MPP     |
| mpp-codec    | Android Kernel    | MPP             |
| libhwjpeg    | Android Framework | MPP             |

### Repository Details

#### MediaCodec

MediaCodec is a multimedia "codec" component and part of Android's underlying multimedia support framework.

MediaCodec can directly process raw audio/video streams and finely control codec details.

As a codec component, MediaCodec follows the OpenMax framework and can distinguish between hardware and software codecs via codec-name:

- `OMX.rk` prefix → Rockchip hardware codec
- `OMX.google` or `c2.android` prefix → Google software codec

MediaCodec provides Java / Native (C++) two-layer API interfaces with similar usage. For Java layer application design, refer to [MediaCodec API](https://developer.android.com/reference/android/media/MediaCodec).

#### native-codec

native-codec provides usage examples for Android Native layer MediaCodec codec interface.

#### rkvpu-codec

The libvpu hardware codec library implements the VpuApiLegacy user interface, using VpuCodecContext objects to facilitate hardware codec interface calls. VpuApiLegacy directly interacts with the underlying codec library, reducing performance overhead from intermediate links.

#### mpp-codec

MPP is the lowest-level media middleware, directly interacting with the VPU kernel driver. Whether native-codec or rkvpu-codec, ultimately they need to interact with MPP to complete hardware codec operations.

#### libhwjpeg

Since Google's native MediaCodec does not support JPEG codec, and JPEG codec may involve EXIF header operations, it is necessary to integrate JPEG hardware codec functionality in Rockchip system multimedia applications. libhwjpeg can be used to compensate for JPEG hardware codec support.

## Codec Specifications

### Decoding Specifications

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

Additional notes:

1. RK3588 supports AVS2 (7680x4320@60f) and AV1 (3840x2160@60f) decoding
2. RK3528 supports AVS2 (4096x2160@60f) decoding
3. RK3562 does not support mpeg1/2/4, vp8, h263 format decoding
4. Except for RK3562, other chips support mpeg1/2/4, vp8, h263 decoding with maximum specification of 1080P

### Encoding Specifications

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

## Repository Dependencies

All repositories ultimately depend on MPP to interface with VPU hardware, as shown below:

<img src="/en/img/rock5b/mpp_relationship.webp" alt="Repository dependencies" />

## Player Cannot Use Hardware Decoder

**Problem**: When using certain Android players to play videos, hardware decoder cannot be used.

**Troubleshooting**: Confirm whether the Android player selected the decoder named `c2.rk.avc.decoder` when calling MediaCodec. If RK-specific decoders are filtered out, hardware decoder cannot be used during video playback.

## MediaCodec Usage Example

For Android platform codec development scenarios, a MediaCodec codec example is provided:

- [MediaCodec Codec Project](https://github.com/chenxmqqqq/Multimedia#)
