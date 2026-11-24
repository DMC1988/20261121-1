# 04 Fab Package: 20261121-1 Fuente de laboratorio

Gate: G3 | Version: draft

<!-- Filled at release. One block per fabricated revision; newest first. `fab/` is generated from the tag, never hand-edited. -->

## Release hw-vX.Y

| Item | Value |
|---|---|
| hw tag | hw-vX.Y |
| Commit | TBD |
| Date | TBD |
| Silkscreen version marking | vX.Y (must equal the tag) |
| ERC report | hw/reports/erc-YYYYMMDD.rpt |
| DRC report | hw/reports/drc-YYYYMMDD.rpt |

### Output files (in `fab/`)

| File | Purpose |
|---|---|
| TBD | Gerber / drill / BOM / position |

### PCB specification given to the fab house

| Parameter | Value |
|---|---|
| Layers | TBD |
| Board thickness | TBD |
| Copper weight | TBD |
| Surface finish | TBD |
| Solder mask / silkscreen | TBD |
| Fab house and order reference | TBD |
| Special notes | TBD |

### BOM and sourcing

| Check | Status |
|---|---|
| Every line has Manufacturer, MPN, Supplier, SupplierPN | TBD |
| Stock checked by the user (date) | TBD |
| Alternates for single-source critical parts | TBD |

### Assembly notes

| Topic | Note |
|---|---|
| Parts not fitted (DNP) | TBD |
| Polarity / orientation-sensitive parts | TBD |
| Special steps (order of soldering, hand-fitted parts) | TBD |

### Mechanical fit (checked by the user)

TBD (PCB outline, mounting holes, connector positions, enclosure)

### Mechanical parts (only if `mech/` exists)

| Item | Value |
|---|---|
| mech tag | mech-vX.Y |
| CAD tool and version | TBD |
| Parts (name, material, process: print / laser / CNC / sheet) | TBD |
| Manufacturing files (in `mech/exports/`) | TBD (STEP, plus STL / DXF / drawing as the process needs) |
| Key tolerances and fits | TBD |
| Fasteners and hardware | TBD |
| Assembly notes | TBD |

### Firmware

| Item | Value |
|---|---|
| fw version | TBD |
| Build command | TBD (pinned platform and library versions in platformio.ini) |
| Build evidence | TBD (build log note) |
| How it is flashed | TBD |

### Errata / known issues

None recorded.
