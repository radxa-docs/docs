---
title: Software Compilation
---

## Initialize the Compilation Environment of the CIX SDK

Please execute the following commands in the root directory of the SDK to load the compilation tools and install the compilation dependencies:

```bash
sudo apt-get update
. ./build-scripts/envtool.sh
newer_env
sudo apt-get install python-is-python3 7zip meson apt-utils
```

Only at this time can you execute the following commands to download and extract the additional binary resources:

```bash
i=$((1))
get_cix_ext() {
    local block="$(printf "%03d" $1)"
    echo "https://github.com/radxa-pkg/cix-prebuilt/releases/download/$EX_CUSTOMER-$EX_PROJECT-$EX_VERSION/cix-sdk-ext.7z.$block"
}
while wget "$(get_cix_ext "$i")"; do
    i=$((i + 1))
done
7zz x cix-sdk-ext.7z.001
# Later system should use 7z instead of 7zz, as the command was renamed.
# Optionally, remove the downloaded files:
# rm cix-sdk-ext.7z.*
```

Now the system is ready for SDK compilation.

## Common Commands and Compilation Targets

The following commands can only be run after loading `envtoo.sh`:

- `help`: Display the SDK command help.
- `build radxa`: Compile all components and finally generate a runnable image.

## Build Artifacts

When the `build radxa` command is executed, you can find the following build artifacts:

- `output/cix_evb/images/linux-fs.sdcard`: System image.
- `output/cix_evb/images/cix_debian.iso`: The modified Debian installation ISO.
- `output/cix_evb/images/cix_flash_all_O6.bin`: BIOS image.
