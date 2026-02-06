---
sidebar_position: 2
---

# Hardware installation

This guide explains how to install AIcore DX-M1 / DX-M1M onto a host board.

:::tip Installation notes
AIcore DX-M1 / DX-M1M uses an M.2 M Key connector, and must be installed into the host board's M.2 M Key slot.
:::

## Install the module

Install AIcore DX-M1 / DX-M1M with the power disconnected. Do not install AIcore DX-M1 / DX-M1M while the system is powered on.

### Pre-install AIcore DX-M1 / DX-M1M

<Tabs queryString="Product">

<TabItem value="DX-M1">

Tilt the M.2 M Key edge of AIcore DX-M1 at an angle (about 15 degrees), align it with the host board's M.2 M Key slot, and gently insert it.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx_m1_preinstall.webp" style={{width: '75%', maxWidth: '800px'}} />
</div>

</TabItem>

<TabItem value="DX-M1M">

Tilt the M.2 M Key edge of AIcore DX-M1M at an angle (about 15 degrees), align it with the host board's M.2 M Key slot, and gently insert it.

Note: If the host board provides a 2280-length M.2 mounting position, you can use a 2242-to-2280 extension adapter.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx_m1m_preinstall.webp" style={{width: '75%', maxWidth: '800px'}} />
</div>

</TabItem>

</Tabs>

### Secure the module

<Tabs queryString="Product">

<TabItem value="DX-M1">

After confirming AIcore DX-M1 is properly pre-installed, press the other end down and secure it to the host board using a screw.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx_m1_install.webp" style={{width: '75%', maxWidth: '800px'}} />
</div>

</TabItem>

<TabItem value="DX-M1M">

After confirming AIcore DX-M1M is properly pre-installed, press the other end down and secure it to the host board using a screw.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/dx_m1m_install.webp" style={{width: '75%', maxWidth: '800px'}} />
</div>

</TabItem>

</Tabs>

## Thermal notes

Radxa AIcore DX-M1 / DX-M1M can generate significant heat under load. To ensure proper cooling, we recommend active cooling or passive cooling using a metal enclosure (see 2.1 for an example active cooler).

### Installation example

Radxa AIcore DX-M1 with a metal enclosure: Make sure the thermal pads on both sides are positioned symmetrically to avoid uneven stress that could deform the module.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/aicore-dx-m1/aicore_dx_m1_heat.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>
