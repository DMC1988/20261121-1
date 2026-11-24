# 20261121-1 Fuente de laboratorio

## 🎯 Project Overview
Fuente de alimentación de laboratorio DIY con acabado y seguridad de nivel profesional, reutilizando los transformadores disponibles. Prioridad de diseño: seguridad (aislamiento de red, fusibles, tierra, protección contra cortocircuito) antes que cualquier otra función.

## 📌 Status (noviembre 2026)
- Fase actual: investigación de antecedentes (diseños publicados en revistas) e inventario.
- Próximo paso: PRD y selección de arquitectura. Ver [`docs/Investigacion_fuentes_de_laboratorio.md`](docs/Investigacion_fuentes_de_laboratorio.md).

## 🛠 Objetivo de especificaciones (borrador, pendiente de PRD)
| Salida | Requisito |
| :--- | :--- |
| Variable | 0–30 V, 2 A, límite de corriente ajustable |
| Dual fija | 12-0-12 V (±12 V), 1 A |
| Fija | 5 V, 500 mA |

## 📦 Inventario de transformadores
| Transformador | Secundarios | Potencia |
| :--- | :--- | :--- |
| Toroidal | 38-0-38 V; 19-0-19 V; 14-0-14 V; 0-7 V | Sin marcar (a medir) |
| Rectangular ("cuadrado") | 13-0-13 V; 12-0-12 V | Sin marcar (a medir) |

## 📂 Project Structure
- `/hardware`: proyecto KiCad (esquemáticos, PCB, BOM). Librerías propias en `hardware/libraries/`.
- `/mechanical`: gabinete, frontal y soportes.
- `/simulation`: simulaciones LTspice.
- `/measurements`: mediciones de laboratorio (incluye caracterización de los transformadores).
- `/docs`: PRD, investigación, ADRs (`docs/decisions/`), datasheets.
- `/fabrication-outputs`: snapshot de Gerbers/BOM/Pick&Place por revisión.
- `/3d-renders`: renders/fotos.
- `/scripts`: scaffolding y tagging de revisiones.
(No se incluye `/firmware`: se crea solo si la arquitectura elegida usa microcontrolador.)

See `REV_CONVENTION.md` for the revision convention and `CHANGELOG.md` for history.

---
## About NYQUEN LABS
Hardware, firmware, and mechanical design services. Contact: damian.m.caputo@gmail.com

*Developed in Córdoba, Argentina.*
