---
sidebar_position: 12
---

# Rsetup Tool

Rsetup is a system configuration tool for Radxa OS that helps users easily configure various system settings, including system preferences, hardware settings, software configuration, network setup, user accounts, language settings, and more.

## Using Rsetup

Launch the Rsetup tool by running the `rsetup` command in the terminal.

:::tip
Rsetup Usage Guide:

- Select an option: The corresponding option will be highlighted
- Confirm selection: Press `Enter`
- Cancel selection: Press `ESC`
- Navigate options: Use `Up`, `Down`, `Left`, and `Right` arrow keys
- Multiple selection interface: Press `Space` to select, then `Enter` to confirm; a `*` will appear next to enabled options

:::

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo rsetup
```
</NewCodeBlock>

## Rsetup Options

After launching Rsetup, you'll see a list of options similar to the following. Note that the interface may vary slightly between versions.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### System

The System option is used for system upgrades, modifying boot methods, and configuring the Bootloader.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
We recommend using the `System Update` option to upgrade your system, ensuring you have the latest version.

Using the `sudo apt update && sudo apt upgrade` command for system upgrades may result in incomplete updates or system instability.
:::

### Hardware

The Hardware option manages onboard hardware, including video capture devices, LED controls, GPIO controls, and more.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Overlays

The Overlays option manages Device Tree Overlays, allowing you to enable or disable specific hardware features.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Connectivity

The Connectivity option manages network connections, including both wired and wireless network settings.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### User Settings

The User Settings option manages system usernames, passwords, and auto-login configurations.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Localization

The Localization option sets the system timezone, locale, and WiFi country code.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Common Tasks

The Common Tasks option performs various system maintenance tasks.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### About

The About option displays information about the Rsetup tool.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-09.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
