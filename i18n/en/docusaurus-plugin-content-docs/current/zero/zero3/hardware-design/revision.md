---
sidebar_position: 2
---

# Revision History

This page records the official revision changes of Radxa ZERO 3W hardware versions, to help you cross-reference hardware documents such as schematics, component placement diagrams and BOMs. Component supplier and part-number details are intentionally omitted.

## V1.11 (2023-09)

- R119: value changed from 0201 100R to 0201 22R (package unchanged).
- Silkscreen and version marking updated to "Zero 3W V1.11".

## V1.111 (2023-10)

- 1U1 (RF switch): an additional approved alternate component option was added to the BOM. Footprint and pinout unchanged.

## V1.12 (2023-11)

Board configuration (HW ID / BOM ID) strap resistors corrected:

- R27: 51K → 100K
- R29: 51K → 20K
- R28: 10K → 18K
- R30: not populated (NC) → 36K
- R90728: not populated (NC) → 0R

## V1.12 (2023-12)

- Tolerance of R27 / R28 / R29 / R30 / R90728 unified to ±1%.

:::tip Cross-referencing hardware documents

Apart from the changes listed above, all other designators keep the same values and footprints between V1.11 and V1.12. The V1.11 component placement diagram and schematic can be used to cross-reference the corresponding designators on a V1.12 board.

:::
