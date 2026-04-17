---
sidebar_position: 2
---

# Radxa AIcore DX-M1/DX-M1M

## Product overview

<Tabs queryString="Product">

<TabItem value="DX-M1">

Radxa AICore DX-M1 is a high-performance edge AI acceleration computing module based on DEEPX's DX-M1 module. It features high energy efficiency, high-precision computing, and ease of use, specifically optimized for edge computing scenarios and machine vision.

The Radxa AICore DX-M1 module is currently compatible with various single-board computers (SBCs), such as Radxa ROCK 5B/5B+ and other boards.

- **High Energy Efficiency Design**

Features an energy-efficient design with excellent inference performance and low power consumption, achieving 25 TOPS computing power with only 3-5W power consumption.

- **High-Precision Computing**

Utilizes IQ8™ (Intelligent Quantization Integer 8) technology, maintaining the same precision level as GPU's FP32.

- **Ease of Use**
  - AI Frameworks: Supports ONNX, PyTorch, TensorFlow.
  - System Support: Supports Ubuntu, Debian.
  - Standardized Interface: Adopts standard M.2 2280 M Key form factor, compatible with industrial and embedded devices.

</TabItem>

<TabItem value="DX-M1M">

Radxa AICore DX-M1M is a compact edge AI acceleration module powered by the DEEPX DX-M1M, designed for fast and efficient on-device inference in embedded and industrial systems.

This AI processor delivers a stunning 25 TOPS (INT8) while maintaining ultra-low power consumption at just 3W, enabling high performance within a highly efficient power budget. It integrates onboard memory and QSPI flash in a standard M.2 M + B Key (PCIe Gen3 ×2) form factor. With broad host and OS compatibility, AICore DX-M1M provides a scalable, plug-in path for accelerating edge AI workloads, from proof-of-concept to production deployment.

- **High Energy Efficiency Design**

Achieves up to 25 TOPS of inference performance while consuming only up to 3W, providing an exceptional performance‑per‑watt ratio for edge and embedded deployments.

- **Seamless Developer Experience**

Built on a standard PCIe‑based module interface with broad OS and framework support, the AICore DX‑M1M ensures quick integration and shortened time‑to‑deployment.

- Standard Interface: M.2 M + B Key (PCIe Gen3 x2)
- Host Platform: x86 / ARM
- Software Support: Windows 10 / 11, Ubuntu 24.04 / 22.04 / 20.04 LTS, Docker
- AI Frameworks: Supports TensorFlow, ONNX, Keras, PyTorch via DX-COM compiler

</TabItem>

</Tabs>

## Product appearance

<Tabs queryString="Product">

<TabItem value="DX-M1">

<div style={{textAlign: 'center'}}>
   AIcore DX-M1 module (front)
   <img src="/en/img/aicore-dx-m1/dx-m1-top.webp" style={{width: '60%', maxWidth: '800px'}} />
   AIcore DX-M1 module (back)
    <img src="/en/img/aicore-dx-m1/dx-m1-bottom.webp" style={{width: '60%', maxWidth: '800px'}} />
</div>

</TabItem>

<TabItem value="DX-M1M">

<div style={{textAlign: 'center'}}>
   AIcore DX-M1M module (front)
   <img src="/en/img/aicore-dx-m1/dx-m1m-top.webp" style={{width: '60%', maxWidth: '800px'}} />
   AIcore DX-M1M module (back)
    <img src="/en/img/aicore-dx-m1/dx-m1m-bottom.webp" style={{width: '60%', maxWidth: '800px'}} />
</div>

</TabItem>

</Tabs>

## Specifications

<Tabs queryString="Product">

<TabItem value="DX-M1">

| Product                 | AIcore DX-M1M                      |
| :---------------------- | :--------------------------------- |
| Type                    | AI accelerator module              |
| AI performance          | 25 TOPS                            |
| Form factor             | M.2 M key                          |
| Dimensions              | 22 × 80 mm                         |
| Interface               | PCIe Gen 3 ×4                      |
| Memory configuration    | 4GB LPDDR5 + 1Gbit QSPI NAND Flash |
| Debug interface         | UART0, JTAG1                       |
| Supported AI frameworks | PyTorch, ONNX, TensorFlow          |
| Supported OS            | Linux (Ubuntu, Debian)             |
| Supported architectures | ARM                                |

</TabItem>

<TabItem value="DX-M1M">

| Product               | AICore DX-M1M                                                         |
| --------------------- | --------------------------------------------------------------------- |
| Type                  | AI Acceleration Module                                                |
| AI Performance        | 25 TOPS                                                               |
| Memory                | 1GB LPDDR4X@4266 MT/s                                                 |
| Storage               | QSPI 1Gbit NAND / NOR Flash                                           |
| Module Interface      | PCIe Gen3 x2                                                          |
| Host Interface        | PCIe Gen3 x4 (Supports Gen 1/2/3 & x1/x2)                             |
| Software              | Support Windows 10 / 11, Ubuntu 24.04 / 22.04 / 20.04 LTS, Docker     |
| Al Frameworks         | Support TensorFlow, ONNX, Keras, PyTorch by DX-COM compiler converted |
| Operating Temperature | -25 ~ 65°C (Non-Throttling) / -25 ~ 85°C (Throttling)                 |
| Host Platform         | x86 / ARM                                                             |
| Power Consumption     | 3W (Typical)                                                          |
| Form Factor           | M.2 M + B Key, 22mm x 42mm                                            |

</TabItem>

</Tabs>

## Application scenarios

- Smart cameras
- Autonomous driving
- Consumer electronics
- Security surveillance
- Edge computing
- Smart mobility
