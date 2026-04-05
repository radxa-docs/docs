---
sidebar_position: 3
---

# PureOS

PureOS is a free software distribution based on Debian, developed by Purism with a focus on privacy and security.

## Support Status

**Currently, there is no official support or pre-built images of PureOS for ROCK 3A.**

## Alternative Solutions

If you want to use a free software environment similar to PureOS on ROCK 3A, consider the following alternatives:

### 1. Debian
- **Official Support**: Radxa provides official Debian images for ROCK 3A
- **Compatibility**: Since PureOS is based on Debian, most Debian packages should work on ROCK 3A
- **How to Get**: Download the latest Debian image from the [Radxa Download Page](https://docs.radxa.com/rock3/rock3a/download)

### 2. Build from Source
If you want to try running PureOS on ROCK 3A, you can:
1. Get the source code from the PureOS website
2. Use ROCK 3A's Debian kernel configuration as a base
3. Refer to Debian installation guides for adaptation

## Known Limitations

1. **Hardware Support**: PureOS may not include ROCK 3A specific hardware drivers
2. **Kernel Configuration**: Kernel configuration adjustments are needed for ROCK 3A's Rockchip RK3568 processor
3. **Bootloader**: Manual configuration of U-Boot bootloader may be required

## Community Resources

If you're attempting to install PureOS on ROCK 3A, check out these community resources:
- [Radxa Forum](https://forum.radxa.com/)
- [Purism Community](https://forums.puri.sm/)
- [Debian ARM Port Page](https://www.debian.org/ports/arm64/)

## Feedback & Help

If you successfully install PureOS on ROCK 3A, or encounter specific technical issues, please:
1. Share your experience on [GitHub Issues](https://github.com/radxa-docs/docs/issues)
2. Discuss with other users on the [Radxa Forum](https://forum.radxa.com/)
3. Submit improvement suggestions for this documentation