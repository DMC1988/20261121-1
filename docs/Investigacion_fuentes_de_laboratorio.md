# Investigación: fuentes de laboratorio publicadas en revistas

Fecha de la búsqueda: 2026-11-21. Fuentes: Elektor, Nuts & Volts, Radio-Electronics / Hands-On Electronics, y Silicon Chip (extra). No se encontraron diseños utilizables en revistas en español (Saber Electrónica y similares).

Las especificaciones salen de las páginas de la revista o del PDF. "No verif." = solo se vio el resumen, sin leer el artículo completo. Los artículos de Elektor posteriores a 1990 son de pago o solo para miembros; las páginas de Labs ofrecen esquemas y PCB en PDF.

## Elektor

| Año / n.º | Diseño | Especificaciones | Topología | Acceso |
|---|---|---|---|---|
| 12/1982 | Precision power supply (tapa: "0 to 30 V, 3 A") | hasta 3 A a 35 V (no verif.) | No verif. | [Scan archive.org](https://ia601000.us.archive.org/28/items/ElektorMagazine/Elektor%5Bnonlinear.ir%5D%201982-12_text.pdf) |
| 1980 (Summer Circuits) | Variable 0-50 V 2 A | 0-50 V / 2 A | Lineal, original con LM10; rediseño SMD en 2022 | [Refresh en Labs](https://www.elektormagazine.com/labs/variable-0-50v-2a-supply-refresh) |
| 11/1990 (Elektor USA) | 400 W Laboratory PSU, Pt. 2 (G. Boddington) | 2 × (0-40 V / 5 A); paralelo 10 A; tracking ±40 V o 0-80 V | Lineal con preregulación por triac; optoacopladores Master/Slave | [PDF](https://worldradiohistory.com/Archive-Elektor-USA/Elektor-Electronics-USA-1990-11.pdf) |
| 3/1998, p. 16 | Variable PSU 0-24 V 1 A o 2 A (K. Walraven) | 0-24 V, 1 o 2 A, límite de corriente preajustable | No verif. | [Elektor](https://www.elektormagazine.com/magazine/199803/34051) |
| 4/1999, p. 36 | General purpose variable PSU (G. Baars) | No verif. | Componentes discretos | [Elektor](https://www.elektormagazine.com/magazine/199904/34354) |
| 11/2001–1/2002 | Digital Benchtop PSU, 3 partes (R. Pagel) | 0-25 V / 2.5 A (o 20 V / 1 A) | Regulación analógica (LT1491) + PIC BASIC; control por PC | [Pt.1](https://www.elektormagazine.com/magazine/elektor-200111/17123), [Pt.2](https://www.elektormagazine.com/magazine/elektor-200112/17141) |
| 4/2010 | UniLab | 0-30 V / 3 A, 90 W | Buck secundario a 52 kHz | [Artículo](https://www.elektormagazine.com/magazine/elektor-201004/19289), [proyecto 090786](https://www.elektormagazine.com/090786) |
| 11/2010 | UniLab Duo | 2 × 0-30 V / 3 A | Igual que UniLab | [Elektor](https://elektormagazine.com/magazine/elektor-201011/19490) |
| 5/2014, p. 64 | Fuente de laboratorio aislada de red (A. Hinz, sobre diseño de M. Christoph, RWTH Aachen) | No verif. | No verif. | [Elektor](https://www.elektormagazine.com/magazine/elektor-201405/26442) |
| 9/2014 | Professional Lab PSU [130234-I] | 0-30 V, pasos de 10 mV; 0-1 A (nota de prensa) o 0-2 A (página del proyecto): discrepancia | Preregulador conmutado desde 12 V de fuente ATX, hasta 70 % de eficiencia, módulos aislados | [Labs](https://www.elektormagazine.com/labs/laboratory-power-supply-with-switch-mode-pre-regulator-130234-i) |
| 11/2014 | VariLab 402 [120437] (T. Giesberts) | 0-40 V / 0-2 A | Buck síncrono LM5117 a 100 kHz + postregulador lineal (OPA552 + MOSFET P); display con µC | [Labs](https://www.elektormagazine.com/labs/lab-power-supply-0-40v-0-2a-120437) |
| 2016 (probablemente 9/2016) | SMPS 30 V / 3 A [150161], sucesor de UniLab | 30 V / 3 A; rizado 120 mVpp; 93 % de eficiencia a 30 V/3 A | Buck LM2677 a 260 kHz; límite de corriente ajustable, fusible, corte por baja tensión de entrada | [Labs](https://www.elektormagazine.com/labs/30v-3a-smps-150161) |
| n.º 461 (2025) | Low-Noise PSU [240386] (T. Giesberts) | ±0-22 V / 0-1 A; ruido ≈ 50 µVrms | Lineal puro; trafo con selección automática de tap por relés; límite por shunt, relé de descarga, fusibles, TVS | [Labs](https://www.elektormagazine.com/labs/low-noise-power-supply-240386); kit €249 |

## Nuts & Volts

| Año | Diseño | Especificaciones | Acceso |
|---|---|---|---|
| 3/2007 (deducido del nombre de archivo) | "A Test Bench Power Supply", Robert Reed | 2 × 0-20 V / 1 A + 5 V / 1 A; lineal con LM317K y 7805; sin límite de corriente dedicado | [Artículo](https://nutsvolts.com/magazine/article/a_test_bench_power_supply), [ZIP de PCB](https://www.nutsvolts.com/uploads/magazine_downloads/200703-Reed.zip) |

## Radio-Electronics / Hands-On Electronics

| Año | Diseño | Especificaciones | Acceso |
|---|---|---|---|
| Verano 1984, p. 21 | Dual Power Supply (J. T. Bailey) | 0-20 V / 400 mA; lineal (TIP31 + CA3140); protección de sobrecorriente rápida | [PDF](https://www.worldradiohistory.com/Archive-Radio-Electronics/Hands-On-Electronics-1984-Summer.pdf) |
| Primavera 1983, p. 76 | Bench-Top Power Supply | El índice no da datos técnicos; parece un banco de medición | [PDF](https://worldradiohistory.com/BOOKSHELF-ARH/Technology/Hobbyist-Specials/Special-Projects-1983-Spring.pdf) |

## Silicon Chip (extra)

| Año | Diseño | Especificaciones | Acceso |
|---|---|---|---|
| 10–12/2019 | High Performance Linear Bench Supply | 8 A a 45 V o 2 A a 50 V; trafo toroidal 500 VA; 2 ventiladores termocontrolados; fusible rápido 6 A | [Pt.2](https://www.siliconchip.com.au/Issue/2019/November/High+performance+linear+power+supply+%E2%80%93+part+two+++), [PCB](https://www.siliconchip.com.au/Shop/10/5235), [panel](https://www.siliconchip.com.au/Shop/11/5237) |
| 2/2022 y 3/2022 | Dual Hybrid PSU (P. Prosser) | 2 × 25 V / 5 A, serie o tracking | [Pt1](https://www.siliconchip.com.au/Issue/2022/February/Dual+Hybrid+Power+Supply+%E2%80%93+Pt1) |
| 10/2022 y 9/2023 (Mk2) | 30 V 2 A Bench Supply (J. Clarke) | 0-30 V / 0-2 A; lineal; ruido < 8 mVrms a 2 A | [Pt1 2022](https://siliconchip.com.au/Issue/2022/October/30V+2A+Bench+Supply%2C+Part+1), [Mk2](https://www.siliconchip.com.au/Issue/2023/September/30V+2A+Bench+Supply%2C+Mk2+%E2%80%93+Pt1) |
| 6/2010 y 7/2010 | Dual-Tracking ±19 V (N. Vinen) | ±0-19 V / 1.6 A; lineal | [Pt1](https://www.siliconchip.com.au/Issue/SC/2010/June/Dual-Tracking+%C2%B119V+Power+Supply%2C+Pt.1) |

## Candidatas a primera vista (a discutir en el PRD)
Silicon Chip 45 V / 8 A (mejor documentación y mecánica); Elektor VariLab 402 (híbrido); Elektor Professional Lab PSU 2014 (módulos aislados desde ATX); Elektor Low-Noise 2025 (lineal puro, 1 A por canal); Silicon Chip 30 V 2 A (la más cercana al requisito de 0-30 V / 2 A).
