---
sidebar_position: 7
---

# Chinese Environment Setup

This guide explains how to configure the Chinese language and system timezone on the Radxa ROCK 4D.

:::tip
Chinese language support is not complete throughout the system. Some system options may still appear in English.
:::

## Configure Chinese Language

To set up a Chinese environment, you first need to change the system language to Chinese.

① : Click `System Settings`

② : Click `Regional Settings`

③ : Change the language

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/chinese-env-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Set `Language` to `Simplified Chinese` :

① : Change language

② : Select `Simplified Chinese`

③ : Apply the language changes

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/chinese-env-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After changing the language, you'll need to restart the system for the changes to take effect. We'll also set the time to Beijing time before rebooting.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/chinese-env-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Configure Timezone

Change the system time to Beijing time.

① : Select `Date & Time` in `Regional Settings`

② : Choose the `Time Zone` option

③ : Select `Asia/Shanghai` as the timezone (Area: `Shanghai`, Region: `Asia/China`)

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/chinese-env-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After configuring both the Chinese language and timezone, enter the following command in the terminal to reboot the system:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo reboot
```
</NewCodeBlock>

<div style={{textAlign: 'center'}}>
Screenshot showing successful configuration
  <img src="/img/rock4/4d/chinese-env-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
