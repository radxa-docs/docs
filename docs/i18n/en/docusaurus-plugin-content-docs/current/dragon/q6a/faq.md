---
sidebar_position: 145
---

# Frequently Asked Questions

## Why does enabling 8-inch DSI overlay cause Q6A boot failure?

Some users have encountered boot failure issues (blue light stays on then blinks, no display output) after enabling the Radxa Display 8 HD DSI overlay on Dragon Q6A.

This is a known compatibility issue related to specific kernel versions:

**Known affected versions:**
- `linux-image-6.18.2-3-qcom` and earlier versions

**Solution:**
1. Check current kernel version:
   ```bash
   apt policy linux-image-6.18.2-4-qcom
   ```
2. If `linux-image-6.18.2-4-qcom` is available, update the system:
   ```bash
   sudo apt update
   sudo apt upgrade
   ```
3. Reboot the system and try enabling DSI overlay again

**If the issue persists:**
- Temporarily disable DSI overlay and wait for [linux-qcom](https://github.com/radxa-pkg/linux-qcom/releases) to release a fix
- You can access the system via serial port or recovery mode to disable the overlay

**Note:** This issue only affects the DSI overlay for Radxa Display 8 HD. HDMI output and other functions are not affected.