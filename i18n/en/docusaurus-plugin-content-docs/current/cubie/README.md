---
sidebar_position: 1
slug: /cubie
---

# Cubie Series

The Cubie series is a line of single-board computers from Radxa based on Allwinner SoCs.

## Model Comparison

| Model     | SoC / CPU                                                    | NPU Performance      | Memory Options                              | System / Onboard Storage                  | Storage Expansion & Buses        | Networking & Wireless                                               | Display & Camera                             | Typical I/O                            |
| --------- | ------------------------------------------------------------ | -------------------- | ------------------------------------------- | ----------------------------------------- | -------------------------------- | ------------------------------------------------------------------- | -------------------------------------------- | -------------------------------------- |
| Cubie A5E | Allwinner A527 / T527, 8× Cortex-A55, up to 2.0GHz           | T527 variant: 2 TOPS | LPDDR4/4x: 1GB / 2GB / 4GB                  | SPI Flash, onboard eMMC (optional 0–32GB) | MicroSD, M.2 M-Key NVMe (2230)   | Dual Gigabit Ethernet (one PoE via PoE HAT), Wi‑Fi 6, Bluetooth 5.4 | HDMI 4K@60, 1× MIPI DSI, 1× MIPI CSI         | 40-pin GPIO, USB 3.0 Type‑A, USB‑C OTG |
| Cubie A7A | Allwinner A733, 2× A76 + 6× A55, up to 2.0GHz                | 3 TOPS               | LPDDR5: 2GB / 4GB / 6GB / 8GB / 12GB / 16GB | 8MB SPI NOR Flash                         | MicroSD, eMMC module, UFS module | Gigabit Ethernet (PoE via PoE HAT), Wi‑Fi 6, Bluetooth 5.4          | HDMI 4K@60, 1× MIPI DSI, 1×/2× MIPI CSI      | 40-pin GPIO, PCIe 3.0 FPC, rich USB    |
| Cubie A7Z | Allwinner A733, 2× A76 + 6× A55, ultra-compact 65×30mm board | 3 TOPS@INT8          | LPDDR4/4x: 1GB / 2GB / 4GB / 8GB / 16GB     | Optional onboard UFS (up to 1TB)          | MicroSD, PCIe 3.0 FPC (1-lane)   | Onboard Wi‑Fi 6, Bluetooth 5.4                                      | Micro HDMI 4K@60, USB‑C 3.0 DP Alt, MIPI CSI | 40-pin GPIO, dual USB‑C                |

## Model Highlights and Selection Advice

### Cubie A5E: Dual-network and industrial-first

- Dual Gigabit Ethernet with one PoE-capable port (requires PoE HAT), suitable for industrial gateways, edge routers, and dual-network isolation.
- Optional T527 SoC with 2 TOPS NPU, adequate for lightweight edge AI inference (simple detection/classification).
- M.2 M-Key NVMe support enables compact high-speed local storage expansion.
- Standard 40-pin GPIO, HDMI + MIPI DSI / CSI cover typical industrial control and HMI needs.
- Best for: projects prioritizing dual-network/PoE and industrial gateway use cases where board size is not extremely constrained.

### Cubie A7A: General-purpose high-performance edge AI platform

- Allwinner A733 with 3 TOPS NPU makes it suitable for general edge AI and desktop/multimedia development.
- LPDDR5 up to 16GB supports larger model inference, multitasking, and desktop graphics workloads.
- Supports eMMC / UFS modules so system storage can be flexibly chosen for production.
- PCIe 3.0 FPC enables connecting NVMe, AI accelerator cards, or other high-speed peripherals for strong expandability.
- Rich USB, audio interfaces and 40-pin GPIO balance desktop experience and embedded extensibility.
- Best for: projects needing a balance of performance and expansion, with some space for the board.

### Cubie A7Z: Ultra-compact edge AI module

- Ultra-small 65×30mm board offering A7A-like CPU/NPU performance in a tiny form factor.
- Optional onboard UFS (up to 1TB) provides high-capacity, high-performance system storage without extra modules.
- Dual USB‑C (one with USB 3.0 + DP Alt), suitable for compact enclosures or modular products.
- Onboard Wi‑Fi 6 / Bluetooth 5.4, 40-pin GPIO and PCIe 3.0 FPC keep expansion capabilities despite small size.
- Best for: space-constrained designs requiring onboard high-speed storage and high integration for edge AI or embedded products.

<DocCardList />
