---
sidebar_position: 9
---

# Rsetup Tool

Rsetup is a system configuration tool for Radxa OS that helps users easily configure various system settings, including system settings, hardware settings, software settings, network settings, user settings, language settings, and more.

## Using Rsetup

Run the `rsetup` command in the terminal to start the Rsetup tool.

:::tip
Rsetup Usage Guide:

- Select an option: The corresponding option will be highlighted
- Confirm selection: Press `Enter`
- Cancel selection: Press `ESC`
- Navigate between options: Use `Up`, `Down`, `Left`, `Right` arrow keys
- Multiple selection interface: Press `Space` to select, `Enter` to confirm selection

:::

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo rsetup
```
</NewCodeBlock>

## Rsetup Options

After launching Rsetup, you will see a list of options similar to the following. Note that the interface may vary slightly depending on the version. Please refer to your actual interface.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### System

The System option is used for system upgrades, modifying boot methods, configuring Bootloader, and more.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
We recommend using the `System Update` option to upgrade your system and ensure you have the latest version.

Using the `sudo apt update && sudo apt upgrade` command for system upgrades may result in incomplete updates or system instability.
:::

### Hardware

The Hardware option is used to manage onboard hardware, including video capture devices, LED control, GPIO control, and more.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Overlays

The Overlays option is used to manage Device Tree Overlays, allowing you to enable or disable specific hardware features.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Connectivity

The Connectivity option is used to manage network connections, including wired and wireless network settings.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### User Settings

The User Settings option is used to manage the current username, password, and configure auto-login.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Localization

The Localization option is used to set the system timezone, locale, and WiFi country.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Common Tasks

The Common Tasks option is used to perform common system tasks.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### About

The About option is used to view information about the Rsetup tool.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rsetup-09.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
